<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/4/27
 * Time: 14:25
 */

namespace app\api\validate\pay;


use app\api\validate\CommDefineRule;

class PayForm extends CommDefineRule
{
    protected $rule = [
        'id' => 'require'
    ];

    protected $message = [
        'id' => '订单id必填'
    ];
}