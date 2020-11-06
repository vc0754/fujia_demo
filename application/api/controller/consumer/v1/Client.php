<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-11
 * Time: 11:25
 */

namespace app\api\controller\consumer\v1;

use app\api\dto\account\Operator;
use app\api\dto\account\PaymentDetails;
use app\api\dto\account\Receivables;
use app\api\dto\pay\PayBarcodeDto;
use app\api\model\CardInfo;
use app\api\model\CardInfoTemp;
use app\api\model\Customer;
use app\api\model\Machine;
use app\api\model\Customer as CustomerModel;
use app\api\model\PaymentRecord;
use app\api\model\Bill;
use app\api\model\Sysconfig;
use app\lib\enum\BillSource;
use app\lib\enum\ContractStatus;
use app\api\model\Contract;
use app\lib\enum\FlowType;
use app\lib\enum\OnlinePayType;
use app\lib\enum\TerminalType;
use app\lib\exception\common\HandleException;
use app\lib\exception\common\ParameterException;
use app\lib\exception\token\ForbiddenException;
use app\lib\token\Token;

use think\helper\Time;
use think\Db;
use think\Exception;

use think\Request;

/**
 * 对接客服中心客户端接口
 * Class ClientController
 * @package app\api\controller\rpc
 */
class Client
{
    //region 水卡服务API
    /**
     * 支付
     * @param Request $request
     * @return \think\response\Json
     */
    public function pay(Request $request){
        //调用支付逻辑
        $params = $request->post();
        $params['pay_type'] = OnlinePayType::CLIENT;
        $dto = new PayBarcodeDto($params);
        $result =  app('pay')->createOrderAndPayBarcode($dto);
        return show(200,$result);
    }

    /**
     * 第三方系统唯一orderID，不是自己生成的
     * @param('third_orderid','支付平台订单ID','require')
     * @param Request $request
     * @return \think\response\Json
     */
    public function queryOrder(Request $request){
        $post = $request->post();
        $result =  app('pay')->queryOrder($post['barcode'],$post['third_orderid']);
        return show(200,$result);
    }

    /**
     * 添加设备信息
     */
    public function addMachine(Request $request){
        $post = $request->post();
        $machine = new Machine();
        $machine->save($post);
        return show(200,$machine,'insert success');
    }
    /**
     * 更新设备信息
     */
    public function updateMachine(Request $request)
    {
        $params = $request->put();
        $machine = new Machine();
        $machine->allowField(['machine_no','machine_ip','port'])->save($params,['id'=> $params['id']]);
        return show(200,$machine,'update success');
    }

    /**
     * 根据
     */
    public function getCardInfo($card_no){
        $m = new CardInfo();
        $row = $m->where('card_no',$card_no)->find();
        if ($row == null){
            return show(200,$row,'card not found',-1);
        }
        return show(200,$row,'get card info success');
    }



    /**
     * 获取卡原始信息
     */
    public function getCardInfoTemp(Request $req){
        //$req->params('serial_num');
        //input();
        //input('get.')

        $cardInfoTemp = new CardInfoTemp();
        $row = $cardInfoTemp->where('serial_num',$req->get('serial_num'))->find();
        if($row == null){
            return show(201,$row,'not card info temp found',-1);
        }
        return show(201,$row,'get card info temp success');
    }

    /**
     * 预开卡业务
     * @param Request $request
     */
    public function preRegister(Request $request){
        //1、检测卡片物理地址 2、验证客户表FID
        $post = $request->post();
        $transaction_no = app('card')->preRegister($post);
        return show(200,["transaction_no" => $transaction_no],'pre_register card success');
    }
    /**
     * 完成开卡
     */
    public function finishRegister(Request $request){
        //1、检测卡片物理地址 2、验证客户表FID
        $post = $request->post();

        //操作人信息
        $operator = new Operator([
            'terminal_type' => TerminalType::CLIENT,
            'operator_id' => Token::getCurrentUID(),
            'client_no' => $post['client_no'],
            'operator_name' =>Token::getCurrentName()
        ]);

        $bill_no = app('card')->finishRegister($post,$operator);

        $sysconfig = Sysconfig::where('field','card_balance_gift')->find();
        if($sysconfig){
            $config = $sysconfig->value;
            if($config){
                $tag = 1;
            }else{
                $tag = 0;
            }
        }else{
            $tag = 0;
        }

        return show(201,["bill_no"=>$bill_no,"card_balance_gift"=> $tag],'finish register card success');
    }

