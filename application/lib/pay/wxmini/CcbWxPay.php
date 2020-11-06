<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/7
 * Time: 16:49
 */

namespace app\lib\pay\wxmini;


use app\api\contract\PayContract;
use app\lib\enum\OrderStatus;
use app\lib\exception\common\ParameterException;
use think\Db;
use think\Exception;


class CcbWxPay implements PayContract
{
    private $orderID = 0;

    const UNIFIED_ORDER_URL = 'https://ibsbjstar.ccb.com.cn/CCBIS/ccbMain?CCB_IBSVersion=V6';

    const BARCODE_URL ='https://ibsbjstar.ccb.com.cn/CCBIS/B2CMainPlat_00_BEPAY';

    public function setApplication($applicationId){

        return $this;
    }

    public function makeWxPreOrder($orderID,$orderSN,$orderPrice,$orderBody,$openID){

        $this->orderID = $orderID;

        $postData['MERCHANTID'] = config('ccbwxpay.merchant_id');
        $postData['POSID'] = config('ccbwxpay.pos_id');
        $postData['BRANCHID'] = config('ccbwxpay.branch_id');
        $postData['ORDERID'] = $orderSN;
        if(config('app_debug')){
            $orderPrice = 0.01;
        }
        $postData['PAYMENT'] = $orderPrice;
        $postData['CURCODE'] = '01';
        $postData['TXCODE'] = '530590';
        $postData['REMARK1'] = $this->escape($orderBody);
        $postData['REMARK2'] = '';
        $postData['TYPE'] = 1;
        $postData['PUB'] = config('ccbwxpay.merchant_public_key_pub');
        $postData['GATEWAY'] = 0;
        $postData['CLIENTIP'] = '';
        $postData['REGINFO'] = '';
        $postData['PROINFO'] = '';
        $postData['REFERER'] = '';
        $postData['TRADE_TYPE'] = 'MINIPRO';
        $postData['SUB_APPID'] = config('wxmini.fj.app_id');
        $postData['SUB_OPENID'] = $openID;

        $str = '';
        foreach ($postData as $k=>$val){
            $str .= $k .'=' . $val . '&';
        }
        $macStr = rtrim($str, '&');
        $postData['RETURN_FIELD'] = '10010000000000000000';
        $postData['MAC'] = md5($macStr);

        unset($postData['PUB']);
        //file_put_contents('ccbwxpay_param_error.txt',json_encode($postData));

        $res = http_request(self::UNIFIED_ORDER_URL,'POST',$postData,[],'build');

        //file_put_contents('ccbwxpay_res_error.txt',$res);

        $res = json_decode($res,true);

        if($res['SUCCESS'] != 'true'){
//                 Log::error($res);
//                 Log::error('获取预订单支付失败');
            return $res;
        }
        $wxResult = http_request($res['PAYURL']);

//        file_put_contents('ccbwxpay_error.txt',$wxResult);

        $wxResult = json_decode($wxResult,true);
        if($wxResult['ERRCODE'] != '000000'){
            return $wxResult;
        }
        $result['timeStamp'] = $wxResult['timeStamp'];
        $result['nonceStr'] = $wxResult['nonceStr'];
        $result['signType'] = $wxResult['signType'];
        $result['package'] = $wxResult['package'];
        $result['paySign'] = $wxResult['paySign'];
        return $result;
    }


    public function barcodePay($dynamicID,$orderSN,$orderPrice,$order){

        $postData['MERCHANTID'] = config('ccbwxpay.merchant_id');
        $postData['POSID'] = config('ccbwxpay.pos_id');
        $postData['BRANCHID'] = config('ccbwxpay.branch_id');

        $postData['TXCODE'] = 'PAY100';
        $postData['MERFLAG'] = 1;
        $postData['ORDERID'] = $orderSN;
        $postData['QRCODE'] = $dynamicID;
//        if(config('app_debug')){
//            $orderPrice = 0.01;
//        }
        $postData['AMOUNT'] = $orderPrice;
        $postData['RETURN_FIELD'] = '11111100000000000000';

        $pubKey = config('ccbwxpay.merchant_public_key');
        $str = '';
        foreach ($postData as $k=>$val){
            $str .= $k .'=' . $val . '&';
        }
        $macStr = rtrim($str, '&');

//        $ccbPayUtil = new CCBPayUtil();
//        $ccParam = $ccbPayUtil->makeCCBParam($macStr,$pubKey);

        $param = [
            'param' => $macStr,
            'pubKey' => $pubKey
        ];

        Db::startTrans();

        try{
            $ccParamRes = http_request("http://47.104.89.206:25900/Service/CCBPayService.ashx?action=MakeCCBParam",'POST',$param,[],'json');

            //file_put_contents('barcode_ccparamRes.txt',$ccParamRes);

            $tempRes = json_decode($ccParamRes,true);

            if($tempRes['Code'] == 200){
                $postData['ccbParam'] = $tempRes['Data'];
            }else{
                throw new ParameterException(['msg'=>$ccParamRes]);
            }

            $res = http_request(self::BARCODE_URL,'POST',$postData,[],'build');

            //file_put_contents('barcode_res.txt',$res);

            $result= json_decode($res,true);

            $output = [
                'paystatus' => 0,
                'orderid' => $result['TRACEID'],
                'mch_orderid' => $result['ORDERID'],
                'message' => ''
            ];

            if($result['RESULT'] == ''){
                $output['paystatus'] = 2;
                $output['message'] = $result['ERRMSG'];
            }elseif ($result['RESULT'] == 'Y'){
                $output['paystatus'] = 1;
                $output['message'] = '支付成功';
                $order->third_orderid  = $result['TRACEID'];
                $order->order_status = OrderStatus::PAID;
                $order->paytime = time();
                $order->save();
            }elseif ($result['RESULT'] == 'N'){
                $output['paystatus'] = 2;
                $output['message'] = '支付失败';
            }else{
                $output['paystatus'] = 0;
                $output['message'] = '订单轮询';
                $order->third_orderid  = $result['TRACEID'];
                $order->order_status = OrderStatus::UNPAID;
                $order->save();
                cache('DDLX'.$orderSN,1,60);
            }
        }catch (Exception $e){
            Db::rollback();
            throw $e;
        }

        Db::commit();
        return $output;
    }

