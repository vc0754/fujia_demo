<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/4/25
 * Time: 14:33
 */

namespace app\lib\exception\common;


use LinCmsTp5\exception\BaseException;

class OrderException extends  BaseException
{
    public $code = 404;
    public $msg = '订单不存在';
    public $errorCode = 80000;
}