    /**
     * 预充值
     * @param Request $request
     */
    public function preRecharge(Request $request){
        $post = $request->post();
        $transaction_no = app('card')->preRecharge($post);
        return show(201,["transaction_no" => $transaction_no],'pre recharge card success');
    }
    /**
     * 完成充值
     */
    public function finishRecharge(Request $request){
        //1、检测卡片物理地址 2、验证客户表FID
        $post = $request->post();

        //操作人信息
        $operator = new Operator([
            'terminal_type' => TerminalType::CLIENT,
            'operator_id' => Token::getCurrentUID(),
            'client_no' => $post['client_no'],
            'operator_name' =>Token::getCurrentName()
        ]);

        $bill_no = app('card')->finishRecharge($post,$operator);

        $sysconfig = Sysconfig::where('field','card_balance_gift')->find();
        if($sysconfig){
            $config = $sysconfig->value;
            if($config){
                $tag = 1;
            }else{
                $tag = 0;
            }
        }else{
            $tag = 0;
        }

        return show(201,["bill_no"=>$bill_no,"card_balance_gift"=> $tag],'finish_recharge card success');
    }

    /**
     * 预退卡
     */
    public function preReturnCard(Request $request){
        $post = $request->post();
        $transaction_no = app('card')->preReturnCard($post);
        return show(201,["transaction_no" => $transaction_no],'finish_register card success');
    }

    /**
     * 完成退款
     */
    public function finishReturnCard(Request $request){
        //1、检测卡片物理地址 2、验证客户表FID
        $post = $request->post();

        //操作人信息
        $operator = new Operator([
            'terminal_type' => TerminalType::CLIENT,
            'operator_id' => Token::getCurrentUID(),
            'client_no' => $post['client_no'],
            'operator_name' =>Token::getCurrentName()
        ]);

        $bill_no = app('card')->finishReturnCard($post,$operator);
        return show(201,["bill_no"=>$bill_no],'finish_register card success');
    }


    /**
     * 挂失补卡
     */
    public function preChangeCard(Request $request){
        $post = $request->post();
        $transaction_no = app('card')->preChangeCard($post);
        return show(201,["transaction_no" => $transaction_no],'pre change card success');
    }

     /**
     * 完成挂失补卡
     */
    public function finishChangeCard(Request $request){
        //1、检测卡片物理地址 2、验证客户表FID
        $post = $request->post();
        app('card')->finishChangeCard($post);
        return show(201,'','finish change card success');
    }




    /**
     * 添加挂失推送
     */
    public function lostCardPush(Request $request){
        $card_no = $request->post('card_no');
        $client_no = $request->post('client_no');
        app('card')->lostCardPush($card_no,$client_no);
        return show(201,'','add lost card push success');
    }

    /**
     * 添加取消挂失推送
     */
    public function cancelLostCardPush(Request $request){
       $card_no = $request->post('card_no');
       $client_no = $request->post('client_no');
       app('card')->cancelLostCardPush($card_no,$client_no);
        return show(201,'','cancel lost card push success');
    }



    /**
     * 获取卡号带上客户信息
     */
    public function getCardInfoWithCustomer($card_no){
        $row = CardInfo::where('card_no',$card_no)->find();
        if(!$row){
            $res = new \stdClass();
            return show(200,$res,'get card error');
        }
        $customer = CustomerModel::get(['fid' => $row->customer_fid]);
        if(!$customer){
            $res = new \stdClass();
            return show(200,$res,'card is not binding to a customer');
        }
        $customer = $customer->toArray();

        $contractStatus[] = ['status','IN',[ContractStatus::EXECUTING,ContractStatus::WAITING_EXECUTE,ContractStatus::WAITING_PAY,ContractStatus::WAITING_FINISH]];
        $customerRelation = CustomerModel::getInfoByFID($row->customer_fid,$contractStatus);
        $customer['housing_list'] = '';

        foreach($customerRelation->contract as $contract)
        {
            $customer['housing_list'] = $customer['housing_list'] . $contract->housing->name  . " | ";
        }

        return show(200,['card' => $row,'customer' => $customer ],'get card info success');
    }



