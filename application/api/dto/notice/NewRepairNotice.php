<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/4
 * Time: 16:27
 */

namespace app\api\dto\notice;

/**
 * 新故障报修通知
 * Class NewRepairNotice
 * @package app\api\dto\notice
 */
class NewRepairNotice
{
    //用户公众号openID
    public $mp_openid;
    //客户名字
    public $customer_name;
    //房源名称
    public $repair_housing_name;
    //报修电话
    public $repair_mobile;
    //报修内容
    public $repair_content;
    //报修时间
    public $time;
}