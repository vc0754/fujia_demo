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
    'fj'=> [
        'app_id' => 'wx1317a8978145f5f6',
        'app_secret' => '18e5ea0b31429fa4a513ffc1b2d71c18',
    ],
//    'app_id' => '', //线上
//    'app_secret' => '',
    'login_url'=>'https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code',
    'pay_notify_callback_url' => ''
];