    /**
     * 获取客户的水卡
    */
    public function getCustomerCards($customer_fid){
        $rows = CardInfo::where(['customer_fid' => $customer_fid])->select();

        if($rows->isEmpty()){
            return show(201,[],'get card error');
        }

        return show(201,$rows,'get customer cards success');
    }

    /**
     * 多收退款
     */
    public function preOverchargeRefund(Request $request){
        $post = $request->post();
        $transaction_no = app('card')->preOverchargeRefund($post);
        return show(201,['transaction_no'=>$transaction_no],'pre overcharge refund success');
    }
    /**
     * 完成多收退款
     */
    public function finishOverchargeRefund(Request $request){
        $post = $request->post();

        //操作人信息
        $operator = new Operator([
            'terminal_type' => TerminalType::CLIENT,
            'operator_id' => Token::getCurrentUID(),
            'client_no' => $post['client_no'],
            'operator_name' =>Token::getCurrentName()
        ]);

        $bill_no = app('card')->finishOverchargeRefund($post,$operator);
        return show(201,["bill_no"=>$bill_no],'finish overcharge success');
    }


    //endregion

    /**
     *  水电余额预充值
     * @validate('RechargeBalance.client')
     */
    public function rechargeBalance(Request $request){
        $params = $request->post();
        $customer = Customer::get($params['customer_id']);
        if(!$customer){
            throw new ParameterException();
        }
        $details = new PaymentDetails($params);
        $operator = new Operator([
            'terminal_type' => TerminalType::CLIENT,
            'operator_id' => Token::getCurrentUID(),
            'client_no' => $params['client_no'],
            'operator_name' =>Token::getCurrentName()
        ]);

        $paymentNO = app('account')->rechargeBalance($customer,$details,$operator);
        $data = ['bill_no'=>$paymentNO];
        return show(200,$data,'recharge success');
    }

    /**
     * 账单付款
     * @validate('ReceivableBill.client')
     */
    public function paidFromBills(Request $request){
        $params = $request->post();
        $customer = Customer::get($params['customer_id']);
        if(!$customer){
            throw new ParameterException();
        }

        $user = Token::getCurrentUser();

        if(isset($params['charge_time']) && $params['charge_time'] != ''){
            if($user->group_id == 9){
                $params['charge_time'] = strtotime($params['charge_time']);
            }else{
                $params['charge_time'] = time();
            }
        }else{
            $params['charge_time'] = time();
        }

        $receivables = new Receivables($params);

        $operator = new Operator([
            'terminal_type' => TerminalType::CLIENT,
            'operator_id' => Token::getCurrentUID(),
            'client_no' => $params['client_no'],
            'operator_name' =>Token::getCurrentName()
        ]);

        $paymentNO = app('account')->createReceivables($customer,$receivables,$operator);
        $data = ['bill_no'=>$paymentNO];
        return show(200,$data,'paid success');
    }

    /**
     * 余额退款
     * @param('offline_cash','现金','require|float')
     * @param('offline_by_card','转账','require|float')
     * @param('client_no','客户端号','require')
     * @param Request $request
     */
    public function balanceRefund(Request $request){
        $params = $request->post();
        $contractStatus[] = ['status','in',[ContractStatus::WAITING_EXECUTE,ContractStatus::EXECUTING,ContractStatus::WAITING_FINISH]];
        $customer = Customer::getInfo($params['customer_id'],$contractStatus);
        if(!$customer){
            throw new ParameterException([
                'msg' => '找不到该商户'
            ]);
        }

        if($customer && !$customer['contract']->isEmpty()){
            throw new HandleException([
                'msg' => '该商户不可退款'
            ]);
        }
        if(($params['offline_cash'] + $params['offline_by_card']) != $customer->balance){
            throw new HandleException([
                'msg' => '传入余额与客户现有余额不匹配'
            ]);
        }

        $operator = new Operator([
            'terminal_type' => TerminalType::CLIENT,
            'operator_id' => Token::getCurrentUID(),
            'client_no' => $params['client_no'],
            'operator_name' =>Token::getCurrentName()
        ]);

        $bill_no = app('account')->balanceRefund($customer,$params,$operator);
        $data = ['bill_no'=>$bill_no];
        return show(200,$data,'paid success');
    }

