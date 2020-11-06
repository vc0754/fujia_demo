<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-08-24
 * Time: 11:34
 */

namespace app\lib\exception\common;


use LinCmsTp5\exception\BaseException;

class SysConfException extends BaseException
{
    //用户自己行为操作错误 code 定义成200
    public $code = 200;
    public $msg = '系统尚未启用该功能';
    public $error_code = '70000';
}