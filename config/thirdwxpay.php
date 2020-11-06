<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/1/8
 * Time: 11:58
 */
return[
    'fj' => [
        'mchid' => '', //mchid正式
        'paykey'=> '', //signkey正式
    ],
    'pay_notify_callback_url' => env('API_HOST').'/pay/third_notify'
];