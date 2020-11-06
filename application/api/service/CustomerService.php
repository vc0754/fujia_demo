<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-06
 * Time: 20:33
 */

namespace app\api\service;


use app\api\model\Bill;
use app\api\model\CardBill;
use app\api\model\CardInfo;
use app\api\model\ChargeType;
use app\api\model\Contract as ContractModel;
use app\api\model\Contract;
use app\api\model\Customer as CustomerModel;
use app\api\model\Customer;
use app\api\model\Feedback;
use app\api\model\Housing;
use app\api\model\HousingMeter;
use app\api\model\OnlineOrder;
use app\api\model\PaymentRecord;
use app\api\model\PaymentRecordDetail;
use app\api\model\PowerPriceType;
use app\api\model\RepairApplication;
use app\api\model\TimingBill;
use app\api\model\WaterPriceType;
use app\lib\enum\BillSource;
use app\lib\enum\BillState;
use app\lib\enum\BillType;
use app\lib\enum\CardStatus;
use app\lib\enum\ContractStatus;
use app\lib\enum\HousingType;
use app\lib\enum\ListBillType;
use app\lib\enum\MeterType;
use app\lib\enum\OnlinePayType;
use app\lib\enum\OperatorType;
use app\lib\enum\OrderStatus;
use app\lib\enum\PayChannel;
use app\lib\enum\RepairStatus;
use app\lib\exception\common\HandleException;
use app\lib\exception\common\ParameterException;
use app\lib\exception\token\ForbiddenException;
use app\lib\exception\token\TokenException;
use app\lib\token\Token;
use think\Db;


class CustomerService
{
    public $customer = null;

    public function __construct()
    {
        //本地调试
//        $customer = CustomerModel::get('1677069ae5aa11ea820cb179db1475b7');
//        $this->customer = $customer;

        $openID = Token::getCurrentWxOpenID();
        $authCache = cache($openID);
        if (is_array($authCache)) {
            if (array_key_exists('customer_id', $authCache)) {
                $customerID = $authCache['customer_id'];
            } else {
                throw new ForbiddenException([
                    'msg' => '您未正式入住,暂不支持该功能'
                ]);

            }
            $customer = CustomerModel::get($customerID);
            $this->customer = $customer;
        } else {
            throw new ForbiddenException;
        }
    }

    private function getAvailableContract()
    {
        $contract = ContractModel::where('customer_fid', $this->customer->fid)
            ->where('status', ['=', ContractStatus::EXECUTING], ['=', ContractStatus::WAITING_FINISH], 'or')->find();
        return $contract;
    }


    /**
     * 获取待缴费账单列表
     * @param int $page
     * @param int $size
     * @return \think\Paginator
     */
    public function getUnpaidBill($page = 1, $size = 15)
    {

        $filter[] = ['state', '=', BillState::UNPAID];
        $filter[] = ['customer_fid', '=', $this->customer->fid];
        $filter[] = ['type', 'IN', [BillType::RECEIVABLES, BillType::RELIEFORDER]];
        $result = Bill::getBillByCid($filter, $page, $size);

        if ($result->isEmpty()) {
            return ['data' => []];
        }

        $data = $result->toArray();

        foreach ($data['data'] as $key => $value) {
            $tempData[$key] = [
                'id' => $value['id'],
                'fid' => $value['fid'],
                'type' => $value['type'],
                'create_time' => $value['create_time'],
                'housing_name' => $value['housing']['name'],
                'total' => $value['total'],
                'paid_balance' => $value['paid_balance'],
                'unpaid_balance' => $value['unpaid_balance']
            ];

            foreach ($value['detail'] as $k => $v) {
                $tempData[$key]['detail'][$k] = [
                    'name' => $v['charge_type']['name'],
                    'amount' => $v['amount']
                ];
            }
        }

        $data['data'] = $tempData;
        return ['data' => $data];
    }

    /**
     * 获取历史缴费列表
     * @param $start_date
     * @param $end_date
     * @param int $page
     * @param int $size
     * @return \think\Paginator
     */
    public function getBill($start_date, $end_date, $page = 1, $size = 15)
    {

        $filter[] = ['state', '=', BillState::PAID];
        $filter[] = ['customer_fid', '=', $this->customer->fid];
        $filter[] = ['type', 'IN', [BillType::RECEIVABLES, BillType::RELIEFORDER]];
        $filter[] = ['create_time', 'between time', [$start_date, $end_date]];

        //月份搜索
        $result = Bill::getBillByCid($filter, $page, $size);
        if ($result->isEmpty()) {
            return ['data' => []];
        }

        $data = $result->toArray();
        foreach ($data['data'] as $key => $value) {
            $tempData[$key] = [
                'id' => $value['id'],
                'fid' => $value['fid'],
                'create_time' => $value['create_time'],
                'housing_name' => $value['housing']['name'],
                'total' => $value['total']
            ];

            foreach ($value['detail'] as $k => $v) {
                $tempData[$key]['detail'][$k] = [
                    'name' => $v['charge_type']['name'],
                    'amount' => $v['amount']
                ];
            }
        }

        $data['data'] = $tempData;
        return ['data' => $data];
    }

