<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-10-24
 * Time: 14:59
 */

namespace app\api\dto\notice;


class RepairRateNotice
{
    //用户公众号openID
    public $mp_openid;
    //报修单号
    public $order_no;
    //报修地址
    public $housing_name;
    //报修内容
    public $content;
    //报修状态
    public $repair_status;
    //更新时间
    public $time;

}