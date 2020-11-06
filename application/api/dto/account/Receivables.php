<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/9
 * Time: 18:10
 */

namespace app\api\dto\account;


use app\api\dto\Mapper;

class Receivables extends Mapper
{
    public $bills;
    public $online_wechat;
    public $offline_cash;
    public $offline_wechat;
    public $offline_alipay;
    public $offline_by_card;
    public $online_banking;
    public $pay_order_id;
    public $charge_time;
    public $remark = '';


    public function __construct($array)
    {
        parent::__construct($array);
    }
}