    /**
     * 获取当前商户待缴费用总额数，本月账单总额数
     * @return array
     */
    public function getPendingStatistics()
    {

        $filter[] = ['type', '=', BillType::RECEIVABLES];
        $filter[] = ['state', '=', BillState::UNPAID];
        $filter[] = ['customer_fid', '=', $this->customer->fid];
        $unpaidTotal = Bill::where($filter)->sum('unpaid_balance');

        //本月账单总额（只算应收单）
        $arrWhere[] = ['type', '=', BillType::RECEIVABLES];
        $arrWhere[] = ['state', 'IN', [BillState::UNPAID, BillState::PAID]];
        $arrWhere[] = ['customer_fid', '=', $this->customer->fid];
        $monthTotal = Bill::where($arrWhere)->whereTime('create_time', 'month')->sum('total');

        return ['upaid_total' => $unpaidTotal, 'monthTotal' => $monthTotal];
    }

    /**
     * 一键缴费，预支付账单
     *
     * @throws ForbiddenException
     */
    public function prePayAccount($billFids)
    {

        $filter[] = ['fid', 'IN', $billFids];
        $filter[] = ['state', '=', BillState::UNPAID];//未支付

        $list = Bill::where($filter)->select();

        if ($list->isEmpty()) {
            throw new ParameterException([
                'msg' => '找不到应收单'
            ]);
        }

        $billTotalAmountTemp = [];
        //是否有减免单
        $tag = false;
        foreach ($list as $k => $v) {
            //判断账单与用户是否匹配

            if ($v->customer_fid != $this->customer->fid) {
                throw new ParameterException([
                    'msg' => '单据与用户不匹配'
                ]);
            }

            if ($v->type == BillType::RELIEFORDER) {
                $tag = true;
            }

            //$billTotalAmountTemp[$k] = $v->total;
            $billTotalAmountTemp[$k] = $v->unpaid_balance;
        }

        //源单据：总金额
        $billTotalAmount = array_sum($billTotalAmountTemp);

        if ($billTotalAmount < 0) {
            throw new ParameterException([
                'msg' => '支付金额必须大于等于0'
            ]);
        }

        if ($billTotalAmount > 10000) {
            throw new HandleException([
                'msg' => '缴费金额过大,请到服务厅办理'
            ]);
        }

        if ($billTotalAmount == 0) {
            //有减免单且总支付金额为0，不生成线上支付订单
            if ($tag) {
                return [];
            } else {
                throw new ParameterException([
                    'msg' => '账单异常错误'
                ]);
            }
        }

        $data = [
            'order_no' => makePaySn($this->customer->fid),
            'pay_channel' => PayChannel::WECHAT,
            'pay_type' => OnlinePayType::MINIPRO,
            'bill_source' => BillSource::BILL,
            'bill_remark' => json_encode(['customer_fid' => $this->customer->fid, 'bill_fids' => $billFids]),
            'payment_amount' => $billTotalAmount,
            'order_status' => OrderStatus::UNPAID,
            'member_id' => Token::getCurrentMID()

        ];

        $onlineOrderModel = new OnlineOrder();
        $onlineOrderModel->save($data);

        return $onlineOrderModel->id;
    }

    /**
     * 充值水电费，预支付账单
     * @param $billTotalAmount
     * @return mixed
     * @throws ForbiddenException
     * @throws \app\lib\exception\token\TokenException
     * @throws \think\Exception
     */
    public function payMyAccountBalance($amount)
    {

        if ($amount <= 0) {
            throw new ParameterException([
                'msg' => '充值金额必须大于0'
            ]);
        }

        $data = [
            'order_no' => makePaySn($this->customer->fid),
            'pay_channel' => PayChannel::WECHAT,
            'pay_type' => OnlinePayType::MINIPRO,
            'bill_source' => BillSource::RECHARGE,
            'bill_remark' => json_encode(['customer_fid' => $this->customer->fid]),
            'payment_amount' => $amount,
            'order_status' => OrderStatus::UNPAID,
            'member_id' => Token::getCurrentMID()

        ];

        $onlineOrderModel = new OnlineOrder();
        $onlineOrderModel->save($data);

        return $onlineOrderModel->id;
    }

    /**
     * 获取当前商户信息
     * @return object
     * @throws ParameterException
     */
    public function getInfo()
    {
        $contractStatus[] = ['status', 'IN', [ContractStatus::EXECUTING, ContractStatus::WAITING_FINISH]];
        $customerObj = Customer::getInfoByFID($this->customer->fid, $contractStatus);

        if (!$customerObj) {
            throw new ParameterException([
                'msg' => '用户找不到'
            ]);
        }
        return $customerObj;
    }

