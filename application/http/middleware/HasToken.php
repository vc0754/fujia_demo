<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/2/28
 * Time: 13:33
 */

namespace app\http\middleware;


use app\lib\token\Token;

class HasToken
{
    /**
     * 提供只拦截未带token，但不管理权限的api请求
     * @param $request
     * @param $next
     * @return mixed
     * @throws \app\lib\exception\token\TokenException
     * @throws \think\Exception
     */
    public function handle($request, \Closure $next)
    {
        Token::getCurrentUID();
        return $next($request);
    }
}