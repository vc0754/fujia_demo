<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-11
 * Time: 11:33
 */

namespace app\lib\enum;


class OrderStatus
{
    //未支付
    const UNPAID = 0;
    //已支付
    const PAID = 1;
    //已关闭
    const CLOSE = 2;
    //已超时
    const OVERTIME = 3;
    //已退款
    const REFUNDED = 4;
}