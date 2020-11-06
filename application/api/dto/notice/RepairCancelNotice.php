<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/10/31
 * Time: 17:38
 */

namespace app\api\dto\notice;


class RepairCancelNotice
{
    //用户公众号openID
    public $mp_openid;
    //报修单号
    public $order_no;
    //报修类型
    public $type_name;
    //报修地址
    public $housing_name;
    //内容
    public $content;
    //更新时间
    public $time;
}