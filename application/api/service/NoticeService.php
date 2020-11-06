<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/30
 * Time: 10:54
 */

namespace app\api\service;



use app\lib\enum\WxmpTemplate;
use app\lib\notice\NoticeContract;



/**
 * 通知服务类
 * Class Notice
 * @package app\api\service
 */
class NoticeService
{
    private $notice;

    public  function  __construct(NoticeContract $notice){
        $this->notice = $notice;
    }

    /**
     * 通知商户合同到期
     * @param $data
     */
    public function contractExpireNotify($data){
        $tempID = WxmpTemplate::LEASE_RENEWAL;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        if($data['days_left'] >= 0 ){
            $content ="您所在房源:{$data['housing_name']}还有{$data['days_left']}天到期，请及时续约。";
        }else{
            $content ="您所在房源:{$data['housing_name']}已到期，已超".abs($data['days_left'])."天未续约，请及时续约。";
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = '合同到期通知';
        $postArr['data']['keyword1']['value'] = "{$data['customer_name']}您好";
        $postArr['data']['keyword2']['value'] = $data['mobile'];
        $postArr['data']['keyword3']['value'] = $content;
        $postArr['data']['keyword4']['value'] = $data['expire_date'];
        if (array_key_exists('remark', $data)) {
            $postArr['data']['remark']['value'] = $data['remark'];
        }
        return $this->notice->send($postArr);
    }

    /**
     * 通知管理合同到期统计
     * @param $data
     */
    public function contractExpireCountNotify($data){
        $tempID = WxmpTemplate::WORKER_NOTICE;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = '今日合同状态提醒';
        $postArr['data']['keyword1']['value'] = "需续约商户数量:";
        $postArr['data']['keyword2']['value'] = "一个月内到期数:{$data['near_count']},延期未续约数:{$data['expired_count']}";
        if (array_key_exists('remark', $data)) {
            $postArr['data']['remark']['value'] = $data['remark'];
        }
        return $this->notice->send($postArr);
    }

    /**
     * 余额剩余通知
     * @param $data
     */
    public function balanceAlarmNotify($data){
        $tempID = WxmpTemplate::INSUFFICIENT_BALANCE;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = '水电余额通知';
        $postArr['data']['keyword1']['value'] = $data['customer_fid'];
        $postArr['data']['keyword2']['value'] = "{$data['customer_name']}";
        $postArr['data']['keyword3']['value'] = $data['customer_house_name'];
        $postArr['data']['keyword4']['value'] = "{$data['balance']}";
        $postArr['data']['keyword5']['value'] = $data['time'];
        if (array_key_exists('remark', $data)) {
            $postArr['data']['remark']['value'] = $data['remark'];
        }
        return $this->notice->send($postArr);

    }


    /**
     * 新账单通知
     * @param $data
     */
    public function newAccountNotice($data){
        $tempID = WxmpTemplate::PENDING_PAYMENT;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = $data['notice_name'];
        $postArr['data']['keyword1']['value'] = "{$data['customer_name']}您好";
        $postArr['data']['keyword2']['value'] = '您租用的房源有新的账单请及时缴费';
        $postArr['data']['keyword3']['value'] = '点击查看账单详情';
        if (array_key_exists('remark', $data)) {
            $postArr['data']['remark']['value'] = $data['remark'];
        }
        return $this->notice->send($postArr);

    }

    public function  customerComingIn($data){
        $tempID = WxmpTemplate::COMING_IN;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = "{$data['customer_name']},您好";
        $postArr['data']['keyword1']['value'] = "欢迎您来到富佳物业公众号-{$data['housing_name']}";
        $postArr['data']['keyword2']['value'] = $data['contract_time'];
        if (array_key_exists('remark', $data)) {
            $postArr['data']['remark']['value'] = $data['remark'];
        }
        return $this->notice->send($postArr);
    }

    public function feedbackNotify($data){
        $tempID = WxmpTemplate::NEW_FEEDBACK;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = "收到新的商户投诉通知";
        $postArr['data']['keyword1']['value'] = $data['customer_name'];
        $postArr['data']['keyword2']['value'] = $data['mobile'];
        $postArr['data']['keyword3']['value'] = $data['time'];
        $postArr['data']['keyword4']['value'] = $data['description'];
        if (array_key_exists('remark', $data)) {
            $postArr['data']['remark']['value'] = $data['remark'];
        }
        return $this->notice->send($postArr);
    }

    public function repairNotifyToManager($data){
        $tempID = WxmpTemplate::NEW_REPAIR;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = "有新的报修单，请及时跟进";
        $postArr['data']['keyword1']['value'] = $data['customer_name'];
        $postArr['data']['keyword2']['value'] = $data['repair_mobile'];
        $postArr['data']['keyword3']['value'] = $data['repair_housing_name'];
        $postArr['data']['keyword4']['value'] = $data['repair_content'];
        $postArr['data']['keyword5']['value'] = $data['time'];
        if (array_key_exists('remark', $data)) {
            $postArr['data']['remark']['value'] = $data['remark'];
        }
        return $this->notice->send($postArr);
    }

    public  function repairNotifyToCustomer($data){
        $tempID = WxmpTemplate::REPAIR_PROCESSING;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = "报修进度提醒";
        $postArr['data']['keyword1']['value'] = $data['order_no'];
        $postArr['data']['keyword2']['value'] = $data['repair_status'];
        $postArr['data']['keyword3']['value'] = $data['staff'];
        $postArr['data']['keyword4']['value'] = $data['staff_mobile'];
        if (array_key_exists('remark', $data)) {
            $postArr['data']['remark']['value'] = $data['remark'];
        }
        return $this->notice->send($postArr);
    }

    public function repairRateNotice($data){
        $tempID = WxmpTemplate::REPAIR_RATE_NOTICE;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = "维修报价提醒";
        $postArr['data']['keyword1']['value'] = $data['order_no'];
        $postArr['data']['keyword2']['value'] = $data['housing_name'];
        $postArr['data']['keyword3']['value'] = $data['content'];
        $postArr['data']['keyword4']['value'] = $data['repair_status'];
        $postArr['data']['keyword5']['value'] = $data['time'];
        if (array_key_exists('remark', $data)) {
            $postArr['data']['remark']['value'] = $data['remark'];
        }
        return $this->notice->send($postArr);
    }

    public function repairCancelNotice($data){
        $tempID = WxmpTemplate::REPAIR_CANCEL;
        $postArr = config('wxmp_template.template_1');
        $mpOpenid = $data['mp_openid'];
        if(!$mpOpenid){
            return;
        }
        $postArr['touser'] = $mpOpenid;
        $postArr['template_id'] = $tempID;
        $postArr['data']['first']['value'] = "取消维修提醒";
        $postArr['data']['keyword1']['value'] = $data['time'];
        $postArr['data']['keyword2']['value'] = $data['type_name'];
        $postArr['data']['keyword3']['value'] = $data['housing_name'];
        $postArr['data']['keyword4']['value'] = $data['content'];
        $postArr['data']['remark']['value'] = $data['order_no'];

//        if (array_key_exists('remark', $data)) {
//            $postArr['data']['remark']['value'] = $data['remark'];
//        }
        return $this->notice->send($postArr);
    }



    public function __call($name, $arguments)
    {
        print_r("找不到該方法");
        return true;
    }

}