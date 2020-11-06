<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/2/28
 * Time: 17:58
 */

namespace app\api\behavior;


use app\api\model\Sysconfig;

class BindContract
{
    public  function  run($param){
        $sysconfig = Sysconfig::where('field','pay_channels')->find();
        if($sysconfig){
            $config = $sysconfig->value;
        }else{
            $config = config('pay.channels');
        }
        if($config === 'CCB'){
            bind('app\api\contract\PayContract','app\lib\pay\wxmini\CcbWxPay');
        }elseif($config === 'Third'){
            bind('app\api\contract\PayContract','app\lib\pay\wxmini\ThirdWxPay');
        }else{
            bind('app\api\contract\PayContract','app\lib\pay\wxmini\WxPay');
        }
    }
}