    /**
     * 获取水电余额展示信息
     * @return mixed
     * @throws ParameterException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getHydropowerBalance()
    {

        $customerArr = $this->getInfo()->toArray();

        $data['meter']['amount'] = $customerArr['balance'];

        if (empty($customerArr['contract'])) {
            $data['meter']['detail'] = '';
        } else {
            $housing = [];
            foreach ($customerArr['contract'] as $key => $value) {
                $housing[$key] = $value['housing']['name'];
            }
            $data['meter']['detail'] = implode('、', $housing);
        }

        $arrWhere[] = ['customer_fid', '=', $this->customer->fid];
        $arrWhere[] = ['status', '=', CardStatus::ACTIVE];
        $cardList = CardInfo::where($arrWhere)->select();

        if ($cardList->isEmpty()) {
            $data['card'] = [
                'amount' => '0',
                'detail' => ''
            ];
        } else {
            foreach ($cardList as $k => $v) {
                $totalTemp[$k] = $v->balance;
                $cardNoArr[$k] = $v->card_no;
            }

            $total = array_sum($totalTemp);
            $detail = implode('、', $cardNoArr);
            $data['card'] = [
                'amount' => (string)$total,
                'detail' => $detail
            ];
        }

        return $data;
    }

    /**
     * 获取客户全部房源的水电表当前信息
     * @return array
     * @throws ParameterException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getMeterDetail()
    {

        $customerArr = $this->getInfo()->toArray();

        if (empty($customerArr['contract'])) {
            return ['total' => '0', 'data' => []];
        }

        $housing = [];
        foreach ($customerArr['contract'] as $key => $value) {
            $housing[$value['housing']['id']] = $value['housing']['name'];
        }

        $housingIds = array_keys($housing);

        $obj = HousingMeter::with(['meter' => ['meterCurrentData', 'takeMeterData']])->where('housing_id', 'IN', $housingIds)->select();

        if ($obj->isEmpty()) {
            return ['total' => '0', 'data' => []];
        }

        $list = $obj->toArray();
        $data = [];
        foreach ($list as $k => $v) {
            $data[$v['housing_id']][] = [
                'housing_name' => $housing[$v['housing_id']],
                'meter_id' => $v['meter_id'],
                'meter_type' => $v['meter']['meter_type'],
                'price_type_id' => $v['meter']['price_type_id'],
                'bill_generate_time' => $v['meter']['meter_current_data']['bill_generate_time'],
                'last_meter_read_time' => $v['meter']['meter_current_data']['last_meter_read_time'],
                'prev_meter_degree' => $v['meter']['meter_current_data']['prev_meter_degree'],
                'current_meter_degree' => $v['meter']['meter_current_data']['current_meter_degree'],
                'degree' => $v['meter']['take_meter_data']['degree'],
                'price' => 0.00
            ];
        }

        $total = 0;

        foreach ($data as $key => $value) {
            foreach ($value as $vk => $item) {
                if ($item["meter_type"] == MeterType::POWER_METER) {
                    $data[$key][$vk]['price'] = PowerPriceType::where('id', '=', $item["price_type_id"])->value('price');
                } elseif ($item["meter_type"] == MeterType::WATER_METER) {
                    $data[$key][$vk]['price'] = WaterPriceType::where('id', '=', $item["price_type_id"])->value('price');
                }

//                if ($item["bill_generate_time"] >= $item["last_meter_read_time"]) {
//                    $temp = bcmul(bcsub($item['degree'], $item['current_meter_degree'], 2), $data[$key][$vk]['price'], 2);
//                }
//
//                if ($item["bill_generate_time"] < $item["last_meter_read_time"]) {
                    $temp = bcmul(bcsub($item['degree'], $item['prev_meter_degree'], 2), $data[$key][$vk]['price'], 2);
//                }

                $total = $total + $temp;

            }
        }

        return ['total' => (string)$total, 'data' => $data];
    }

    /**
     * 获取水卡卡包信息
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getCardList()
    {

        $arrWhere[] = ['customer_fid', '=', $this->customer->fid];
        $arrWhere[] = ['status', '=', CardStatus::ACTIVE];
        $result = CardInfo::where($arrWhere)->select();

        if ($result->isEmpty()) {
            return [];
        }
        return $result;
    }

    /**
     * 获取水电表扣费明细
     * @param $start_date
     * @param $end_date
     * @param $page
     * @param $size
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function getBalanceMeter($params)
    {

        $filter[] = ['customer_fid', '=', $this->customer->fid];
        $filter[] = ['create_time', 'between time', [$params['start_date'], $params['end_date']]];
        $filter[] = ['list_bill_type', '=', ListBillType::DEDUCT];

        $result = TimingBill::with(
            ['housingMeter' => function ($query) {
                $query->with('housing');
            }]
        )->where($filter)->order('create_time', 'DESC')->paginate($params['size'], false, ['page' => $params['page']])->toArray();

        $tempMeterEnum = [
            MeterType::POWER_METER => '电表',
            MeterType::WATER_METER => '水表'
        ];

        if (!empty($result['data'])) {

            $data = [];
            foreach ($result['data'] as $key => $value) {
                $data[$key] = [
                    'id' => $value['id'],
                    'amount' => $value['amount'],
                    'meter_type' => $value['meter_type'],
                    'meter_degree' => $value['meter_degree'],
                    'meter_name' => $tempMeterEnum[$value['meter_type']],
                    'housing_name' => isset($value['housing_meter']['housing']['name']) ? $value['housing_meter']['housing']['name'] : '',
                    'consume' => ($value['meter_type'] == MeterType::POWER_METER) ? '消耗' . $value['quantity'] . '度' : '消耗' . $value['quantity'] . '吨',
                    'meter_take_time' => $value['meter_take_time'],
                    'create_time' => $value['create_time'],
                    'remark' => $value['remark']
                ];
            }

            $result['data'] = $data;
        }

        return $result;
    }

    /**
     * 获取水卡消费明细记录列表
     * @param $start_date   开始时间
     * @param $end_date 结束时间
     * @param $page  当前页
     * @param $size  分页数量
     * @param $list_bill_type 查询类型
     * @param $card_id 查询某一张水卡信息 默认''查询全部
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function getCardBillDetails($params)
    {

        $filter[] = ['customer_fid', '=', $this->customer->fid];

        if (isset($params['card_id']) && $params['card_id'] != '') {
            $filter[] = ['card_id', '=', $params['card_id']];
        }

        if (isset($params['list_bill_type']) && $params['list_bill_type'] != '') {
            $filter[] = ['list_bill_type', '=', $params['list_bill_type']];
        }

        $filter[] = ['create_time', 'between time', [$params['start_date'], $params['end_date']]];

        $data = CardBill::where($filter)->order('create_time', 'DESC')->paginate($params['size'], false, ['page' => $params['page']])->toArray();

        $tempEnum = [
            ListBillType::DEDUCT => '水卡消费',
            ListBillType::INCREASE => '水卡充值',
            ListBillType::REFUND => '退款减少',
            ListBillType::LOST_CHANGE_CARD => '挂失换卡',
            ListBillType::MORE_CHARGE_MORD_REFUND => '多充多退'
        ];

        if (!empty($data['data'])) {
            foreach ($data['data'] as $key => $value) {
                $data['data'][$key]['list_bill_type_name'] = $tempEnum[$value['list_bill_type']];
            }
        }

        //汇总1扣减  2充值 3退款
        $totalDeduction = CardBill::where($filter)->where('list_bill_type', '=', ListBillType::DEDUCT)->sum('amount');
        $totalRecharge = CardBill::where($filter)->where('list_bill_type', '=', ListBillType::INCREASE)->sum('amount');
        $totalRefund = CardBill::where($filter)->where('list_bill_type', 'IN', [ListBillType::REFUND, ListBillType::MORE_CHARGE_MORD_REFUND])->sum('amount');

        return ['total' => ["recharge" => $totalRecharge, "deduction" => $totalDeduction, "refund" => $totalRefund], 'data' => $data];
    }

    /**
     * 获取水卡消费统计列表
     * @param $year   查询年份
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function getCardBillGroup($year)
    {

        //按月份汇总
        $data = Db::query("select sum(case when list_bill_type=" . ListBillType::DEDUCT . " then amount else 0 end) as deduction,
                            sum(case when list_bill_type=" . ListBillType::INCREASE . " then amount else 0 end) as recharge,
                            sum(case when list_bill_type=" . ListBillType::REFUND . " or list_bill_type=" . ListBillType::MORE_CHARGE_MORD_REFUND . " then amount else 0 end) as refund,
                            DATE_FORMAT(create_time, '%Y年%m月') as datestr 
                            from t_card_bill where DATE_FORMAT(create_time, '%Y')='{$year}' and customer_fid={$this->customer->fid} and `t_card_bill`.`delete_time` IS NULL 
                            group by DATE_FORMAT(create_time, '%Y-%m') ");

        //按年份汇总
        $total = Db::query("select sum(case when list_bill_type=" . ListBillType::DEDUCT . " then amount else 0 end) as deduction,
                              sum(case when list_bill_type=" . ListBillType::INCREASE . " then amount else 0 end) as recharge,
                              sum(case when list_bill_type=" . ListBillType::REFUND . " or list_bill_type=" . ListBillType::MORE_CHARGE_MORD_REFUND . " then amount else 0 end) as refund,
                              from t_card_bill where DATE_FORMAT(create_time, '%Y')='{$year}' and customer_fid={$this->customer->fid}  and `t_card_bill`.`delete_time` IS NULL ");

        $total = $total[0];
        if (!isset($total["deduction"]) && !isset($total["recharge"]))
            $total = ["deduction" => 0, "recharge" => 0];

        return ['total' => $total, 'data' => $data];
    }


    /**
     * 获取账单明细列表
     * @param $params
     * @param $page
     * @param $size
     * @return array
     * @throws ForbiddenException
     */
    public function getBills($params, $page, $size)
    {

        $filter[] = ['state', '=', BillState::PAID];
        $filter[] = ['customer_fid', '=', $this->customer->fid];
        //$filter[] = ['type','IN',[BillType::RECEIVABLES,BillType::RELIEFORDER]];

        if (isset($params['housing_fid'])) {
            $filter[] = ['housing_fid', '=', $params['housing_fid']];
        }
        if (isset($params['start_date'])) {
            if (isset($params['end_date'])) {
                $filter[] = ['create_time', 'between time', [$params['start_date'], $params['end_date']]];
            }
        }

        $list = Bill::getBillByCid($filter, $page, $size)->toArray();
        $total = Bill::with('housing')->where($filter)->sum('total');

        if (!empty($list['data'])) {
            $tempData = [];
            foreach ($list['data'] as $key => $value) {
                $tempData[$key] = [
                    'id' => $value['id'],
                    'fid' => $value['fid'],
                    'create_time' => $value['create_time'],
                    'housing_name' => $value['housing']['name'],
                    'total' => $value['total']
                ];
            }
            $list['data'] = $tempData;
        }

        return ['total' => number_format($total, 2), 'data' => $list];
    }

