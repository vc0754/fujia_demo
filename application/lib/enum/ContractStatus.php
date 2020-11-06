<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-30
 * Time: 16:47
 */

namespace app\lib\enum;


class ContractStatus
{
    //执行中
    const EXECUTING = 3;
    //待执行
    const WAITING_EXECUTE = 2;
    //待付款
    const WAITING_PAY = 1;
    //待终止
    const WAITING_FINISH = 4;
    //已终止
    const FINISHED = 5;
    //终止且已退款
    const FINISHED_AND_REFUND = 6;
    //作废取消
    const VOID_CANCEL = 7;

}