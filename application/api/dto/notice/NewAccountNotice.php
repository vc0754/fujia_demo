<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-31
 * Time: 10:10
 */

namespace app\api\dto\notice;


class NewAccountNotice
{
    //通知类型名
    public $notice_name;
    //用户公众号openID
    public $mp_openid;
    //客户名字
    public $customer_name;

}