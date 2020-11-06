<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-09
 * Time: 16:28
 */

namespace app\api\service;

use app\api\dto\account\Operator;
use app\api\dto\account\PaymentDetails;
use app\api\dto\account\Receivables;
use app\api\dto\kingdee\Receivable;
use app\api\dto\kingdee\Recharge;
use app\api\model\BillDetail;
use app\api\model\CardInfo;
use app\api\model\ChargeType;
use app\api\model\Customer;
use app\api\model\CardInfo as CardInfoModel;
use app\api\model\CardBill as CardBillModel;
use app\api\dto\kingdee\ReceivableBill;
use app\api\dto\kingdee\ReceivableDetails;
use app\api\model\OnlineOrder;
use app\api\model\Sysconfig;
use app\lib\enum\OnlinePayType;
use app\lib\enum\OrderStatus;
use app\lib\enum\PayChannel;
use app\lib\enum\RechargeType;
use app\lib\enum\BillType;
use app\lib\enum\TerminalType;
use app\lib\exception\common\ParameterException;
use app\api\model\TimingBill as TimingBillModel;
use app\lib\enum\ListBillType;
use app\lib\exception\common\OrderException;
use think\Db;
use app\lib\enum\BillSource;
use app\lib\enum\BillState;
use app\api\model\Bill;
use app\api\model\PaymentRecord;
use app\api\model\PaymentRecordDetail;
use think\Exception;


