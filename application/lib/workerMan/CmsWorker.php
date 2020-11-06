<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/5/6
 * Time: 11:10
 */

namespace app\lib\workerMan;

use GatewayWorker\Lib\Gateway;


class CmsWorker
{
    public  function  send($clientID,$message){
        if(Gateway::isOnline($clientID)){
            Gateway::sendToClient($clientID,$message);
        }else{
            Gateway::closeClient($clientID);
        }
    }

}