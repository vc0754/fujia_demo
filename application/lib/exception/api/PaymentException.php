<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/16
 * Time: 10:38
 */

namespace app\lib\exception\api;


use LinCmsTp5\exception\BaseException;

class PaymentException extends BaseException
{

    public  $code = 400;
    public  $msg = '余额不足';
    public  $errorCode = 999;

}