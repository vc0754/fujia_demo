<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-09
 * Time: 17:02
 */

namespace app\api\validate\account;


use app\api\validate\CommDefineRule;

class RechargeBalance extends CommDefineRule
{
    protected $rule = [
        'customer_id' => 'require',
//        'customer_fid' => 'require|isPostiveInteger',
        'pay_order_id' => 'requireWith:offline_wechat|requireWith:offline_alipay',
        'online_wechat' => 'require|float',
        'offline_cash' => 'require|float',
        'offline_wechat' => 'require|float',
        'offline_alipay' => 'require|float',
        'offline_by_card' => 'require|float'
    ];

    protected $scene = [
        'client' =>['customer_id','pay_order_id','online_wechat'=>'in:0','offline_cash','offline_wechat','offline_alipay','offline_by_card'],
        'mini_pro'  =>  ['online_wechat','offline_cash'=>'in:0','offline_wechat'=>'in:0','offline_alipay'=>'in:0','offline_by_card'=>'in:0']
    ];
}