<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-09
 * Time: 17:54
 */

namespace app\api\dto\account;


use app\api\dto\Mapper;

class PaymentDetails extends Mapper
{
    public $online_wechat = 0;

    public $offline_cash = 0;

    public $offline_wechat = 0;

    public $offline_alipay = 0;

    public $offline_by_card = 0;

    public $pay_order_id;

    public function __construct($array)
    {
        parent::__construct($array);
    }
}