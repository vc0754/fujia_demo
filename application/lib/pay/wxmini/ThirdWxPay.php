<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/1/8
 * Time: 14:03
 */

namespace app\lib\pay\wxmini;

use app\api\contract\PayContract;
use app\lib\enum\ApplicationEnum;
use app\lib\enum\OrderStatus;



class ThirdWxPay implements PayContract
{

    private $orderID = 0;

    private $app_id = '';

    private $mchid = '';

    private $paykey = '';

    const MINI_WXPAY = 'http://api2.lfwin.com/payapi/mini/wxpay';

    const BARCODE_PAY_URL = 'http://api2.lfwin.com/payapi/pay/barcode';

    const QUERY_ORDER = 'http://api2.lfwin.com/payapi/pay/query_order ';

    const REFUND_URL = 'http://api2.lfwin.com/payapi/pay/refund_order';

    const QUERY_REFUND_ORDER = 'http://api2.lfwin.com/payapi/pay/query_refund';

    public function setApplication($applicationId){

        if($applicationId == ApplicationEnum::FU_JIA){
            $this->app_id = config('wxmini.fj.app_id');
            $this->mchid = config('thirdwxpay.fj.mchid');
            $this->paykey = config('thirdwxpay.fj.paykey');
        }


        return $this;
    }

    /**
     * @param $orderID
     * @param $orderSN => mch_orderid
     * @param $orderPrice
     * @param $orderBody
     * @param $openID
     * @return mixed|string
     */
    public function makeWxPreOrder($orderID, $orderSN, $orderPrice, $orderBody, $openID)
    {
        $this->orderID = $orderID;
        $this->setDefaultConfig();

        $randStr = md5(time() . mt_rand(10, 1000));
        $postData['service'] = 'fuiou.mini.pay';
        $postData['apikey'] =  $this->mchid;
             if(config('app_debug')){
                $orderPrice = 0.01;
             }
        $postData['money'] = $orderPrice;
        $postData['nonce_str'] = $randStr;
        $postData['sub_appid'] = $this->app_id;
        $postData['sub_openid'] = $openID;
        $postData['remarks'] = $orderBody;
        $postData['mch_orderid'] = $orderSN;
        $postData['notify_url'] = config('thirdwxpay.pay_notify_callback_url');
        $_postData = $this->asc_sort($postData);
        //dump($postData);die;
        $sign = md5($_postData . "&signkey=" . $this->paykey);
//             dump($sign);die;
        $postData['sign'] = $sign;
        //dump($postData);die;
        $res = http_request(self::MINI_WXPAY, 'POST', $postData, [], 'build');
        $res = json_decode($res, true);
        if ($res['message'] != 'SUCCESS' || $res['status'] != 10000) {

//                 Log::error($res);
//                 Log::error('获取预订单支付失败');
            return $res;
        }
        $result['timeStamp'] = $res['timeStamp'];
        $result['nonceStr'] = $res['nonceStr'];
        $result['signType'] = $res['signType'];
        $result['package'] = $res['package'];
        $result['paySign'] = $res['paySign'];
        return $result;
    }


    private function asc_sort($params = array())
    {
        if (!empty($params)) {
            $p = ksort($params);
            if ($p) {
                $str = '';
                foreach ($params as $k => $val) {
                    $str .= $k . '=' . $val . '&';
                }
                $strs = rtrim($str, '&');
                return $strs;
            }
        }
        return '参数错误';
    }


    public function barcodePay($dynamicID, $orderSN, $orderPrice, $onlineOrder)
    {
        $this->setDefaultConfig();

        $output = [
            'paystatus' => 0,
            'orderid' => '',
            'mch_orderid' => '',
            'message' => ''
        ];

        $randStr = md5(time() . mt_rand(10, 1000));
        $postData['service'] = 'pay.comm.barcode';
        $postData['apikey'] = $this->mchid;
//            if(config('app_debug')){
//                $orderPrice = 0.01;
//            }
        $postData['money'] = $orderPrice;
        $postData['nonce_str'] = $randStr;
        $postData['dynamic_id'] = $dynamicID;
        $postData['mch_orderid'] = $orderSN;
        $_postData = $this->asc_sort($postData);
        $sign = md5($_postData . "&signkey=" . $this->paykey);
//            dump($sign);die;
        $postData['sign'] = $sign;
        $res = http_request(self::BARCODE_PAY_URL, 'POST', $postData, [], 'build');
        $result = json_decode($res, true);

        if ($result['message'] != 'SUCCESS') {
            $result['paystatus'] = 2;
            return $result;
        }
        if ($result['paystatus'] == 1 || $result['paystatus'] == 0) {
            $output['paystatus'] = $result['paystatus'];
            $output['orderid'] = $result['orderid'];
            $output['mch_orderid'] = $result['mch_orderid'];
            $output['message'] = $result['message'];
            $onlineOrder->third_orderid = $result['orderid'];
            $onlineOrder->order_status = $result['paystatus'] == 1 ? OrderStatus::PAID : OrderStatus::UNPAID;
            $onlineOrder->order_time = $result['order_time'];
            $onlineOrder->paytime = $result['paystatus'] == 1 ? $result['paytime'] : 0;
            $onlineOrder->save();
        } else {
            $output['paystatus'] = 2; //其他都是失败
            $output['message'] = $result['message'];
        }
        return $output;
    }

