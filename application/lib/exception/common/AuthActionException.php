<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/2/29
 * Time: 17:05
 */

namespace app\lib\exception\common;

use LinCmsTp5\exception\BaseException;
class AuthActionException extends BaseException
{
    public $code = 401;
    public $msg = '权限操作错误';
    public $error_code = '40000';
}