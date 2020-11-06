<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-08-27
 * Time: 15:45
 */

namespace app\api\dto\notice;

/**
 * Class RepairCompleteNotice
 * @package app\api\dto\notice
 */
class RepairStatusNotice
{
    //用户公众号openID
    public $mp_openid;
    //报修单号
    public $order_no;
    //报修状态
    public $repair_status;
    //维修人姓名
    public $staff;
    //维修人电话
    public $staff_mobile;
}