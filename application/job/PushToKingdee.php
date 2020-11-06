<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-11
 * Time: 15:42
 */

namespace app\job;

use app\api\service\PushMsgService;
use think\queue\Job;
use Zeroibc\DingDingRobot;

class PushToKingdee
{
    const  ATTEMPTS_COUNT = 3;

    const RELEASE_TIME = 300;

    /**
     * 推送收费单消息
     *
     * @param Job $job
     * @param [type] $data
     * @return void
     */
    public function paymentRecordTask(Job $job,$data){

        $method = 'pushPaymentRecord';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > self::ATTEMPTS_COUNT) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }


    /**
     * fire方法是消息队列默认调用的方法
     * @param Job            $job      当前的任务对象
     * @param array|mixed    $data     发布任务时自定义的数据
     */
    public function bindCardTask(Job $job,$data)
    {
        $method = 'pushBindCard';
//        $job->delete();
        // 有些消息在到达消费者时,可能已经不再需要执行了
        $isJobStillNeedToBeDone = $this->checkDatabaseToSeeIfJobNeedToBeDone($data);
        if(!$isJobStillNeedToBeDone){
            $job->delete();
            return;
        }
        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();
//            $message = date('Y-m-d H:i:s') . ": 新增".$data['class_name']."的消息已通知成功!";
//            $uid = -1;
//            $username = "通知任务";
//            $data = [
//                'message' => 'cron' . $message,
//                'user_id' => $uid,
//                'user_name' => $username,
//                'status_code' => Response::getCode(),
//                'method' => Request::method(),
//                'path' => Request::path(),
//                'authority' => ''
//            ];
//
//            LinLog::create($data);
        }else{
                if ($job->attempts() > self::ATTEMPTS_COUNT) {
                    print("<info>This Job will be availabe again after 600s."."</info>\n");
                    $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                    $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
                }
        }
    }

    public function makeCardTask(Job $job,$data){
        $method = 'pushMakeCard';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > self::ATTEMPTS_COUNT) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function pushUtilityBillTask(Job $job,$data){
        $method = 'pushUtilityBill';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();
        }else{
            if ($job->attempts() > self::ATTEMPTS_COUNT) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function pushContractTask(Job $job,$data){
        $method = 'pushContractState';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();
        }else{
            if ($job->attempts() > self::ATTEMPTS_COUNT) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function pushStopContractTask(Job $job,$data){
        $method = 'pushStopContract';
        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();
        }else{
            if ($job->attempts() > self::ATTEMPTS_COUNT) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function pushCardBillTask(Job $job,$data){
        $method = 'pushCardBill';
        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();
        }else{
            if ($job->attempts() > self::ATTEMPTS_COUNT) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function pushLossAndChangeCardTask(Job $job,$data){
        $method = 'pushLossAndChangeCard';
        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();
        }else{
            if ($job->attempts() > self::ATTEMPTS_COUNT) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function pushRepairTask(Job $job,$data){
        $method = 'pushRepair';
        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();
        }else{
            if ($job->attempts() > self::ATTEMPTS_COUNT) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function pushRepairCancelTask(Job $job,$data){
        $method = 'pushRepairCancel';
        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();
        }else{
            if ($job->attempts() > self::ATTEMPTS_COUNT) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $this->robotNotice("系统告警:方法-{$method}推送金蝶时发生错误，请检查");
                $job->release(self::RELEASE_TIME); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }





    /**
     * 有些消息在到达消费者时,可能已经不再需要执行了
     * @param array|mixed    $data     发布任务时自定义的数据
     * @return boolean                 任务执行的结果
     */
    private function checkDatabaseToSeeIfJobNeedToBeDone($data){
        //延时时间小于0 直接出队不通知
//        if(time()-$data['later_time'] > $data['class_time']){
//            return false;
//        }
        return true;
    }



    public function processJob($method,$data){
        $res = (new PushMsgService())->$method($data);
        if($res){
            print("<info>成功</info>\n");
            return true;
        }else{
            print("<info>失败重试</info>\n");
            return false;
        }
    }

    private function robotNotice($content){
        $robot = new DingDingRobot(config('ding_robot.web_hook'));
        $content = ['content' => $content];
        $robot->setTextType()->setContent($content)->send();
    }
}