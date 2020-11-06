<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/31
 * Time: 11:06
 */

namespace app\lib\enum;


class FlowType
{
    //1 商户缴费;
    const BILL = 1;
    //2 余额充值;
    const BALANCE_RECHARGE= 2;
    //3 余额退款;
    const BALANCE_REFUND = 3;
    //4 水卡充值;
    const CARD_RECHARGE = 4;
    //5 水卡退款
    const CARD_REFUND = 5;
}