    /**
     * 获取账单记录详情
     * @param $bid
     * @return array
     * @throws ParameterException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getBillInfo($bid)
    {

        $filter[] = ['id', '=', $bid];

        $obj = Bill::with(['detail' => function ($query) {
            $query->with(['chargeType']);
        }, 'housing'])->where($filter)->find();

        if (!$obj) {
            throw new ParameterException([
                'msg' => '找不到该账单记录'
            ]);
        }
        $arr = $obj->toArray();

        $res = PaymentRecordDetail::with('paymentRecord')->where('bill_fid', '=', $arr['fid'])->find();

        if (empty($res)) {
            throw new ParameterException([
                'msg' => '找不到收费单据单体'
            ]);
        } else {
            $res = $res->toArray();
            if (empty($res['payment_record'])) {
                throw new ParameterException([
                    'msg' => '找不到收费单据单头'
                ]);
            } else {
                $arr['payment_no'] = $res['payment_record']['payment_no'];
                $arr['payment_time'] = $res['payment_record']['create_time'];
            }
        }

        $data = [
            'id' => $arr['id'],
            'fid' => $arr['fid'],
            'type' => $arr['type'],
            'create_time' => $arr['create_time'],
            'housing_name' => $arr['housing']['name'],
            'total' => $arr['total'],
            'payment_no' => $arr['payment_no'],
            'payment_time' => $arr['payment_time']
        ];

        foreach ($arr['detail'] as $k => $v) {
            $data['detail'][$k] = [
                'name' => $v['charge_type']['name'],
                'amount' => $v['amount']
            ];
        }

        return $data;
    }

    /**
     * 获取客户当前拥有的房源信息
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getHousing($all = false)
    {

        if ($all) {
            $list = ContractModel::with('housing')->distinct(true)->field('housing_fid')->where('customer_fid', $this->customer->fid)->select();
        } else {
            $list = ContractModel::with('housing')->where('customer_fid', $this->customer->fid)
                ->where('status', ['=', ContractStatus::EXECUTING], ['=', ContractStatus::WAITING_FINISH], 'or')->select();
        }
        if ($list->isEmpty()) {
            return [];
        }
        $arrList = $list->toArray();
        $result = [];
        foreach ($arrList as $key => $value) {
            $result[$key] = $value['housing'];
        }

        return $result;
    }

    /**
     * 获取水电余额明细列表
     * @return \think\Paginator
     * @throws ForbiddenException
     * @throws \think\exception\DbException
     */
    public function getBalanceMeterTotal($params)
    {

        $filter[] = ['customer_fid', '=', $this->customer->fid];

        $filter[] = ['create_time', 'between time', [$params['start_date'], $params['end_date']]];

        $arrWhere = [];

        $result = [];

        //因为充值没有区分房源，当选择单独房源时，不展示充值项，充值统计总额不因房源改变
        if (isset($params['housing_id']) && $params['housing_id'] != '') {
            $arrWhere[] = ['housing_id', '=', $params['housing_id']];
            $result = TimingBill::hasWhere('housingMeter', function ($query) use ($arrWhere) {
                $query->where($arrWhere);
            })->where($filter)->order('create_time', 'DESC')->paginate($params['size'], false, ['page' => $params['page']])->toArray();

            $tempWhere[] = ['list_bill_type', 'IN', [ListBillType::DEDUCT, ListBillType::REFUND]];
            $totalDeduction = TimingBill::hasWhere('housingMeter', function ($query) use ($arrWhere) {
                $query->where($arrWhere);
            })->where($filter)->where($tempWhere)->sum('amount');

        } else {
            $result = TimingBill::with('housingMeter')->where($filter)->order('create_time', 'DESC')->paginate($params['size'], false, ['page' => $params['page']])->toArray();
            $tempWhere[] = ['list_bill_type', 'IN', [ListBillType::DEDUCT, ListBillType::REFUND]];
            $totalDeduction = TimingBill::where($filter)->where($tempWhere)->sum('amount');
        }

        //汇总
        $totalRecharge = TimingBill::where($filter)->where('list_bill_type', '=', ListBillType::INCREASE)->sum('amount');


        $tempEnum = [
            ListBillType::DEDUCT => '消耗',
            ListBillType::INCREASE => '充值',
            ListBillType::REFUND => '退款'
        ];

        $tempMeterEnum = [
            MeterType::POWER_METER => '电表',
            MeterType::WATER_METER => '水表'
        ];

        $data = [];
        $tempHousingName = '';
        if (!empty($result['data'])) {
            foreach ($result['data'] as $key => $value) {

                $tempBillType = isset($tempEnum[$value['list_bill_type']]) ? $tempEnum[$value['list_bill_type']] : '';
                $tempMeterType = isset($tempMeterEnum[$value['meter_type']]) ? $tempMeterEnum[$value['meter_type']] : '';

                if (array_key_exists('housing_meter', $value) && $value['housing_meter'] != null) {
                    $tempHousingName = Housing::where('id', '=', $value['housing_meter']['housing_id'])->value('name');
                } else {
                    if (array_key_exists('housing_id', $params) && $params['housing_id'] != '') {
                        $tempHousingName = Housing::where('id', '=', $params['housing_id'])->value('name');
                    }
                }


                $data[$key] = [
                    'id' => $value['id'],
                    'amount' => $value['amount'],
                    'housing' => $tempHousingName,
                    'list_bill_type' => $value['list_bill_type'],
                    'type_name' => $tempMeterType . $tempBillType,
                    'create_time' => $value['create_time'],
                    'remark' => $value['remark'],
                    'meter_type' => $value['meter_type'],
                    'meter_type_name' => $tempMeterType
                ];
            }
            $result['data'] = $data;
        }

        return [
            'total' => [
                'recharge' => number_format($totalRecharge, '2'),
                'deduction' => number_format($totalDeduction, '2')
            ],
            'data' => $result
        ];
    }

