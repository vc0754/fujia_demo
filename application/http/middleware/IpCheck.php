<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/29
 * Time: 9:32
 */

namespace app\http\middleware;

use app\lib\exception\token\ForbiddenException;

class IpCheck
{
    /**
     * @param $request
     * @param \Closure $next
     * @return mixed
     * @throws Exception
     */
    public function handle($request, \Closure $next){

        if(config('ip_check.ifFilter')){
            $ip = $request->ip();
            if (!in_array($ip, config('ip_check.ipWlist')))
            {
                throw new ForbiddenException([
                    'msg' => '非法IP地址'
                ]);
            }
        }
        return $next($request);
    }
}