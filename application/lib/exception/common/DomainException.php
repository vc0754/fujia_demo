<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-16
 * Time: 16:10
 */

namespace app\lib\exception\common;



use LinCmsTp5\exception\BaseException;

class DomainException extends BaseException
{
    public $code = 404;
    public $msg = '模型不存在';
    public $errorCode = 90050;
}