    /**
     * 余额明细 V2版本接口
     * @version ('v2')
     * @param $params
     * @return array
     * @throws \think\exception\DbException
     */
    public function getBalanceMeterTotalV2($params)
    {
        $filter[] = ['customer_fid', '=', $this->customer->fid];
        if (array_key_exists('date', $params) && $params['date']) {
            $date = $params['date'];
        } else {
            $date = date('Y-m', time());
        }

        $timestamp = strtotime($date);
        $firstDay = date('Y-m-1 00:00:00', $timestamp);

        $mdays = date('t', $timestamp);
        $lastDay = date('Y-m-' . $mdays . ' 23:59:59', $timestamp);

        $filter[] = ['create_time', 'between time', [$firstDay, $lastDay]];

        $tempEnum = [
            ListBillType::DEDUCT => '扣费',
            ListBillType::INCREASE => '充值',
            ListBillType::REFUND => '退款'
        ];

        //查询充值
        $timingBills = TimingBill::where($filter)
            ->field('substring(create_time,1,10) as date,list_bill_type,sum(amount) as total_amount')
            ->group(['list_bill_type', 'substring(create_time,1,10)'])->order('create_time desc')
            ->paginate($params['size'], false, ['page' => $params['page']]);
        if ($timingBills->isEmpty()) {
            return [
                'total' => [
                    'recharge' => 0,
                    'deduction' => 0
                ],
                'data' => []
            ];
        }
        $timingBills = $timingBills->toArray();
        $totalRecharge = 0;
        $totalDeduction = 0;
        $timingBills['data'] = array_map(function ($v) use ($tempEnum, &$totalRecharge, &$totalDeduction) {
            $v['list_bill_type_str'] = $tempEnum[$v['list_bill_type']];
            if ($v['list_bill_type'] == ListBillType::INCREASE) {
                $totalRecharge += $v['total_amount'];
            }
            if ($v['list_bill_type'] == ListBillType::DEDUCT) {
                $totalDeduction += $v['total_amount'];
            }
            return $v;
        }, $timingBills['data']);


        return [
            'total' => [
                'recharge' => number_format($totalRecharge, '2'),
                'deduction' => number_format($totalDeduction, '2')
            ],
            'data' => $timingBills
        ];
    }


