<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-02
 * Time: 14:14
 */

namespace app\api\service;

use app\api\dto\kingdee\BindCard;
use app\api\dto\kingdee\CardBillDto;
use app\api\dto\kingdee\ContractState;
use app\api\dto\kingdee\MakeCard;
use app\api\dto\kingdee\ReceivableBill;
use app\api\dto\kingdee\RepairOffer;
use app\api\dto\kingdee\StopContract;
use app\api\dto\kingdee\UtilityBill;
use app\api\dto\kingdee\LossAndChangeCard;


class KingdeeQueue extends QueueService
{
    //队列名
    const QUEUE_NAME = 'KingdeeQueue';


    /**
     * 收费单推送金蝶
     *
     * @return void
     */
    public function pushPaymentRecord($data){
        $jobHandlerClassName  = 'app\job\PushToKingdee@paymentRecordTask';
        $jobData = (array) $data;
        if($data instanceof  ReceivableBill){
            $jobData['dto'] = 'ReceivableBill';
            $message = "推送收费单:{$jobData['Receivable']->id}";
        }else{
            $jobData['dto'] = 'Recharge';
            $message = "推送收费单:{$jobData['id']}";
        }


        $jobData['later_time'] = 0;
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    /**
     * 录入新卡推送金蝶
     * @param BindCard $pushCard
     */
    public function pushBindCard(BindCard $pushCard){
        $jobHandlerClassName  = 'app\job\PushToKingdee@bindCardTask';
        $jobData = (array) $pushCard;
        $jobData['later_time'] = 0;
        $message = "创建新卡:{$pushCard->card_no}";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    /**
     * 用户开卡推送金蝶
     * @param MakeCard $makeCard
     */
    public function  pushMakeCard(MakeCard $makeCard){
        $jobHandlerClassName  = 'app\job\PushToKingdee@makeCardTask';
        $jobData = (array) $makeCard;
        $jobData['later_time'] = 0;
        $message = "客户开卡:{$makeCard->card_no}";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    /**
     * 推送水电消费流水账单
     * @param UtilityBill $utilityBill
     */
    public function pushUtilityBill(UtilityBill $utilityBill){
        $jobHandlerClassName  = 'app\job\PushToKingdee@pushUtilityBillTask';
        $jobData = (array) $utilityBill;
        $jobData['later_time'] = 0;
        $message = "账单推送:{$utilityBill->bill_no}";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    /**
     * 推送合同
     * @param ContractState $contractState
     */
    public function pushContract(ContractState $contractState){
        $jobHandlerClassName  = 'app\job\PushToKingdee@pushContractTask';
        $jobData = (array) $contractState;
        $jobData['later_time'] = 0;
        $message = "更新合同ID:{$contractState->fid},状态{$contractState->state}";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    /**
     * 推送终止合同
     * @param StopContract $contract
     */
    public function pushStopContract(StopContract $contract){
        $jobHandlerClassName  = 'app\job\PushToKingdee@pushStopContractTask';
        $jobData = (array) $contract;
        $jobData['later_time'] = 0;
        $message = "终止合同ID:{$contract->fid}}";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    /**
     * 推送水卡消费账单
     */
    public function pushCardBill(CardBillDto $cardBill){
        $jobHandlerClassName  = 'app\job\PushToKingdee@pushCardBillTask';
        $jobData = (array) $cardBill;
        $jobData['later_time'] = 0;
        $message = "推送水控机水卡消费账单:{$cardBill->bill_no}}";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    /**
     * 推送水卡挂失换卡
     */
    public function pushLossAndChangeCard(LossAndChangeCard $dtoEntrty){
        $jobHandlerClassName  = 'app\job\PushToKingdee@pushLossAndChangeCardTask';
        $jobData = (array) $dtoEntrty;
        $jobData['later_time'] = 0;
        $message = "推送水卡挂失换卡:old:{$dtoEntrty->old_card_no}|new:{$dtoEntrty->new_card_no}}";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    /**
     * 推送报修记录-报价
     * @param RepairOffer $repairOffer
     */
    public function pushRepair(RepairOffer $repairOffer){
        $jobHandlerClassName  = 'app\job\PushToKingdee@pushRepairTask';
        $jobData = (array) $repairOffer;
        $jobData['later_time'] = 0;
        $message = "推送报修账单:{$repairOffer->repair_no}";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

    public function pushRepairCancel($data){
        $jobHandlerClassName  = 'app\job\PushToKingdee@pushRepairCancelTask';
        $jobData = $data;
        $jobData['later_time'] = 0;
        $message = "推送报修申请取消:{$data['fid']}";
        $isPushed = $this->pushQueueJob($jobData,$jobHandlerClassName,self::QUEUE_NAME);
        $this->logRecord($isPushed,$message);
    }

}