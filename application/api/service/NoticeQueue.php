<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-02
 * Time: 14:21
 */

namespace app\api\service;


use app\api\dto\notice\BalanceAlarm;
use app\api\dto\notice\ContractExpireCount;
use app\api\dto\notice\ContractNotice;
use app\api\dto\notice\CustomerComingIn;
use app\api\dto\notice\FeedbackNotice;
use app\api\dto\notice\NewAccountNotice;
use app\api\dto\notice\NewRepairNotice;
use app\api\dto\notice\RepairCancelNotice;
use app\api\dto\notice\RepairRateNotice;
use app\api\dto\notice\RepairStatusNotice;
use app\api\model\RepairApplication;


class NoticeQueue extends QueueService
{
    //队列名
    const QUEUE_NAME = 'NoticeQueue';

    /**
     * 余额告警通知
     * @param BalanceAlarm $balanceAlarm
     */
    public function  balanceAlarmNotify(BalanceAlarm $balanceAlarm){
        $jobHandlerClassName  = 'app\job\SendNotice@balanceAlarmTask';
        $jobData = (array) $balanceAlarm;
        $jobData['later_time'] = 0;
        $message = "消息通知成功";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }


    public function  newAccountNotice(NewAccountNotice $dto){
        $jobHandlerClassName  = 'app\job\SendNotice@newAccountNoticeTask';
        $jobData = (array) $dto;
        $jobData['later_time'] = 0;
        $message = "消息通知成功";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    /**
     *  商户合同到期提醒
     * @param ContractNotice $dto
     */
    public function contractExpireNotice(ContractNotice $dto){
        $jobHandlerClassName  = 'app\job\SendNotice@contractExpireNoticeTask';
        $jobData = (array) $dto;
        $jobData['later_time'] = 0;
        $message = "合同到期提醒消息通知成功";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }


    /**
     * 管理人员合同到期数提醒
     * @param ContractExpireCount $dto
     */
    public function contractExpireCountNotice(ContractExpireCount $dto){
        $jobHandlerClassName  = 'app\job\SendNotice@contractExpireCountNoticeTask';
        $jobData = (array) $dto;
        $jobData['later_time'] = 0;
        $message = "合同到期提醒消息通知成功";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }


    public function customerComingIn(CustomerComingIn $dto){
        $jobHandlerClassName  = 'app\job\SendNotice@customerComingInTask';
        $jobData = (array) $dto;
        $jobData['later_time'] = 0;
        $message = "商户入驻成功";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    public function feedbackNotice(FeedbackNotice $dto){
        $jobHandlerClassName  = 'app\job\SendNotice@feedbackNoticeTask';
        $jobData = (array) $dto;
        $jobData['later_time'] = 0;
        $message = "投诉建议通知";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    public function repairNotice(NewRepairNotice $dto){
        $jobHandlerClassName  = 'app\job\SendNotice@repairNoticeToManager';
        $jobData = (array) $dto;
        $jobData['later_time'] = 0;
        $message = "报修通知";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    public function repairStatusNotice(RepairStatusNotice $dto){
        $jobHandlerClassName  = 'app\job\SendNotice@repairNoticeToCustomer';
        $jobData = (array) $dto;
        $jobData['later_time'] = 0;
        $message = "报修状态通知";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    public function repairRateNotice(RepairRateNotice $dto){
        $jobHandlerClassName  = 'app\job\SendNotice@repairRateNotice';
        $jobData = (array) $dto;
        $jobData['later_time'] = 0;
        $message = "报修进度通知";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    public function repairCancelNotice(RepairCancelNotice $dto){
        $jobHandlerClassName  = 'app\job\SendNotice@repairCancelNotice';
        $jobData = (array) $dto;
        $jobData['later_time'] = 0;
        $message = "报修取消通知";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }



}