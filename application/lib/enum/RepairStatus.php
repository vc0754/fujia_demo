<?php
namespace app\lib\enum;


class RepairStatus
{

    //待受理
    const PENDING = 1;
    //待报价
    const QUOTED_PRICE = 2;
    //待付款
    const WAIT_PAID = 3;
    //待维修
    const WAIT_REPAIR = 4;
    //完成
    const OVER = 5;
    //取消申请
    const CANCEL = -1;

}