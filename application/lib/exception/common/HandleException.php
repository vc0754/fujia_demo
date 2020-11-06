<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/3
 * Time: 15:06
 */

namespace app\lib\exception\common;


use LinCmsTp5\exception\BaseException;

class HandleException extends BaseException
{
    //用户自己行为操作错误 code 定义成200
    public $code = 200;
    public $msg = '禁止当前操作';
    public $error_code = '90000';
}