    /**
     * 某日余额消费明细
     * @version ('v2')
     */
    public function getBalanceDeductDetailV2($date)
    {
        $filter[] = ['customer_fid', '=', $this->customer->fid];
        $timestamp = strtotime($date);
        $firstDay = date('Y-m-d' . ' 00:00:00', $timestamp);
        $lastDay = date('Y-m-d' . ' 23:59:59', $timestamp);
        $filter[] = ['t.create_time', 'between time', [$firstDay, $lastDay]];
        $result = TimingBill::alias('t')
            ->where($filter)
            ->where('t.list_bill_type', ListBillType::DEDUCT)
            ->join('t_housing_meter_relation r', 't.meter_id = r.meter_id')
            ->join('t_housing h', 'h.id = r.housing_id')
            ->field('r.housing_id,h.name,t.list_bill_type,sum(t.amount) as total_amount')
            ->group('r.housing_id')
            ->select();
        if ($result->isEmpty()) {
            return [];
        }
        return $result;
    }

    /**
     * 获取水电余额明细统计列表
     * @param $year   查询年份
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function getBalanceMeterGroup($year)
    {

        //按月份汇总
        $data = Db::query("select sum(case when list_bill_type=" . ListBillType::DEDUCT . " or list_bill_type=" . ListBillType::REFUND . " then amount else 0 end) as deduction,
                            sum(case when list_bill_type=" . ListBillType::INCREASE . " then amount else 0 end) as recharge,
                            DATE_FORMAT(create_time, '%Y年%m月') as datestr 
                            from t_timing_bill where DATE_FORMAT(create_time, '%Y')='{$year}' and customer_fid={$this->customer->fid} and `t_timing_bill`.`delete_time` IS NULL   
                            group by DATE_FORMAT(create_time, '%Y-%m') ");
        //按年份汇总
        $total = Db::query("select sum(case when list_bill_type=" . ListBillType::DEDUCT . " or list_bill_type=" . ListBillType::REFUND . " then amount else 0 end) as deduction,
                              sum(case when list_bill_type=" . ListBillType::INCREASE . " then amount else 0 end) as recharge
                              from t_timing_bill where DATE_FORMAT(create_time, '%Y')='{$year}' and customer_fid={$this->customer->fid} and `t_timing_bill`.`delete_time` IS NULL  ");
        $total = $total[0];
        if (!isset($total["deduction"]) && !isset($total["recharge"]))
            $total = ["deduction" => 0, "recharge" => 0];

        return ['total' => $total, 'data' => $data];
    }

    /**
     * 获取水电余额明细详情
     * @param $bid
     * @return array
     * @throws ParameterException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getBalanceMeterInfo($bid)
    {

        $filter[] = ['id', '=', $bid];
        $obj = TimingBill::with('housingMeter,housingMeter.housing')->where($filter)->find();
        if (!$obj) {
            throw new ParameterException();
        }

        $tempEnum = [
            ListBillType::DEDUCT => '消耗',
            ListBillType::INCREASE => '充值',
            ListBillType::REFUND => '退款'
        ];

        $tempMeterEnum = [
            MeterType::POWER_METER => '电表',
            MeterType::WATER_METER => '水表'
        ];

        $arr = $obj->toArray();

        $tempBillType = isset($tempEnum[$arr['list_bill_type']]) ? $tempEnum[$arr['list_bill_type']] : '';
        $tempMeterType = isset($tempMeterEnum[$arr['meter_type']]) ? $tempMeterEnum[$arr['meter_type']] : '';

        $result = [
            'list_bill_type' => $arr['list_bill_type'],
            'type_name' => $tempMeterType . $tempBillType,
            'amount' => $arr['amount'],
            'housing_name' => isset($arr['housing_meter']['name']) ? $arr['housing_meter']['name'] : '',
            'create_time' => $arr['create_time'],
            'payment_no' => $arr['bill_no'],
            'meter_type' => $arr['meter_type'],
            'meter_type_name' => $tempMeterType
        ];
        return $result;
    }


    /**
     * 查询报修列表
     * @param $page
     * @param $size
     * @return \think\Paginator
     */
    public function getRepairList($page, $size)
    {
        $filter[] = ['customer_id', '=', $this->customer->id];
        $result = RepairApplication::getPageList($filter, $page, $size);
        $tempRes = $result->toArray();

        $repairTypeNameStr = [
            1 => '电表问题',
            2 => '水表问题',
            3 => '门闸问题',
            4 => '制冷问题',
            5 => '其他问题'
        ];


        if (!empty($tempRes['data'])) {
            $unitList = array_column($tempRes['data'], 'repair_unit');

            $fids = array_unique($unitList);

            $housingEnum = Housing::where('fid', 'IN', $fids)->column('name', 'fid');

            foreach ($tempRes['data'] as $key => $value) {
                $tempRes['data'][$key]['repair_unit'] = isset($housingEnum[$value['repair_unit']]) ? $housingEnum[$value['repair_unit']] : '';
                $tempRes['data'][$key]['repair_type_name'] = isset($repairTypeNameStr[$value['repair_type']]) ? $repairTypeNameStr[$value['repair_type']] : '';
            }

        }

        return $tempRes;
    }

