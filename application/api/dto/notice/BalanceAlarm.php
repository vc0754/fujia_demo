<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-02
 * Time: 14:37
 */

namespace app\api\dto\notice;


class BalanceAlarm
{
    //用户公众号openID
    public $mp_openid;
    //商户编号
    public $customer_fid;
    //客户名字
    public $customer_name;
    //商户地址
    public $customer_house_name;
    //所剩余额
    public $balance;
    //截止时间
    public $time;
    //限定配额
    public $quota;
    // 备注
    public $remark;

}