class AccountService
{
    /**
     * 生成收费单
     * @param Customer $customer
     * @param Receivables $receivables
     * @param Operator $operator
     * @throws Exception
     */
    public function createReceivables(Customer $customer,Receivables $receivables,Operator $operator)
    {
        $fids = [];
        $indexAmount = [];
        $paidAmount = 0;
        foreach ($receivables->bills as $item) {
            $temp = Bill::where([['fid','=',$item['fid']],['state', '=', BillState::UNPAID]])->field('unpaid_balance,bill_no')->find();
            if(!$temp){
                throw new ParameterException([
                    'msg' => '有异常单据,请检查'
                ]);
            }
            if($item['amount'] > $temp->unpaid_balance){
                throw new ParameterException([
                    'msg' => '单据'.$temp->bill_no.'金额出错'
                ]);
            }
            $fids[] = $item['fid'];
            $indexAmount[] = $item['amount'];
            $paidAmount = bcadd($paidAmount,$item['amount'],2);
            $billAmountList[$item['fid']] = $item['amount'];
        }



//        $paidAmount = array_sum($indexAmount);
        $totalAmount = $receivables->online_wechat+
            $receivables->offline_wechat+
            $receivables->offline_alipay+
            $receivables->offline_by_card+
            $receivables->offline_cash+
            $receivables->online_banking;
        if($paidAmount != (string)$totalAmount){
            throw new ParameterException([
                'msg' => '支付金额与核销金额不一致'
            ]);
        }
        $filter[] = ['fid', 'IN', $fids];
        $filter[] = ['state', '=', BillState::UNPAID];//未支付

        Db::startTrans();
        try{
            $list = Bill::where($filter)->select();

            if($list->isEmpty()){
                throw new ParameterException([
                    'msg' => '找不到该笔应收单或状态已改变'
                ]);
            }

            //$billTotalAmountTemp = [];
            //本次单据详情中项目的当次实缴金额  格式：$x[单据bill_fid][收费项目charge_items_fid] = 实缴金额
            $tempAmount = [];

            foreach ($list as $k=>$v){
                //判断账单与用户是否匹配
                if($v->customer_fid != $customer->fid){
                    throw new ParameterException([
                        'msg' => '单据与用户不匹配'
                    ]);
                }

               // $billTotalAmountTemp[$k] = $v->total;

                //状态更新为已支付
                /*if($v->total == bcadd($v->paid_balance,$indexAmount[$k],2)){
                    $v->state = BillState::PAID;
                }
                $v->paid_balance = bcadd($v->paid_balance,$indexAmount[$k],2);
                $v->unpaid_balance = bcsub($v->total,$v->paid_balance,2);
                $v->save();*/

                if($v->total == bcadd($v->paid_balance,$billAmountList[$v->fid],2)){
                    $v->state = BillState::PAID;
                }
                $v->paid_balance = bcadd($v->paid_balance,$billAmountList[$v->fid],2);
                $v->unpaid_balance = bcsub($v->total,$v->paid_balance,2);
                $v->save();

//                if(!empty($receivables->remark)){
                $billDetails =  BillDetail::where('bill_fid','=',$v->fid)->order('fid asc')->select();

                //$_paidAmount = $v->paid_balance;

                $tempPaidAmount = $billAmountList[$v->fid];

                foreach ($billDetails as $billDetail){
                    $billDetail->remark = $receivables->remark;
                    if($billDetail->amount == $billDetail->paid_balance){
                        continue;
                    }

                    if($billDetail->amount >= 0){
                        if($billDetail->amount > $billDetail->paid_balance){

                            $tempUnPaid = bcsub($billDetail->amount,$billDetail->paid_balance,2);
                            if($tempPaidAmount >= $tempUnPaid){
                                $billDetail->paid_balance = $billDetail->amount;
                                $tempPaidAmount = bcsub($tempPaidAmount,$tempUnPaid,2);
                                $tempCurrentAmount = $tempUnPaid;
                            }else{
                                $billDetail->paid_balance = bcadd($billDetail->paid_balance,$tempPaidAmount,2);
                                $tempCurrentAmount = $tempPaidAmount;
                                $tempPaidAmount = 0;
                            }

                            if($tempCurrentAmount != 0){
                                $tempAmount[$billDetail->fid] = $tempCurrentAmount;
                            }


                        }
                    }else{
                        $tempAmount[$billDetail->fid] = $billDetail->amount;
                        $billDetail->paid_balance = $billDetail->amount;
                    }

                    $billDetail->save();
                }




                /*foreach ($billDetails as $billDetail){
                    $billDetail->remark = $receivables->remark;

                    if($billDetail->amount == $billDetail->paid_balance){
                        continue;
                    }

                    if($billDetail->amount > 0){
                        if($_paidAmount > 0 && $_paidAmount >= $billDetail->amount){

                            $_paidAmount = bcsub($_paidAmount,bcsub($billDetail->amount,$billDetail->paid_balance,2),2);

                            $tempAmount[$billDetail->bill_fid][$billDetail->charge_items_fid] = bcsub($billDetail->amount,$billDetail->paid_balance,2);
                            $billDetail->paid_balance = $billDetail->amount;
                        }elseif($_paidAmount > 0 && $_paidAmount < $billDetail->amount){

                            $tempAmount[$billDetail->bill_fid][$billDetail->charge_items_fid] = bcsub($_paidAmount,$billDetail->paid_balance,2);

                            $billDetail->paid_balance = $_paidAmount;
                            $_paidAmount = 0;
                        }else{

                            continue;
                        }
                    }else{
                        $tempAmount[$billDetail->bill_fid][$billDetail->charge_items_fid] = $billDetail->amount;
                        $billDetail->paid_balance = $billDetail->amount;
                    }

                    $billDetail->save();
                }*/
                   //应收单不加备注 - 改到收费单
//                        ->update(['remark'=>$receivables->remark]);
//                }
            }

            //源单据：总金额
//            $billTotalAmount = array_sum($billTotalAmountTemp);

            //生成订单号
            $billNo = config('billPrefix.payment_bill') . makePaySn($customer->fid);

            $dataTemp = [
                'online_wechat' => floatval($receivables->online_wechat),
                'offline_cash' => floatval($receivables->offline_cash),
                'offline_wechat' => floatval($receivables->offline_wechat),
                'offline_alipay' => floatval($receivables->offline_alipay),
                'offline_by_card' => floatval($receivables->offline_by_card),
                'online_banking' => floatval($receivables->online_banking)
            ];

            //传参数：总金额
//            $paramTotalAmount = array_sum($dataTemp);

            //if(!config('app_debug')){
//                if(bccomp($billTotalAmount,$paramTotalAmount,2) != 0){
//                    throw new ParameterException([
//                        'msg' => '金额账目错误'
//                    ]);
//                }
            //}

            $dataTemp2 = [
                'payment_no' => $billNo,
                'bill_source' => BillSource::BILL,
                'customer_fid' => $customer->fid,
                'total_amount' => $paidAmount,
                'terminal_type' => $operator->terminal_type,
                'operator_id' => $operator->operator_id,
                'client_no' => $operator->client_no,
                'year_months' => date('Ym',$receivables->charge_time),
                'charge_time' => date('Y-m-d H:i:s',$receivables->charge_time)
            ];

            $data = array_merge($dataTemp,$dataTemp2);

            $paymentRecordModel = new PaymentRecord();
            $paymentRecordModel->save($data);
            $paymentRecordId = $paymentRecordModel->id;

            $detailData = [];
            foreach ($list as $key => $value) {
                $detailData[$key]['payment_record_id'] = $paymentRecordId;

                if($value->type == BillType::RECEIVABLES){
                    $detailData[$key]['item_name'] = '应收单';
                }elseif ($value->type == BillType::REFUNDABLE){
                    $detailData[$key]['item_name'] = '应退单';
                }elseif($value->type == BillType::RELIEFORDER){
                    $detailData[$key]['item_name'] = '减免单';
                }

                $detailData[$key]['bill_fid'] = $value->fid;
                $detailData[$key]['bill_no'] = $value->bill_no;
                $detailData[$key]['amount'] = $billAmountList[$value->fid];
                $detailData[$key]['remark'] = $receivables->remark;


                $details = BillDetail::where('bill_fid',$value->fid)->select();
                $detailsDataTemp = [];
                foreach ($details as $k => $detail){
                    //有支付的收费项目才插入数据
                    if(isset($tempAmount[$detail->fid])){
                        $detailsDataTemp[] = [
                            'fid' => $detail->fid,
                            'charge_fid' => $detail->charge_items_fid,
                            'charge_name' => ChargeType::where('fid',$detail->charge_items_fid)->value('name'),
                            'paid_balance' => $tempAmount[$detail->fid],
                            'unpaid_balance' => bcsub($detail->amount,$detail->paid_balance,2),
                            'total_amount' => $detail->amount,
                            'create_time' => $detail->create_time,
                            'remark' => $detail->remark
                        ];
                    }
                }
                $billJsonArr = [
                    'housing_fid' => $value->housing_fid,
                    'housing_name' => \app\api\model\Housing::where('fid',$value->housing_fid)->value('name'),
                    'type' => $value->type,
                    'details_data' => $detailsDataTemp
                ];
                $detailData[$key]['detail_data'] = json_encode($billJsonArr);;
            }
            $paymentRecordDetailModel = new PaymentRecordDetail();
            $paymentRecordDetailModel->saveAll($detailData);

            if($receivables->pay_order_id){

                $payOrder =  OnlineOrder::where('order_no',$receivables->pay_order_id)->find();
                if(!$payOrder){
                    throw new OrderException();
                }

                if($payOrder->pay_type == OnlinePayType::CLIENT){
                    if($receivables->offline_alipay == 0 && $receivables->offline_wechat == 0){
                        throw new OrderException([
                            'msg' => '在线充值订单金额有误'
                        ]);
                    }
                }else{
                    //H5 - 小程序
                    if($receivables->online_wechat == 0){
                        throw new OrderException([
                            'msg' => '在线充值订单金额有误'
                        ]);
                    }
                }

                $payOrder->order_status = OrderStatus::PAID;
                $payOrder->payment_record_id = $paymentRecordId;
                $payOrder->save();
            }
            Db::commit();

        }catch (Exception $ex){
            Db::rollback();
            throw $ex;
        }

        //推送至金蝶
        $this->pushPaymentRecord($paymentRecordId,$operator,$receivables->remark,$tempAmount);
        return $billNo;
    }

