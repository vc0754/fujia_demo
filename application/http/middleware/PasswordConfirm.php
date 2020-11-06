<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-08-07
 * Time: 13:55
 */

namespace app\http\middleware;


use app\lib\exception\token\ForbiddenException;
use LinCmsTp5\admin\model\LinUser;
use think\Exception;


class PasswordConfirm
{
    /**
     * @param $request
     * @param \Closure $next
     * @return mixed
     * @throws Exception
     */
    public function handle($request, \Closure $next){
        $password = $request->param('password');
        if(!$password){
            throw new ForbiddenException([
                'msg' => '密码错误'
            ]);
        }
        try{
           LinUser::verify('super',$password);
        }catch (Exception $ex){
            throw $ex;
        }
        return $next($request);
    }
}