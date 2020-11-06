<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-27
 * Time: 15:35
 */

namespace app\lib\wxmp;

use EasyWeChat\Factory;

trait  WxmpProvider
{
    public $wx = null;

    public $wxmpMangerServUrl = 'http://tianhuan.yuxiangxx.com/mp/entr/index/mid/2.html';

    public function __construct()
    {
        $config = [
            'app_id' => config('wxmp.appid'),
            'secret' => config('wxmp.secret'),
            'token' => "THYX20200725",
            // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
            'response_type' => 'array',
            //...
        ];
        $this->wx = Factory::officialAccount($config);
    }
}