    /**
     * 根据传入ID推送账单
     *
     * @param [type] $parmentRecordId
     * @return void
     */
    private function pushPaymentRecord($paymentRecordId,Operator $operator,$remark = '',$tempAmount=[]){

        $obj = PaymentRecord::get($paymentRecordId);

        if($obj->isEmpty()){
            throw new ParameterException([
                'msg' => '传入的收费单ID有误'
            ]);
        }
        $arr = $obj->toArray();

        $arr['remark'] = $remark;
        $arr["operator_name"] =  $operator->operator_name;
        $arr["source"] = ($operator->terminal_type==TerminalType::MINIPRO?"小程序":"客户端");
        $receivableObj = new Receivable($arr);

        $list = PaymentRecordDetail::where('payment_record_id','=',$paymentRecordId)->select()->toArray();

        $objList = [];

        if(empty($list)){
            throw new ParameterException([
                'msg'=> '找不到该账单详情'
            ]);
        }
        foreach($list as $key=>$value){
            $value['fid'] = $value['bill_fid'];
            $tempDetail = BillDetail::where('bill_fid','=',$value['bill_fid'])->select()->toArray();
            foreach ($tempDetail as $k=>$v){
                if(isset($tempAmount[$v['fid']])){
                    $tempDetail[$k]['paid_balance'] = $tempAmount[$v['fid']];
                }else{
                    unset($tempDetail[$k]);
                }
            }

            $tempDetail = array_merge($tempDetail);
            $value['bill_detail'] = $tempDetail;
            $temp = new ReceivableDetails($value);
            $objList[$key] = $temp;
        }

        $data = new ReceivableBill($receivableObj,$objList);

        app('kingdee_queue')->pushPaymentRecord($data);

    }

