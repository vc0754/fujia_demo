<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/4/14
 * Time: 18:15
 */

namespace app\lib\redis;

use Predis\Client;
use think\Exception;

class Redis
{
    public  $redis = '';

    public function __construct()
    {
        if(!extension_loaded('redis')){
            throw new Exception('redis.so文件不存在');
        }
        $server = config('redis.');

        $this->redis = new Client($server);

    }


    public function __call($methodName,$arguments){
        return $this->redis->$methodName(...$arguments);
    }
}