    public function queryOrder($dynamicID, $orderID, $onlineOrder)
    {
        $this->setDefaultConfig();
        $randStr = md5(time() . mt_rand(10, 1000));
        $postData['service'] = 'pay.comm.barcode';
        $postData['apikey'] = $this->mchid;
        $postData['nonce_str'] = $randStr;
        $postData['orderid'] = $orderID;
        $_postData = $this->asc_sort($postData);
        $sign = md5($_postData . "&signkey=" . $this->paykey);
        $postData['sign'] = $sign;
        $res = http_request(self::QUERY_ORDER, 'POST', $postData, [], 'build');
        $result = json_decode($res, true);

        $output = [
            'paystatus' => 0,
            'orderid' => '',
            'mch_orderid' => '',
            'message' => ''
        ];

        if ($result['message'] != 'SUCCESS') {
            $onlineOrder->order_status = OrderStatus::CLOSE;
            $onlineOrder->save();
            $result['paystatus'] = 2;
            return $result;
        }

        if ($onlineOrder->order_status == 0) {
            if ($result['paystatus'] == 1) {
                $output['paystatus'] = $result['paystatus'];
                $output['orderid'] = $result['orderid'];
                $output['mch_orderid'] = $result['mch_orderid'];
                $output['message'] = $result['message'];
                $onlineOrder->order_status = OrderStatus::PAID;
                $onlineOrder->paytime = $result['paytime'];
                $onlineOrder->save();
            } elseif ($result['paystatus'] == 0) {
                $output['paystatus'] = $result['paystatus'];
                $output['orderid'] = $result['orderid'];
                $output['mch_orderid'] = $result['mch_orderid'];
                $output['message'] = $result['message'];
            } else {
                $onlineOrder->order_status = OrderStatus::OVERTIME;
                $onlineOrder->save();
                $output['orderid'] = $onlineOrder->third_orderid;
                $output['mch_orderid'] = $onlineOrder->order_no;
                $output['message'] = '订单已失效';
            }
        } elseif ($onlineOrder->order_status == 1) {
            $output['paystatus'] = 1;
            $output['orderid'] = $onlineOrder->third_orderid;
            $output['mch_orderid'] = $onlineOrder->order_no;
            $output['message'] = '该订单已支付成功';
        } else {
            $output['paystatus'] = $onlineOrder->order_status;
            $output['orderid'] = $onlineOrder->third_orderid;
            $output['mch_orderid'] = $onlineOrder->order_no;
            $output['message'] = '订单已超时';
        }


        return $output;

    }

    /**
     * 创建退款单
     * @param $thirdOrderId String 第三方 orderid
     * @param $orderSN String onlineOrder的 order_no
     * @param $refundMoney String 退款金额
     * @param $orderBody
     * @param $openID
     * @return mixed|string
     */
    public function makeRefundOrder($thirdOrderId, $orderSN, $refundMoney, $reason = null, $openID = null)
    {
        $this->setDefaultConfig();

        $randStr = md5(time() . mt_rand(10, 1000));
        $postData['service'] = 'pay.comm.refund_order';
        $postData['apikey'] = $this->mchid;
             if(config('app_debug')){
                $refundMoney = 0.01;
             }
        $postData['orderid'] = $thirdOrderId;
        $postData['nonce_str'] = $randStr;
        $postData['refundmoney'] = $refundMoney;//退款金额
        //$postData['sub_appid'] = $this->app_id;
        //$postData['sub_openid'] = $openID;
        //$postData['reason'] = $reason;
        $postData['mch_orderid'] = $orderSN;
        //$postData['notify_url'] = config('thirdwxpay.refund_notify_callback_url');
        $_postData = $this->asc_sort($postData);
        //dump($postData);die;
        $sign = md5($_postData . "&signkey=" . $this->paykey);
//             dump($sign);die;
        $postData['sign'] = $sign;
        //dump($postData);die;
        $res = http_request(self::REFUND_URL, 'POST', $postData, [], 'build');
        if($res){
            $res = json_decode($res, true);
        }
//        if ($res['message'] != 'SUCCESS' || $res['status'] != 10000) {
//                 Log::error($res);
//                 Log::error('获取预订单支付失败');
//            return $res;
//        }
        return $res;
    }

