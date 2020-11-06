<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-15
 * Time: 15:37
 */

namespace app\api\dto\pay;

use app\api\dto\Mapper;

/**
 * 条形码支付规范Dto
 * Class PayBarcode
 * @package app\api\dto\pay
 */
class PayBarcodeDto extends Mapper
{
    public $barcode = '';

    public $money = 0.00;

    public $pay_type = 0;

    public $bill_source = 0;

    public $customer_fid = 0;

    public $member_id = 0;
}