    /**
     * 添加报修信息
     * @param $params
     * @return bool
     */
    public function addRepair($params)
    {

        $contract = $this->getAvailableContract();
        if (!$contract) {
            throw new HandleException([
                'msg' => '您未正式入住,暂不支持该功能'
            ]);
        }

        $params['repair_no'] = config('billPrefix.repair_bill').makePaySn($this->customer->fid);

        $params['customer_id'] = $this->customer->id;
        $model = new RepairApplication();
        $model->save($params);
        return $model->id;
    }

    /**
     * 取消报修申请
     * @param $filter
     * @return bool
     * @throws ParameterException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function cancelRepair($params)
    {
//        $filter[] = ['id', '=', $params['rid']];
//        $filter[] = ['status', '=', RepairStatus::PENDING];
//        $obj = RepairApplication::where($filter)->find();

        $obj = RepairApplication::where('status',RepairStatus::PENDING)
            ->whereOr('status',RepairStatus::QUOTED_PRICE)
            ->whereOr('status',RepairStatus::WAIT_PAID)
            ->find($params['rid']);

        if (!$obj) {
            throw new ParameterException([
                'msg' => '找不到报修申请信息'
            ]);
        }
        $obj->cancel_operator_type = OperatorType::MEMBER;
        $obj->cancel_operator_id = Token::getCurrentMID();
        $obj->cancel_remark = $params['cancel_remark'];
        $obj->status = RepairStatus::CANCEL;


        //当金额大于0时才需要推送
        if($obj->quoted_price > 0){
            $billObj = Bill::where('state',BillState::UNPAID)->where('other_no',$obj->repair_no)->find();
            if($billObj){
                app('kingdee_queue')->pushRepairCancel(['fid'=>$billObj->fid]);
                $billObj->state = BillState::CLOSE;
                $billObj->save();
            }
        }


        return $obj->save();
    }

    /**
     * 获取报修详情
     * @param $filter
     * @return array|null|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getRepairInfo($filter)
    {

        $result = RepairApplication::where($filter)->find();

        if ($result->isEmpty()) {
            return [];
        }

        $housingName = Housing::where('fid', '=', $result->repair_unit)->value('name');
        $result->repair_unit = $housingName;
        return $result;
    }

    /**
     * 报修评价
     * @param $params
     * @return bool
     * @throws ParameterException
     */
    public function evaluationRepair($params){
        $filter[] = ['id', '=', $params['rid']];
        $filter[] = ['status', '=', RepairStatus::OVER];
        $obj = RepairApplication::where($filter)->find();

        if ($obj->isEmpty()) {
            throw new ParameterException([
                'msg' => '找不到报修信息'
            ]);
        }

        $obj->evaluation_status = intval($params['evaluation_status']);
        $obj->evaluation_content = trim($params['evaluation_content']);

        return $obj->save();
    }