    public function queryRefund($thirdOrderId){
        $this->setDefaultConfig();

        $randStr = md5(time() . mt_rand(10, 1000));
        $postData['service'] = 'pay.comm.refund_order';
        $postData['apikey'] = $this->mchid;
        $postData['orderid'] = $thirdOrderId;
        $postData['nonce_str'] = $randStr;
        $_postData = $this->asc_sort($postData);
        $sign = md5($_postData . "&signkey=" . $this->paykey);
        $postData['sign'] = $sign;
        $res = http_request(self::QUERY_REFUND_ORDER, 'POST', $postData, [], 'build');

        if($res){
            $res = json_decode($res, true);
        }
        return $res;
    }

    private function setDefaultConfig(){
        $this->app_id = $this->app_id ?:config('wxmini.fj.app_id');
        $this->mchid = $this->mchid ?: config('thirdwxpay.fj.mchid');
        $this->paykey = $this->paykey ?: config('thirdwxpay.fj.paykey');
    }

//    public function queryRefundOrder($dynamicID, $orderID, $refundLog)
//    {
//        $randStr = md5(time() . mt_rand(10, 1000));
//        $postData['service'] = 'pay.alipay.query_refund';
//        $postData['apikey'] = config('thirdwxpay.mchid');
//        $postData['nonce_str'] = $randStr;
//        $postData['orderid'] = $orderID;
//        $_postData = $this->asc_sort($postData);
//        $sign = md5($_postData . "&signkey=" . config('thirdwxpay.paykey'));
//        $postData['sign'] = $sign;
//        $res = http_request(self::QUERY_REFUND_ORDER, 'POST', $postData, [], 'build');
//        $result = json_decode($res, true);
//
//        $output = [
//            'status' => 0,
//            'orderid' => '',
//            'mch_orderid' => $refundLog->id,
//            'message' => ''
//        ];
//
//
//        if($refundLog->status > RefundStatus::Handling){
//            $output['status'] = $refundLog->status;
//            $output['orderid'] = $refundLog->third_orderid;
//            $output['mch_orderid'] = $refundLog->order_no;
//            $output['message'] = '订单已处理过';
//        }
//
//        if ($result['status'] == '4000') {//处理中
//            $refundLog->status = OrderStatus::CLOSE;
//            $refundLog->save();
//            $result['paystatus'] = 2;
//            return $result;
//        }
//
//        if ($refundLog->order_status == 0) {
//            if ($result['paystatus'] == 1) {
//                $output['paystatus'] = $result['paystatus'];
//                $output['orderid'] = $result['orderid'];
//                $output['mch_orderid'] = $result['mch_orderid'];
//                $output['message'] = $result['message'];
//                $onlineOrder->order_status = OrderStatus::PAID;
//                $onlineOrder->paytime = $result['paytime'];
//                $onlineOrder->save();
//            } elseif ($result['paystatus'] == 0) {
//                $output['paystatus'] = $result['paystatus'];
//                $output['orderid'] = $result['orderid'];
//                $output['mch_orderid'] = $result['mch_orderid'];
//                $output['message'] = $result['message'];
//            } else {
//                $onlineOrder->order_status = OrderStatus::OVERTIME;
//                $onlineOrder->save();
//                $output['orderid'] = $onlineOrder->third_orderid;
//                $output['mch_orderid'] = $onlineOrder->order_no;
//                $output['message'] = '订单已失效';
//            }
//        } elseif ($onlineOrder->order_status == 1) {
//            $output['paystatus'] = 1;
//            $output['orderid'] = $onlineOrder->third_orderid;
//            $output['mch_orderid'] = $onlineOrder->order_no;
//            $output['message'] = '该订单已支付成功';
//        } else {
//            $output['paystatus'] = $onlineOrder->order_status;
//            $output['orderid'] = $onlineOrder->third_orderid;
//            $output['mch_orderid'] = $onlineOrder->order_no;
//            $output['message'] = '订单已超时';
//        }
//
//
//        return $output;
//
//    }
}