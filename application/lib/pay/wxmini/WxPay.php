<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/1/8
 * Time: 13:58
 */

namespace app\lib\pay\wxmini;

use app\api\contract\PayContract;
use think\facade\Log;

require_once env('EXTEND_PATH')."WxPay".DIRECTORY_SEPARATOR."WxPay.Api.php";

class WxPay  implements PayContract
{

    private $orderID = 0;

    public function setApplication($applicationId){
        return $this;
    }

    public function makeWxPreOrder($orderID,$orderSN,$orderPrice,$orderBody,$openID){

        $this->orderID = $orderID;

        //设置微信支付接口数据
        $wxOrderData = new \WxPayUnifiedOrder();
        $wxOrderData->SetOut_trade_no($orderSN);
        $wxOrderData->SetTrade_type('JSAPI');
//        if(config('app_debug')){
//            $orderPrice = 0.01;
//        }
        $wxOrderData->SetTotal_fee($orderPrice * 100);
        $wxOrderData->SetBody($orderBody);
        $wxOrderData->SetOpenid($openID);
        $wxOrderData->SetNotify_url(config('wxmini.pay_notify_callback_url'));
        return $this->getPaySignature($wxOrderData);
    }

    public function barcodePay($dynamicID,$orderSN,$orderPrice,$onlineOrder){}

    public function queryOrder($dynamicID,$orderID,$onlineOrder){}

    private  function  getPaySignature($wxOrderData){
        //调用统一下单接口将以上设置好数据传入
        $wxOrder  = \WxPayApi::unifiedOrder($wxOrderData);
        //如果失败记录失败问题，返回
        if($wxOrder['return_code'] != 'SUCCESS' ||  $wxOrder['result_code'] != 'SUCCESS'){
            Log::error($wxOrder);
            Log::error('获取预订单支付失败');
            return $wxOrder;
        }
        /**成功则$wxOrder里会包含prepay_id,我们将其记录到数据库，
         * 该参数可以向用户发送微信模板消息以及在生成签名时需要配置
         */
//        $param['order_type'] = $this->orderType;
//        $param['order_id'] = $this->orderID;
//        $param['prepay_id'] = $wxOrder['prepay_id'];
//        Hook::exec('app\\api\\behavior\\RecordPreOrder','run',$param);
        //$this->recordPreOrder($wxOrder);
        //生成签名返回给客户端
        return $this->sign($wxOrder);
    }

    //生成签名
    private  function  sign($wxOrder){
        $jsApiPayData = new \WxPayJsApiPay();
        $jsApiPayData->SetAppid(config('wx.app_id'));
        //客户端接收参数必须是字符串
        $jsApiPayData->SetTimeStamp((string)time());
        $randStr = md5(time().mt_rand(10,1000));
        //随机字符串
        $jsApiPayData->SetNonceStr($randStr);
        $jsApiPayData->SetPackage('prepay_id='.$wxOrder['prepay_id']);
        $jsApiPayData->SetSignType('md5');
        //生成签名方法
        $sign = $jsApiPayData->MakeSign();
        //JSSDK提供GetValues方法获取我们以上设置的值，将其保存的对象转成数组
        $rawValues = $jsApiPayData->GetValues();
        //因返回结果还需要附带签名，所以签名也要附加到该数组里去
        $rawValues['paySign']=$sign;
        unset($rawValues['appId']);
        return $rawValues;
    }

    public function makeRefundOrder($orderID, $orderSN, $refundMoney, $reason = null, $openID = null)
    {

    }

    public function queryRefund($thirdOrderId){

    }
}