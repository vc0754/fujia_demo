<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: yunwuxin <448901948@qq.com>
// +----------------------------------------------------------------------

return [
    'subscribe_mqtt'	=>	'app\common\command\SubscribeMQTT',
    'rabbitmq'	        =>	'app\common\command\ConsumerRabbitMQ',
    'device_switch' 	=>	'app\common\command\DeviceSwitch',
    'dead_rabbitmq'     =>  'app\common\command\DeadLetterRabbitMQ',
    'dinning_refund'    =>  'app\common\command\DinningRefundProcess'
];
