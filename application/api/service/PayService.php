<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/4/25
 * Time: 14:30
 */

namespace app\api\service;

use app\api\contract\PayContract;
use app\api\dto\pay\PayBarcodeDto;
use app\api\model\Customer as CustomerModel;
use app\api\model\OnlineOrder;
use app\lib\enum\ApplicationEnum;
use app\lib\enum\BillSource;
use app\lib\enum\OrderStatus;
use app\lib\enum\PayChannel;
use app\api\model\Member as MemberModel;
use app\lib\enum\PayStatus;
use app\lib\exception\common\HandleException;
use app\lib\exception\common\ParameterException;
use app\lib\exception\common\OrderException;
use app\lib\exception\token\TokenException;
use app\lib\token\Token;
use think\Exception;

class PayService
{

    private $pay;

    private $applicationId;

    public function __construct(PayContract $pay,$applicationId=ApplicationEnum::FU_JIA)
    {
        $this->applicationId = $applicationId;
        $this->pay = $pay->setApplication($this->applicationId);
    }

    public function pay($orderID,$orderBody='富佳物业',$minPrice=10){
        $order = OnlineOrder::get($orderID);
        if(!$order){
            throw new OrderException();
        }

        if(!$this->isValidOperate($order->member_id)){
            throw new TokenException([
                'msg'=>'付款订单的用户与当前操作用户不匹配',
                'errorCode'=> 10050
            ]);
        }
        if($order->order_status != PayStatus::UNPAID){
            if($order->order_status == PayStatus::PAID){
                throw new OrderException([
                    'msg' => '该订单已被支付过'
                ]);
            }
            if($order->order_status == PayStatus::OVERTIME){
                throw new OrderException([
                    'msg' => '该订单已过期'
                ]);
            }
        }
        $openID = Token::getCurrentWxOpenID($this->applicationId);
        if(!$openID){
            throw new TokenException();
        }
        $orderPrice = $order->payment_amount;

        if($orderPrice < $minPrice && ($order->bill_source != BillSource::BILL)){
            throw new HandleException([
                'msg' => "充值金额不能低于{$minPrice}元"
            ]);
        }

        return $this->pay->makeWxPreOrder($orderID,$order->order_no,$orderPrice,$orderBody,$openID);
    }

    /**
     * 条码支付
     * @param PayBarcodeDto $payBarcode
     * @return mixed
     * @throws ParameterException
     */
    public function  createOrderAndPayBarcode(PayBarcodeDto $payBarcode){

        $params = (array) $payBarcode;
        //生成支付订单
        $onlineOrder = $this->makeBarcodeOrder($params);
        //支付
        $result = $this->pay->barcodePay($params['barcode'],$onlineOrder->order_no,$onlineOrder->payment_amount,$onlineOrder);

        return $result;
    }

    /**
     * 条码轮询查询订单状态
     */
    public function queryOrder($dynamicID,$thirdOrderID){

        $onlineOrder = OnlineOrder::where('third_orderid',$thirdOrderID)->find();

        if(!$onlineOrder){
           throw new ParameterException([
               'msg'=>'平台订单ID有误'
           ]);
        }else{
           $result = $this->pay->queryOrder($dynamicID,$thirdOrderID,$onlineOrder);
           return $result;
        }
    }


    private function makeBarcodeOrder($params){
        $barcode = $params['barcode'];
        $amount  = $params['money'];
        $payType = $params['pay_type'];
        $billSource = $params['bill_source'];
        $customerFID = array_key_exists('customer_fid',$params) ? $params['customer_fid']:0;
        $memberID = array_key_exists('member_id',$params) ? $params['member_id']:0;
        if($customerFID){
            $customer = CustomerModel::where('fid',$customerFID)->find();
            if(!$customer){
                throw new ParameterException([
                    'msg' => '商户FID错误'
                ]);
            }
        }
        if($memberID){
            $member = MemberModel::get($memberID);
            if(!$member){
                throw new ParameterException([
                    'msg' => '用户ID异常'
                ]);
            }
        }
        //鉴定支付通道
        $len = strlen($barcode);
        $codeStart = substr($barcode,0,2);
        if($len == 18 && $codeStart >= 10 && $codeStart <= 15){
                $payChannel = PayChannel::WECHAT;
        }elseif ($len <= 24 && $len>=16 && $codeStart >= 25 && $codeStart <= 30){
                $payChannel = PayChannel::ALIPAY;
        }else{
            throw new ParameterException([
                'msg'=>'支付通道暂时只支持微信与支付宝'
            ]);
        }
        
        $orderNo = makePaySn($customerFID);
        $onlineOrder = new OnlineOrder();
        $onlineOrder->order_no = $orderNo;
        $onlineOrder->pay_channel = $payChannel;
        $onlineOrder->pay_type = $payType;
        $onlineOrder->bill_source = $billSource;
        $onlineOrder->order_time = time();
        if($customerFID){
            $onlineOrder->bill_remark = json_encode(['customer_fid'=>$customerFID,'dynamic_id'=>$barcode]);
        }else{
            $onlineOrder->bill_remark = json_encode(['dynamic_id'=>$barcode]);
        }
        $onlineOrder->payment_amount = $amount;
        $onlineOrder->save();
        return $onlineOrder;
    }


    //检测传入的uid用户是否是当前操作用户
    private function  isValidOperate($checkMID)
    {
        if(!$checkMID){
            throw  new  Exception([
                'msg'=>'必须传入一个提供检查的用户ID'
            ]);
        }
        $currentOperateMID = Token::getCurrentMID($this->applicationId);
        if($currentOperateMID == $checkMID){
            return true;
        }
        return false;

    }

    public function orderRefund($thirdOrderId,$orderSN,$refundMoney,$reason = ''){
        //检测订单

        $results = $this->pay->makeRefundOrder($thirdOrderId, $orderSN, $refundMoney, $reason);
        if(!$results){
            throw new OrderException([
                'msg' => '退款请求发起失败'
            ]);
        }
        return $results;
    }

    public function queryRefund($thirdOrderid){
        $results = $this->pay->queryRefund($thirdOrderid);
        if(!$results){
            throw new OrderException([
                'msg' => '退款轮询请求异常，请联系管理员'
            ]);
        }
        return  $results;
    }
}