<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/30
 * Time: 10:08
 */

namespace app\api\service;

use think\Db;
use think\Exception;
use think\Queue;
use LinCmsTp5\admin\model\LinLog;
use think\facade\Request;
use think\facade\Response;
use Zeroibc\DingDingRobot;

/**
 * 队列服务
 * Class QueueService
 * @package app\api\service
 */
abstract class QueueService
{


    protected function  pushQueueJob($jobData,$jobHandlerClassName,$jobQueueName){
        try{
            if(!array_key_exists('later_time',$jobData)){
                //延时时间参数必须
                return;
            }
            if($jobData['later_time'] > 0){
                $isPushed = Queue::later($jobData['later_time'],$jobHandlerClassName, $jobData, $jobQueueName);
            }else if($jobData['later_time'] == 0){
                $isPushed = Queue::push($jobHandlerClassName , $jobData , $jobQueueName );
            }else{
                return false;
            }
            return $isPushed;
        }catch (Exception $e){
            $robot = new DingDingRobot(config('ding_robot.web_hook'));
            $content = ['content' => "redis链接异常，请及时检查处理"];
            $robot->setTextType()->setContent($content)->send();
            db('t_queue_tmp')->insert([
                'queue_name'=>$jobQueueName,
                'job_handler' => $jobHandlerClassName,
                'job_data' => json_encode($jobData),
                'err_time' => date('Y-m-d H:i:s',time())
            ]);
            return false;
        }
    }

    protected function logRecord(bool $isPushed,$message,$uid = -1,$username = '系统任务'){
        if($isPushed !== false ){
            $message = date('Y-m-d H:i:s') . ":{$message}推送到消息队列成功";
            $uid = -1;
            $username = "系统任务";
        }else{
            $message = date('Y-m-d H:i:s') . ": {$message}推送到消息队列失败";
            $uid = -1;
            $username = "系统任务";
        }
        $data = [
            'message' =>  $message,
            'user_id' => $uid,
            'user_name' => $username,
            'status_code' => Response::getCode(),
            'method' => Request::method(),
            'path' => Request::path(),
            'authority' => ''
        ];

        LinLog::create($data);
    }
}