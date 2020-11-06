<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-11
 * Time: 16:09
 */

namespace app\api\service;


use think\facade\Env;

class PushMsgService
{
//    const HOST = 'http://192.168.3.88:82';
//    const HOST = 'http://31b800037z.zicp.vip';
    //const HOST = 'http://stth-2020.gnway.cc:82';
//    const HOST = 'http://stth-2020.gnway.org'; //测试65418

    //激活卡片0
    const BIND_CARD_API = '/Service/THCardSync.ashx?action=InitCard';
    //客户首次开卡
    const MAKE_CARD_API = '/Service/THCardSync.ashx?action=BindCustomer';
    //收费单_应收
    const PAYMENT_RECORD_API = '/Service/THPaymentSync.ashx?action=Receivable';
    //收费单_充值
    const PAYMENT_RECORD_Recharge_API = '/Service/THPaymentSync.ashx?action=Recharge';
    //更新合同状态
    const CONTRACT_STATE_API = '/Service/THContractSync.ashx?action=ChangeState';
    //水电账单
    const UTILITY_BILL_API = '/Service/THTimingBill.ashx?action=AddBill';
    //终止合同
    const STOP_CONTRACT = '/Service/THContractSync.ashx?action=Over';
    //水卡账单
    const CARD_BILL = '/Service/THCardSync.ashx?action=AddBill';
    //水卡挂失补卡
    const LOSS_AND_CHANGE_CARD = '/Service/THCardSync.ashx?action=LossAndChange';
    //报修单_报价
    const REPAIR_BILL = '/Service/THPaymentSync.ashx?action=RepairBill';
    //报修单_取消
    const REPAIR_CANCEL = '/Service/THPaymentSync.ashx?action=CancelReceivable';



    public function pushBindCard($data):bool
    {
        $data = ['CardTempInfo'=>$data];
        $res = http_request(env('KINGDEE_HOST').self::BIND_CARD_API,'POST',$data);
        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function pushMakeCard($data) : bool
    {
        $data = ['CardInfo'=>$data];
        $res = http_request(env('KINGDEE_HOST').self::MAKE_CARD_API,'POST',$data);
        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function pushPaymentRecord($data): bool
    {
        if($data['dto'] === 'ReceivableBill'){
            $res = http_request(env('KINGDEE_HOST').self::PAYMENT_RECORD_API,'POST',$data);
        }else{
            $data = ['Recharge'=>$data];
            $res = http_request(env('KINGDEE_HOST').self::PAYMENT_RECORD_Recharge_API,'POST',$data);
        }

        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function pushContractState($data){

        $res = http_request(env('KINGDEE_HOST').self::CONTRACT_STATE_API,'POST',$data);
        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function pushUtilityBill($data){
        $data = ['TimingBill'=>$data];
        $res = http_request(env('KINGDEE_HOST').self::UTILITY_BILL_API,'POST',$data);
        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function pushStopContract($data){
        $res = http_request(env('KINGDEE_HOST').self::STOP_CONTRACT,'POST',$data);
        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function pushCardBill($data){
        $data = ['CardBill'=>$data];
        $res = http_request(env('KINGDEE_HOST').self::CARD_BILL,'POST',$data);
        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function pushLossAndChangeCard($data){
        $res = http_request(env('KINGDEE_HOST').self::LOSS_AND_CHANGE_CARD,'POST',$data);
        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function pushRepair($data){
        $data = ['RepairOffer'=>$data];
        $res = http_request(env('KINGDEE_HOST').self::REPAIR_BILL,'POST',$data);
        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function pushRepairCancel($data){
        $res = http_request(env('KINGDEE_HOST').self::REPAIR_CANCEL,'POST',$data);
        $res = json_decode($res,true);

        if(!$res || !($res['Code'] === 1)){
            return false;
        }
        return true;
    }

    public function __call($name, $arguments)
    {
        print_r("找不到該方法");
        return true;
    }
}