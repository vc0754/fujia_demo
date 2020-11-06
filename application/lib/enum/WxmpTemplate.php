<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/31
 * Time: 10:10
 */

namespace app\lib\enum;


class WxmpTemplate
{
//    const REGISTER = 'r-RWyNP7lMwkw87aCo-54JFZGf2LnIVpks14Ill2PNE'; //报名成功
//
//    const STOP_CLASS = 'uPDZlbPMornC4TGHKluFFs5gOKZQjHyr8gVUOGaq0v4'; //停课通知
//
//    const APPLY_LEAVE = 'dJq91dbXKbK07ixhGwzZFj2zx-zmrFn5ORvAGktHVc0'; //请假申请提醒
//
//    const CLASS_TIME = 'GOI83NdXZb-mYryrYOVIP5zRF39YxtD6bGwRUsuz8Ts'; //上课通知
//
//    const COMMON_NOTICE = 'rdMefYY7W84YlSouzXmFV2PjRrBijZ2kO9cF4_ByIlo'; //公告通知
//
//    const SCHOOL_MANAGE = 'qP62JPOe7e_Q0OOl7IjjHqSR1kPqcOWBJAJ0-vA47YM'; //校区经营数据提醒

    //用电用水余额不足提醒
    const INSUFFICIENT_BALANCE = 'gD5dOfQ4Av7zxUBx3oW-ms25VBW3MwTEX3hycPBK05Q';
    //缴费通知
    const PENDING_PAYMENT = 'GK4mzhfJ04Eif4M8QW81UA035mjCVfPIda3_LZZ571s';
    //租约续期通知
    const LEASE_RENEWAL = 'a-I23ZtsXVibXEYZkGqfzqo9z6vq2hfdjHv4ED8lDHE';
    //报修受理通知
    const REPAIR_PROCESSING = 'v9-szNbCCyktdwePjBUzjByZ1veRb5-Elj35EraAjNg';
    //报修处理提醒
    const NEW_REPAIR = 'gRXzk3HfOguf1BUp4OBB9U4LqD-NQsZmtJvCDtNqW0s';
    //投诉建议通知
    const NEW_FEEDBACK = '4OmoxdD8LLnhXTlvCFw8BMeH5Ak9lT1AglrndKVuYhA';
    //入驻成功提醒
    const COMING_IN  = 'ZFdo3epSH7tXxkbKyKgUgUBGNQ8zoatC-RdbVSSQy-4';
    //管理员-公共提醒模板（工作）
    const WORKER_NOTICE = 'gpS03_68iwFADhVMQ4aEocKK-dWzCBWbb2P9X-OACwI';
    //报修进度提醒
    const REPAIR_RATE_NOTICE = 'spB0Cm8eDJB9D3yZJ3kiuNkpcOt0WMr92MQG5ld4Zg8';
    //报修取消提醒
    const REPAIR_CANCEL = 's31l9_H2pAxX17CAJ2XzlHKluBkSqPEcQBhsbin-Tng';
}