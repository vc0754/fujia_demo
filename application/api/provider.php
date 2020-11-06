<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/2/28
 * Time: 16:08
 */

return [
    'member' => \app\api\service\Member::class,
    'wechat' => \app\api\service\Wechat::class,
    'kingdee_queue' => \app\api\service\KingdeeQueue::class,
    'notice_queue' => \app\api\service\NoticeQueue::class,
    'redis' => \app\lib\redis\Redis::class,
    'wx_notify' => \app\api\service\WxNotify::class,
    'pay' => \app\api\service\PayService::class,
    'data_maintain' => \app\api\service\DataMaintenanceService::class,
    'contract' => \app\api\service\ContractService::class,
    'customer' => \app\api\service\CustomerService::class,
    'account' => \app\api\service\AccountService::class,
    'payment_record' => \app\api\service\PaymentRecordService::class,
    'staff' => \app\api\service\StaffService::class,
    'repair' => \app\api\service\RepairService::class
];