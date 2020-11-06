<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/27
 * Time: 20:37
 */

namespace app\job;


use app\api\service\NoticeService;

use think\queue\Job;
use LinCmsTp5\admin\model\LinLog;
use Zeroibc\DingDingRobot;

class SendNotice
{

    public function newAccountNoticeTask(Job $job,$data){
        $method = 'newAccountNotice';
        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3) {
                print("<info>This Job will be availabe again after 60s."."</info>\n");
                $job->release(60); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    /**
     * fire方法是消息队列默认调用的方法
     * @param Job            $job      当前的任务对象
     * @param array|mixed    $data     发布任务时自定义的数据
     */
    public function balanceAlarmTask(Job $job,$data)
    {
        $method = 'balanceAlarmNotify';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3) {
                print("<info>This Job will be availabe again after 60s."."</info>\n");
                $job->release(60); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function contractExpireNoticeTask(Job $job,$data)
    {
        $method = 'contractExpireNotify';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3) {
                print("<info>This Job will be availabe again after 60s."."</info>\n");
                $job->release(60); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function contractExpireCountNoticeTask(Job $job,$data)
    {
        $method = 'contractExpireCountNotify';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3) {
                print("<info>This Job will be availabe again after 60s."."</info>\n");
                $job->release(60); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function customerComingInTask(Job $job,$data)
    {
        $method = 'customerComingIn';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3) {
                print("<info>This Job will be availabe again after 60s."."</info>\n");
                $job->release(60); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function feedbackNoticeTask(Job $job,$data){
        $method = 'feedbackNotify';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3) {
                print("<info>This Job will be availabe again after 60s."."</info>\n");
                $job->release(60); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
        }
    }

    public function repairNoticeToManager(Job $job,$data){
        $method = 'repairNotifyToManager';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3 && $job->attempts() <= 50) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $job->release(600); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
            if ($job->attempts() > 50) {
                print("<info>This Job will be delete,Too many attempts "."</info>\n");
                $job->delete(); //重试次数过多直接出队删除
            }
        }
    }

    public function repairNoticeToCustomer(Job $job,$data){
        $method = 'repairNotifyToCustomer';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3 && $job->attempts() <= 50) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $job->release(600); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
            if ($job->attempts() > 50) {
                print("<info>This Job will be delete,Too many attempts "."</info>\n");
                $job->delete(); //重试次数过多直接出队删除
            }
        }
    }

    public function repairRateNotice(Job $job,$data){
        $method = 'repairRateNotice';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3 && $job->attempts() <= 50) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $job->release(600); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
            if ($job->attempts() > 50) {
                print("<info>This Job will be delete,Too many attempts "."</info>\n");
                $job->delete(); //重试次数过多直接出队删除
            }
        }
    }

    public function repairCancelNotice(Job $job,$data){
        $method = 'repairCancelNotice';

        $isJobDone = $this->processJob($method,$data);

        if ($isJobDone) {
            // 如果任务执行成功， 记得删除任务
            $job->delete();

        }else{
            if ($job->attempts() > 3 && $job->attempts() <= 50) {
                print("<info>This Job will be availabe again after 600s."."</info>\n");
                $job->release(600); //$delay为延迟时间，表示该任务延迟60秒后再执行
            }
            if ($job->attempts() > 50) {
                print("<info>This Job will be delete,Too many attempts "."</info>\n");
                $job->delete(); //重试次数过多直接出队删除
            }
        }
    }


    public function processJob($method,$data){
        $driver = config('notice.driver');
        if(!$driver){
            return false;
        }
        $noticeDriver= new $driver;

        $res = (new NoticeService($noticeDriver))->$method($data);

        if($res){
            print("<info>成功</info>\n");
            return true;
        }else{

            print("<info>失败重试</info>\n");
            return false;
        }
    }

}