    public function queryOrder($dynamicID,$ccbOrderID,$onlineOrder){


        $temp = cache('DDLX'.$onlineOrder->order_no)+1;
        cache('DDLX'.$onlineOrder->order_no,intval($temp),60);

        $postData['MERCHANTID'] = config('ccbwxpay.merchant_id');
        $postData['POSID'] = config('ccbwxpay.pos_id');
        $postData['BRANCHID'] = config('ccbwxpay.branch_id');

        $postData['TXCODE'] = 'PAY101';
        $postData['MERFLAG'] = 1;
        $postData['ORDERID'] = $onlineOrder->order_no;
        $postData['QRYTIME'] = intval($temp);
        $postData['QRCODE'] = $dynamicID;
        $postData['RETURN_FIELD'] = '11111100000000000000';

        $pubKey = config('ccbwxpay.merchant_public_key');
        $str = '';
        foreach ($postData as $k=>$val){
            $str .= $k .'=' . $val . '&';
        }
        $macStr = rtrim($str, '&');

        //$ccbPayUtil = new CCBPayUtil();
        //$ccParam = $ccbPayUtil->makeCCBParam($macStr,$pubKey);

        $param = [
            'param' => $macStr,
            'pubKey' => $pubKey
        ];

        Db::startTrans();
        try{

            $ccParamRes = http_request("http://47.104.89.206:25900/Service/CCBPayService.ashx?action=MakeCCBParam",'POST',$param,[],'json');

            $tempRes = json_decode($ccParamRes,true);

            if($tempRes['Code'] == 200){
                $postData['ccbParam'] = $tempRes['Data'];
            }else{
                throw new ParameterException(['msg'=>$ccParamRes]);
            }


            $res = http_request(self::BARCODE_URL,'POST',$postData,[],'build');

            //file_put_contents('querybarcode_res.txt',$res);

            $result= json_decode($res,true);


            $output = [
                'paystatus' => 0,
                'orderid' => $onlineOrder->third_orderid,
                'mch_orderid' => $onlineOrder->order_no,
                'message' => ''
            ];

            if($onlineOrder->order_status == OrderStatus::UNPAID){
                if($result['RESULT'] == ''){
                    $output['paystatus'] = 2;
                    $output['message'] = $result['ERRMSG'];
                    $onlineOrder->order_status = OrderStatus::CLOSE;
                    $onlineOrder->save();
                }elseif ($result['RESULT'] == 'Y'){
                    $output['paystatus'] = 1;
                    $output['message'] = '支付成功';
                    $onlineOrder->order_status = OrderStatus::PAID;
                    $onlineOrder->paytime = time();
                    $onlineOrder->save();

                }elseif ($result['RESULT'] == 'N'){
                    $onlineOrder->order_status = OrderStatus::OVERTIME;
                    $onlineOrder->save();
                    $output['paystatus'] = 2;
                    $output['message'] = '订单已失效';

                }else{
                    $output['paystatus'] = 0;
                    $output['message'] = '订单轮询';
                }
            }elseif ($onlineOrder->order_status == OrderStatus::PAID){
                $output['paystatus'] = 1;
                $output['message'] = '该订单已支付成功';
            }else{
                $output['paystatus'] = 2;
                $output['message'] = '该订单已超时关闭';
            }
        }catch (Exception $e){
            Db::rollback();
            throw $e;
        }

        Db::commit();
        return $output;
    }


    private function escape($string, $in_encoding = 'UTF-8',$out_encoding = 'UCS-2') {
        $return = '';
        if (function_exists('mb_get_info')) {
            for($x = 0; $x < mb_strlen ( $string, $in_encoding ); $x ++) {
                $str = mb_substr ( $string, $x, 1, $in_encoding );
                if (strlen ( $str ) > 1) { // 多字节字符
                    $return .= '%u' . strtoupper ( bin2hex ( mb_convert_encoding ( $str, $out_encoding, $in_encoding ) ) );
                } else {
                    $return .= '%' . strtoupper ( bin2hex ( $str ) );
                }
            }
        }
        return $return;
    }

    private function unescape($str)
    {
        $ret = '';
        $len = strlen($str);
        for ($i = 0; $i < $len; $i ++)
        {
            if ($str[$i] == '%' && $str[$i + 1] == 'u')
            {
                $val = hexdec(substr($str, $i + 2, 4));
                if ($val < 0x7f)
                    $ret .= chr($val);
                else
                    if ($val < 0x800)
                        $ret .= chr(0xc0 | ($val >> 6)) .
                            chr(0x80 | ($val & 0x3f));
                    else
                        $ret .= chr(0xe0 | ($val >> 12)) .
                            chr(0x80 | (($val >> 6) & 0x3f)) .
                            chr(0x80 | ($val & 0x3f));
                $i += 5;
            } else
                if ($str[$i] == '%')
                {
                    $ret .= urldecode(substr($str, $i, 3));
                    $i += 2;
                } else
                    $ret .= $str[$i];
        }
        return $ret;
    }

    public function makeRefundOrder($orderID, $orderSN, $refundMoney, $reason = null, $openID = null){

    }

    public function queryRefund($thirdOrderId){}
}