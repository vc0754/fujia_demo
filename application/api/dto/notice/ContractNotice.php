<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-08-11
 * Time: 10:38
 */

namespace app\api\dto\notice;


use app\api\dto\Mapper;

class ContractNotice extends Mapper
{
    //公众号ID
    public $mp_openid;

    //合同号
    public $contract_no;

    //手机号
    public $mobile;

    //商户名字
    public $customer_name;

    //房源名字
    public $housing_name;

    //到期时间
    public $expire_date;

    //离终止天数
    public $days_left;
}