    /**
     * 完成余额充值
     * 增加余额，生成充值收费单，推送金蝶系统
     * @param Customer $customer
     * @param PaymentDetails $details
     */
    public function rechargeBalance(Customer $customer,PaymentDetails $details,Operator $operator,$refund=false){
        //统计总金额
        $sumDetail = (array) $details;
        unset($sumDetail['pay_order_id']);
        $totalAmount = array_sum($sumDetail);
        if($totalAmount < 0 && !$refund){
            throw new ParameterException([
                'msg' => '金额不可小于0'
            ]);
        }
        Db::startTrans();
        try{
            $prevBalance = $customer->balance;
            //增加客户余额
            $customer->balance = $customer->balance + $totalAmount;
            $customer->save();
            //生成收费单并推送
            $res = $this->makeAndPushRechargeBill($customer,$details,$totalAmount,RechargeType::BALANCE,'',$operator);
            //生成并推送流水账单
            $this->makeUtilityBill($customer,$prevBalance,$totalAmount,$refund);
            if($details->pay_order_id){
                $payOrder =  OnlineOrder::where('order_no',$details->pay_order_id)->find();
                if(!$payOrder){
                    throw new OrderException();
                }
                if($payOrder->pay_type == OnlinePayType::CLIENT){
                    if($details->offline_alipay == 0 && $details->offline_wechat == 0){
                        throw new OrderException([
                            'msg' => '在线充值订单金额有误'
                        ]);
                    }
                }else{
                    //H5 - 小程序
                    if($details->online_wechat == 0){
                        throw new OrderException([
                            'msg' => '在线充值订单金额有误'
                        ]);
                    }
                }

                $payOrder->order_status = OrderStatus::PAID;
                $payOrder->payment_record_id = $res['paymentRecord']->id;
                $payOrder->save();

            }
            Db::commit();
        }catch (Exception $e){
            Db::rollback();
            file_put_contents('error.txt',json_encode($e));
            throw $e;
        }
        app('kingdee_queue')->pushPaymentRecord($res['recharge']);
        return $res['paymentRecord']->payment_no;
    }

    /**
     * 生成水电/水卡收费单并推送
     */
    protected function makeAndPushRechargeBill(Customer $customer,PaymentDetails $details,$totalAmount, $rechargeType,$card_no="",Operator $operator,$remark = ''){
        $paymentRecord = new PaymentRecord();
        $paymentRecord->payment_no = config('billPrefix.payment_bill').makePaySn($customer->fid);
        $paymentRecord->customer_fid = $customer->fid;
        if($rechargeType==RechargeType::MORE_CHARGE_MORD_REFUND)
            $paymentRecord->bill_source = BillSource::WATERCARD;
        else
            $paymentRecord->bill_source = ($rechargeType==RechargeType::BALANCE? BillSource::RECHARGE : BillSource::WATERCARD);
        $paymentRecord->total_amount = $totalAmount;
        $paymentRecord->online_wechat = $details->online_wechat;
        $paymentRecord->offline_cash = $details->offline_cash;
        $paymentRecord->offline_wechat = $details->offline_wechat;
        $paymentRecord->offline_alipay = $details->offline_alipay;
        $paymentRecord->offline_by_card = $details->offline_by_card;
        $paymentRecord->terminal_type = $operator->terminal_type;
        $paymentRecord->operator_id = $operator->operator_id;
        $paymentRecord->client_no = $operator->client_no;
        $paymentRecord->year_months = date('Ym',time());
        $paymentRecord->charge_time = date('Y-m-d H:i:s');
        $paymentRecord->save();

        $paymentRecordDetails = new PaymentRecordDetail();
        $paymentRecordDetails->payment_record_id = $paymentRecord->id;
        if($paymentRecord->total_amount>0)
            $paymentRecordDetails->item_name =($rechargeType==RechargeType::BALANCE?  '水电余额充值' :  '水卡余额充值');
        else
            $paymentRecordDetails->item_name =($rechargeType==RechargeType::BALANCE?  '水电余额退款' :  '水卡余额退款');
        $paymentRecordDetails->save();

        $push = $paymentRecord->toArray();
        $push['payment_date'] = $push['create_time'];
        $push['type'] = $rechargeType;
        $push['card_no'] = $card_no;
        $push['operator_name'] = $operator->operator_name;
        $push['source'] = ($operator->terminal_type==TerminalType::MINIPRO?"小程序":"客户端");
        $push['remark'] = $remark;
        $recharge = new Recharge($push);
        return ['recharge'=>$recharge,'paymentRecord'=>$paymentRecord];
    }

