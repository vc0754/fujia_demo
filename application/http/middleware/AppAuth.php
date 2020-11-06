<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/2/28
 * Time: 13:50
 */

namespace app\http\middleware;

use app\lib\appAuth\Auth as Permission;
use app\lib\enum\ApplicationEnum;
use app\lib\exception\common\AuthActionException;
use app\lib\exception\token\ForbiddenException;
use app\lib\token\Token;
use think\Exception;
use think\Facade\Cache;

class AppAuth
{
    /**
     * 小程序鉴权
     * @param $request
     * @param \Closure $next
     * @return mixed
     * @throws \ReflectionException
     * @throws \app\lib\exception\token\TokenException
     * @throws \think\Exception
     */
    public function handle($request, \Closure $next,$applicationName)
    {

        if($applicationName == 'fu_jia') {
            $appID = ApplicationEnum::FU_JIA;
        }else{
            throw new Exception();
        }
        $auth =  (new Permission($request))->check($appID);
        if (!$auth) {
            $openID = Token::getCurrentWxOpenID($appID);
            $res = Cache::get($openID);

            if(!$res){
                throw new ForbiddenException(['error_code'=> 10004]);
            }
            throw new ForbiddenException();
        }
        return $next($request);
    }
}