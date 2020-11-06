<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/10
 * Time: 9:19
 */

namespace app\api\validate\account;


use app\api\validate\CommDefineRule;

class ReceivableBill extends CommDefineRule
{
    protected $rule = [
        'bills' => 'require|array',
        'fids' => 'require|array',
        'customer_id' => 'require',
        'client_no' => 'require',
        'pay_order_id' => 'requireWith:offline_wechat|requireWith:offline_alipay',
        'online_wechat' => 'require|float',
        'offline_cash' => 'require|float',
        'offline_wechat' => 'require|float',
        'offline_alipay' => 'require|float',
        'offline_by_card' => 'require|float'
    ];

    protected $scene = [
        'client' =>['bills','customer_id','client_no','pay_order_id','online_wechat'=>'in:0','offline_cash','offline_wechat','offline_alipay','offline_by_card'],
        'mini_pro'  =>  ['fids']
    ];

}