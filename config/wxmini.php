<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/16
 * Time: 9:49
 */

return [
//    'app_id' => 'wx7778c091bb692d52', //开发(JN)
//    'app_secret' => 'ec3335a11f1032357c420fdca442d4bb',

//    'app_id' => 'wx30b6abea31bc62c6', //开发(ZL)
//    'app_secret' => '97c5812dc01adbffa66e736a0ffc53ac',

    'th' => [
        'app_id' => 'wxe436ebefff9aad3d', //开发(VC)
        'app_secret' => '010af0784b001ed261552e9f7b00d3ac',
    ],
    
    'fj'=> [
        'app_id' => '',
        'app_secret' => '',
    ],

//    'app_id' => '', //线上
//    'app_secret' => '',
    'login_url'=>'https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code',
    'pay_notify_callback_url' => ''
];