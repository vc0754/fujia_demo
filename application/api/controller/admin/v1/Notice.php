<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/4/6
 * Time: 11:34
 */

namespace app\api\controller\admin\v1;
use app\api\controller\BaseController;
use app\lib\exception\common\ParameterException;
use app\lib\token\Token;
use think\Request;

class Notice extends BaseController
{
    /**
     * 主动发送通知
     * @param Request $request
     */
    public function  sendNotice(Request $request){

    }
}