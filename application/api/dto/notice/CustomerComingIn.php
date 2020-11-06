<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-08-12
 * Time: 10:08
 */

namespace app\api\dto\notice;

/**
 * 商户入驻通知
 * Class CustomerComingIn
 * @package app\api\dto\notice
 */
class CustomerComingIn
{
    public $mp_openid;

    public $customer_name;

    public $housing_name;

    public $contract_time;
}