    /**
     * 查询反馈列表
     * @param $page
     * @param $size
     * @return \think\Paginator
     */
    public function getFeedbackList($page, $size)
    {

        $filter[] = ['customer_id', '=', $this->customer->id];
        $result = Feedback::getPageList($filter, $page, $size);
        return $result;
    }

    /**
     * 添加反馈信息
     * @param $params
     * @return bool
     */
    public function addFeedback($params)
    {
        $contract = $this->getAvailableContract();
        if (!$contract) {
            throw new HandleException([
                'msg' => '您未正式入住,暂不支持该功能'
            ]);
        }

        $params['customer_id'] = $this->customer->id;
        $model = new Feedback();
        $model->save($params);
        return $model->id;
    }

    /**
     * 获取反馈信息详情
     * @param $filter
     * @return array|null|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getFeedbackInfo($filter)
    {
        $result = Feedback::where($filter)->find();

        if ($result->isEmpty()) {
            return [];
        }
        return $result;
    }


    /**
     * 获取所有合同
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getContract($page, $size)
    {

        $arrWhere[] = ['customer_fid', '=', $this->customer->fid];

        return app('contract')->getContract($page, $size, $arrWhere);
    }


    public function getPaymentList($params, $page, $size)
    {
        $output = [];

        $housing_fid = null;

        if (isset($params['housing_fid'])) {
            $housing_fid = $params['housing_fid'];
        }
        //$filter[] = ['type','IN',[BillType::RECEIVABLES,BillType::RELIEFORDER]];
        $date = $params['date'];
//        PaymentRecord::where('customer_fid',$this->customer->fid)->where('year_months',$params['date'])
        $customerFid = $this->customer->fid;
        $list = PaymentRecordDetail::withJoin(['paymentRecord' => function ($query) use ($customerFid, $date) {
            $query->where('customer_fid', $customerFid)->where('year_months', $date);
        }, 'bill' => function ($query) use ($housing_fid) {
            if (!is_null($housing_fid) && $housing_fid)
                $query->where('housing_fid', $housing_fid);
        }])->visible(['id', 'payment_no', 'bill_no', 'amount', 'remark', 'payment_record.payment_no', 'payment_record.charge_time', 'bill.housing_fid'])->order('charge_time desc')->paginate($size, false, ['page' => $page]);
        if ($list->isEmpty()) {
            return ['total_amount' => 0, 'data' => $output];
        }
        $list = $list->toArray();
        $data = [];
        $totalAmount = 0;
        $list['data'] = array_map(function ($v) use ($data, &$totalAmount) {
            $data['id'] = $v['id'];
            $data['amount'] = $v['amount'];
            $data['remark'] = $v['remark'];
            $data['payment_no'] = $v['payment_record']['payment_no'];
            $data['housing_fid'] = $v['bill']['housing_fid'];
            $data['housing_name'] = Housing::where('fid', $v['bill']['housing_fid'])->value('name');
            $data['date'] = $v['payment_record']['charge_time'];
            $totalAmount = bcadd($totalAmount, $v['amount'], 2);
            return $data;
            }, $list['data']);
        $output['total_amount'] = $totalAmount;
        $output['data'] = $list;
        return $output;
    }


    public function getPaymentInfo($pid)
    {
        $output = [
            'type' => 0,
            'detail' => []
        ];
        $paymentDetail = PaymentRecordDetail::get($pid);
        if (!$paymentDetail) {
            throw new ParameterException();
        }
        $paymentDetail = $paymentDetail->toArray();

        $detailArr = json_decode($paymentDetail['detail_data'], true);
        if (!$detailArr) {
            throw new ParameterException();
        }
        $output['type'] = $detailArr['type'];
        $output['detail'] = $detailArr['details_data'];
        return $output;
    }
}