    /**
     * 推送充值流水账单
     */
    protected function makeUtilityBill($customer,$prevBalance,$totalAmount,$refund){
        if(!$refund){
            $listBillType = ListBillType::INCREASE;
        }else{
            $listBillType = ListBillType::REFUND;
        }
        //生成水电充值明细并推送
        $billNo = config('billPrefix.list_meter_bill').makePaySn($customer->fid);
        //生成账单
        $timingBill = [
            'bill_no' => $billNo,
            'quantity' => 0,
            'amount' => $totalAmount,
            'price' => 0,
            'customer_fid' => $customer->fid,
            'meter_id' => 0,
            'list_bill_type' => $listBillType,
            'meter_type' => 0,
            'meter_price_type_id' => 0,
            'balance_before' => $prevBalance,
            'balance_after' =>  $customer->balance
        ];

        $timingBillModel = new TimingBillModel();
        $timingBillModel->save($timingBill);
    }

    public function balanceRefund(Customer $customer,$params, Operator $operator){
        if($params['offline_by_card'] != 0){
            $params['offline_by_card'] = bcsub(0,$params['offline_by_card'],2);
        }

        if($params['offline_cash'] != 0){
            $params['offline_cash'] = bcsub(0,  $params['offline_cash'],2);
        }
        $paymentDetail = new PaymentDetails($params);
        return $this->rechargeBalance($customer,$paymentDetail,$operator,true);
    }

    /*
     * 水卡充值生成账单与推送金蝶  （支持小程序+客户端）
     * */
    public function createCardRechargeBillAndPush($params,Operator $operator,$rechargeType)
    {
        /*   $params参数列表
             $params = [
            'online_wechat'     => 0.00, 线上微信
            'offline_cash'      => 0.00, 线下现金
            'offline_wechat'    => 0.00, 线下微信
            'offline_alipay'    => 0.00, 线下支付宝
            'offline_by_card'   => 0.00, 线下银联
            'pay_order_id'      => '', OnlineOrderModel的id.客户端为空，小程序需要传入
            'card_no' => '', 水卡card_no
            'machine_id' =>''  水控机id 客户端为空 ，小程序需要传入
        ];
        */

        //通过卡号查询
        $cardInfo = CardInfoModel::where('card_no','=',$params["card_no"])->find();
        if($cardInfo->isEmpty()){
            throw new ParameterException([
                'msg' => '传入的水卡号有误'
            ]);
        }

        //获取卡绑定用户信息
        $customer = Customer::where("fid",'=',$cardInfo->customer_fid)->find();
        if($cardInfo->isEmpty()){
            throw new ParameterException([
                'msg' => '传入的水卡号有误'
            ]);
        }

        //支付项目列表
        $paymentItems = [
            'online_wechat' => floatval($params["online_wechat"]),
            'offline_cash' => floatval($params["offline_cash"]),
            'offline_wechat' => floatval($params["offline_wechat"]),
            'offline_alipay' => floatval($params["offline_alipay"]),
            'offline_by_card' => floatval($params["offline_by_card"])
        ];

        //支付总金额
        $paymentTotalAmount = array_sum($paymentItems);
        //转化为dto
        $paymentItems[] = $params["pay_order_id"];
        $details = new PaymentDetails($paymentItems);

        Db::startTrans();
        try{

            $sysconfig = Sysconfig::where('field','card_balance_gift')->find();
            if($sysconfig){
                $config = $sysconfig->value;
                if($config){
                    $remark = '赠送';
                }else{
                    $remark = '';
                }
            }else{
                $remark = '';
            }

            //生成收费单并推送(金蝶会接收收费单，并自动生成流水明细)
            $res = $this->makeAndPushRechargeBill($customer,$details,$paymentTotalAmount,$rechargeType,$params["card_no"],$operator,$remark);
            switch($rechargeType)
            {
                case RechargeType::CARD:
                    if($paymentTotalAmount>0)
                        $listBillType = ListBillType::INCREASE;
                    else
                        $listBillType = ListBillType::REFUND;
                    break;
                case RechargeType::MORE_CHARGE_MORD_REFUND:
                    $listBillType = ListBillType::MORE_CHARGE_MORD_REFUND;
                    break;
            }
            //生成流水明细账单本地保存
            $this->makeCardRechargeBill($cardInfo,$cardInfo->balance-$paymentTotalAmount,$paymentTotalAmount,$params["machine_no"],$listBillType,$remark);

            Db::commit();
        }catch (Exception $e){
            Db::rollback();
            throw $e;
        }
        app('kingdee_queue')->pushPaymentRecord($res['recharge']);
        return $res['paymentRecord']->payment_no;
    }