    /**
     * 流水查询
     * @param Request $request
     * @return \think\response\Json
     * @throws Exception
     * @throws \app\lib\exception\token\TokenException
     */
    public function getBillFlow(Request $request){

        $params = $request->get();

        $filter = [];
        //类型:1 商户缴费;2 余额充值;3余额退款 ;4 水卡充值;5 水卡退款
        if(isset($params['type'])){
            if(!empty($params['type'])){

                switch ($params['type']){
                    case FlowType::BILL:
                        $filter[] = ['bill_source','=',BillSource::BILL];
                        break;
                    case FlowType::BALANCE_RECHARGE:
                        $filter[] = ['bill_source','=',BillSource::RECHARGE];
                        $filter[] = ['total_amount','>',0];
                        break;
                    case FlowType::BALANCE_REFUND:
                        $filter[] = ['bill_source','=',BillSource::RECHARGE];
                        $filter[] = ['total_amount','<',0];
                        break;
                    case FlowType::CARD_RECHARGE:
                        $filter[] = ['bill_source','=',BillSource::WATERCARD];
                        $filter[] = ['total_amount','>',0];
                        break;
                    case FlowType::CARD_REFUND:
                        $filter[] = ['bill_source','=',BillSource::WATERCARD];
                        $filter[] = ['total_amount','<',0];
                        break;
                }
            }
        }

        $arrWhere = [];
        //商户姓名
        if(isset($params['name'])){
            if(!empty($params['name'])){
                $arrWhere[] = ['name','LIKE',"%{$params['name']}%"];
            }
        }

        //开始与结束日期
        $start_date = input('start_date',date('Y-m-d'));
        $end_date = input('end_date',date('Y-m-d'));
        $page = input('page',1);
        $size = input('size',15);

        if(!empty($start_date)){
            $start_date = $start_date.' 00:00:00';
        }
        if(!empty($end_date)){
            $end_date = $end_date.' 23:59:59';
        }

        $operatorId = Token::getCurrentUID();
        $filter[] = ['charge_time','between time',[$start_date,$end_date]];
        $filter[] = ['operator_id','=',$operatorId];
        $filter[] = ['terminal_type','=',TerminalType::CLIENT];

        $data = app('payment_record')->getBillFlow($filter,$page,$size,$arrWhere);

        return show(200,$data,'success');

    }

    /**
     * 查询/打印 -商户缴费明细
     * @param $payment_record_id
     * @param('payment_record_id','ID','require')
     * @return \think\response\Json
     */
    public function getBillFlowRemark($payment_record_id,$receiptHeader = false){
        if($receiptHeader){
            $data = app('payment_record')->getPaymentRecordToPrint($payment_record_id);
        }else{
            $data = app('payment_record')->getBillFlowRemarkForClient($payment_record_id);
        }
        return show(200,$data,'success');
    }

    /**
     * 获取数据统计
     * param $time_tag //参数：上周lastWeek 本周week 本月month 上月lastMonth
     * param $start_date // 开始日期
     * param $end_date // 结束日期
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     * @throws Exception
     * @throws \app\lib\exception\token\TokenException
     */
    public function getChargeStatistics(){
        //时间标签
        $timeTag = input('time_tag','');
        //开始与结束日期
        $start_date = input('start_date',date('Y-m-d'));
        $end_date = input('end_date',date('Y-m-d'));

        $page = input('page',1);
        $size = input('size',15);

        if(!empty($timeTag)){
            switch ($timeTag){
                case 'week':
                    list($start,$end) = Time::week();
                    break;
                case 'lastWeek':
                    list($start,$end) = Time::lastWeek();
                    break;
                case 'month':
                    list($start,$end) = Time::month();
                    break;
                case 'lastMonth':
                    list($start,$end) = Time::lastMonth();
                    break;
                default:

            }

            $start_date = date('Y-m-d',$start);
            $end_date = date('Y-m-d',$end);
        }

        $operatorId = Token::getCurrentUID();

        $data = app('payment_record')->getChargeStatistics($start_date,$end_date,$page,$size,$operatorId);
        return show(200,$data,'success');
    }

