<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/2/28
 * Time: 15:48
 */

namespace app\lib\exception\common;


use LinCmsTp5\exception\BaseException;

class ParameterException extends BaseException
{
    public $code = 400;
    public $msg = '参数错误';
    public $error_code = '10000';
}