    /**
     * 生成水卡充值流水明细
     */
    public function makeCardRechargeBill($cardInfo,$prevBalance,$totalAmount,$machine_no,$listBillType,$remark = ''){
        //生成水电充值明细
        $billNo = config('billPrefix.list_card_bill').makePaySn($cardInfo->customer_fid);

        $cardBill = [
            'bill_no' => $billNo,
            'quantity' => 0,
            'amount' => $totalAmount,
            'price' => 0,
            'customer_fid' => $cardInfo->customer_fid,
            'machine_no' => $machine_no,
            'list_bill_type' => $listBillType,
            'balance_before' => $prevBalance,
            'balance_after' =>  $cardInfo->balance,
            'card_no' =>$cardInfo->card_no,
            'remark' => $remark
        ];

        $cardBillModel = new CardBillModel();
        $cardBillModel->save($cardBill);

        return $billNo;
    }

    /**
     * 获取当前用户的水卡充值记录（微信线上）
     * @param $mid
     * @param $page
     * @param $size
     * @return array
     * @throws \think\exception\DbException
     */
    public function getRechargeCardList($mid,$page,$size){

        $filter[] = ['member_id','=',$mid];
        $filter[] = ['bill_source','=',BillSource::WATERCARD];
        $filter[] = ['order_status','=',OrderStatus::PAID];
        $filter[] = ['pay_channel','=',PayChannel::WECHAT];
        $filter[] = ['pay_type','=',OnlinePayType::MINIPRO];
        $filter[] = ['card_status','>',0];

        $result = OnlineOrder::where($filter)->paginate($size,false,['page'=>$page])->toArray();

        if(!empty($result['data'])){

            $cardStatusEnum = [
                1 => '待充卡',
                2 => '充卡成功',
                3 => '充卡失败',
                4 => '已退款'
            ];

            $data = [];
            foreach ($result['data'] as $rk => $rv){

                $temp = json_decode($rv['bill_remark'],true);

                $data[$rk] = [
                    'id' => $rv['id'],
                    'card_no' => isset($temp['card_no']) ? $temp['card_no'] : '',
                    'amount' => $rv['payment_amount'],
                    'status' => $rv['card_status'],
                    'status_name' => isset($cardStatusEnum[$rv['card_status']]) ? $cardStatusEnum[$rv['card_status']] : '',
                    'create_time' => $rv['create_time'],
                ];
            }
            $result['data'] = $data;
        }

        return $result;
    }

    /**
     * 获取当前用户的水卡充值记录详情（微信线上）
     * @param $oid
     * @return array
     * @throws ParameterException
     */
    public function getRechargeCardDetail($oid){

        $order = OnlineOrder::get($oid);
        if(!$order){
            throw new ParameterException([
                'msg' => '找不到订单'
            ]);
        }


        $cardStatusEnum = [
            1 => '待充卡',
            2 => '充卡成功',
            3 => '充卡失败',
            4 => '已退款'
        ];

        $temp = json_decode($order->bill_remark,true);

        $machineNo = isset($temp['machine_no']) ? $temp['machine_no'] : '';
        $cardNo = isset($temp['card_no']) ? trim($temp['card_no']) : '';

        $customerName = '';
        if($cardNo != ''){
            $customerFid = CardInfo::where('card_no','=',$cardNo)->value('customer_fid');
            $customer = Customer::where('fid','=',$customerFid)->find();
            if($customer){
                $customerName = $customer->name;
            }
        }

        $data = [
            'create_time' => $order->create_time,
            'amount' => $order->payment_amount,
            'customer_name' => $customerName,
            'status_name' => isset($cardStatusEnum[$order->card_status]) ? $cardStatusEnum[$order->card_status] : '',
            'machine_no' => $machineNo,
            'card_no' => $cardNo,
            'order_no' => $order->order_no,
            'third_orderid' => $order->third_orderid
        ];

        return $data;

    }


}