<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/4/21
 * Time: 16:59
 */

namespace app\api\controller\api\v1;


use app\lib\enum\ApplicationEnum;
use app\lib\exception\token\ForbiddenException;
use app\lib\pay\wxmini\ThirdWxPay;
use think\Exception;
use think\facade\Log;
use think\Request;


class Pay
{

    /**
     * 订单支付
     * @param Request $request
     * @return mixed
     * @validate('PayForm')
     */
    public function pay(Request $request){

        $params = $request->post();
        $orderID = $params['id'];


        $result = app('pay')->pay($orderID);


//        return  app('pay',['orderID'=>$orderID,'pay'=>new ThirdWxPay])->pay();

        return show(200,$result,'success');
    }



    public function ccbNotify(){

        $post = input();
        try {

//            file_put_contents('ccbNotify.txt',json_encode($post).'订单号'.$post['ORDERID']);
            //$paymentDetails = json_decode($post['PAYMENT_DETAILS'],true);
            //$paymentDetails['THIRD_TRADE_NO']
            $res = app('wx_notify')->CCBNotifyProcess($post['ORDERID']);

            if($res){
                $result =  'success';
            }else{
                $result = 'fail';
            }
            Log::notice('回调状态：'.$result);
            //这里content_type不能是application/json  不然会当成失败继续通知
            return  response($result);
        } catch (Exception $e){
            //  Log::error($e->errorMessage());
            return false;
        }
    }

    public function  receiveThirdNotify(){
        //获取通知的数据
        $post = file_get_contents('php://input');

        //如果返回成功则验证签名
        try {
            //            $result =\WxPayResults::Init($xml);
            parse_str($post,$arr);

            //file_put_contents('wx.txt',json_encode($arr).PHP_EOL);
            $data['mch_orderid'] = $arr['mch_orderid'];

            if(isset($arr['orderid'])){
                $data['orderid'] = $arr['orderid'];
            }else{
                $data['orderid'] = '';
            }

            $res = app('wx_notify')->ThirdNotifyProcess($data);


            if($res){
                $result =  'success';
            }else{
                $result = 'fail';
            }
            Log::notice('回调状态：'.$result);
            //这里content_type不能是application/json  不然会当成失败继续通知
            return  response($result);
        } catch (Exception $e){
          //  Log::error($e->errorMessage());
            return false;
        }
    }

    public function testReceiveThirdNotify(Request $request){
        if(!config('app_debug')){
            throw new ForbiddenException();
        }
        $data = $request->post();
        $res = app('wx_notify')->ThirdNotifyProcess($data);


        if($res){
            $result =  'success';
        }else{
            $result = 'fail';
        }
        return show(200,$request,'success');
    }
}