    /**
     * 获取每日对账
     * param $time_tag //参数：上周lastWeek 本周week 本月month 上月lastMonth
     * param $start_date // 开始日期
     * param $end_date // 结束日期
     * @return \think\response\Json
     * @throws Exception
     * @throws \app\lib\exception\token\TokenException
     */
    public function getBillProofreading(){

        //时间标签
        $timeTag = input('time_tag','');
        //开始与结束日期
        $start_date = input('start_date',date('Y-m-d'));
        $end_date = input('end_date',date('Y-m-d'));

        if(!empty($start_date)){
            $start_date = $start_date.' 00:00:00';
        }
        if(!empty($end_date)){
            $end_date = $end_date.' 23:59:59';
        }

        if(!empty($timeTag)){
            switch ($timeTag){
                case 'week':
                    list($start,$end) = Time::week();
                    break;
                case 'lastWeek':
                    list($start,$end) = Time::lastWeek();
                    break;
                case 'month':
                    list($start,$end) = Time::month();
                    break;
                case 'lastMonth':
                    list($start,$end) = Time::lastMonth();
                    break;
                default:

            }

            $start_date = date('Y-m-d H:i:s',$start);
            $end_date = date('Y-m-d H:i:s',$end);
        }

        $operatorId = Token::getCurrentUID();

        $filter = [['charge_time','between time',[$start_date,$end_date]],['operator_id','=',$operatorId],['terminal_type','=',TerminalType::CLIENT]];

        $data = app('payment_record')->getBillProofreading($filter);


        return show(200,$data,'success');
    }

    /**
     * 查询商户信息列表
     * @param string $customer_name
     * @param string $housing_name
     * @param int $all
     * @param int $page
     * @param int $size
     * @param('page','页数','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     */
    public function getCustomerList($customer_name = '',$housing_name = '',$all = 1 ,$page = 1,$size = 15){

        $result = CustomerModel::getListByHousing($customer_name,$housing_name,$all,$page,$size);
        if(!$result){
            $result =  [];
        }

        $result = $result->toArray();
        $result['data'] = array_map(function($v){
            $unpaidAmount = Bill::where('customer_fid',$v['fid'])->where('state',0)->where("type",1)->sum('unpaid_balance');
            $v['unpaid_amount'] = $unpaidAmount;

            //查询用户名下关联的房间信息
            $contractStatus[] = ['status','IN',[ContractStatus::EXECUTING,ContractStatus::WAITING_EXECUTE,ContractStatus::WAITING_PAY,ContractStatus::WAITING_FINISH]];
            $customerObj = Customer::getInfoByFID($v['fid'],$contractStatus);
            $v['housing_list'] = "";

            if($customerObj)
            {
                foreach($customerObj->contract as $c_contract)
                {
                    $v['housing_list'] = $v['housing_list'] . $c_contract->housing->name . " | ";
                }
            }
            return $v;
        },$result['data']);

        return show(200,$result,'操作成功');
    }


    /**
     * 获取缴费单据
     * @param Request $request
     * @return \think\response\Json
     * @throws Exception
     * @throws \app\lib\exception\token\TokenException
     */
    public function getReceipt(Request $request){
        $params = $request->get();

        $arrWhere = [];
        //商户姓名
        if(isset($params['name'])){
            if(!empty($params['name'])){
                $arrWhere[] = ['name','LIKE',"%{$params['name']}%"];
            }
        }

        //开始与结束日期
        $start_date = input('start_date',date('Y-m-d'));
        $end_date = input('end_date',date('Y-m-d'));
        $page = input('page',1);
        $size = input('size',15);

        if(!empty($start_date)){
            $start_date = $start_date.' 00:00:00';
        }
        if(!empty($end_date)){
            $end_date = $end_date.' 23:59:59';
        }

        $filter[] = ['charge_time','between time',[$start_date,$end_date]];
        $filter[] = ['bill_source','=',BillSource::BILL];
        $filter[] = ['total_amount','>=',0];
        $data = app('payment_record')->getBillFlow($filter,$page,$size,$arrWhere);

        return show(200,$data,'success');
    }


}