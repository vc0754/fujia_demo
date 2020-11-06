<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-07
 * Time: 18:00
 */

namespace app\lib\enum;


class BillState
{
    //未支付
    const UNPAID = 0;
    //已支付
    const PAID = 1;
    //作废关闭
    const CLOSE = 2;
}