<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-09
 * Time: 11:17
 */

namespace app\lib\enum;

//流水账账单类型
class ListBillType
{
    //扣减
    const DEDUCT = 1;
    //增加
    const INCREASE = 2;
    //退款减少
    const  REFUND = 3;
    //4挂失换卡
    const  LOST_CHANGE_CARD = 4;
    //5多充多退
    const  MORE_CHARGE_MORD_REFUND = 5;
}