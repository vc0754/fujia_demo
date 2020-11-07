<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-10-13
 * Time: 11:16
 */

namespace app\http\middleware;


use app\lib\enum\ApplicationEnum;
use think\exception\RouteNotFoundException;

class AppRoute
{
    public function handle($request, \Closure $next)
    {
        $pattern = "/(http|https):\/\/(.*)/";
        preg_match($pattern,env('API_HOST'),$apiMatch);
        //preg_match($pattern,env('DINNING_API_HOST'),$dinningMatch);

        if($request->host() == $apiMatch[2]){
            $request->application_id = ApplicationEnum::FU_JIA;
        }else{
            throw new RouteNotFoundException();
        }
        return $next($request);
    }
}