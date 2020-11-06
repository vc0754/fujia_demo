<?php
namespace app\api\model;


use app\api\dto\notice\FeedbackNotice;
use app\lib\enum\FeedbackStatus;
use app\lib\exception\common\ParameterException;

class Feedback extends MyBaseModel
{
    protected $table = 't_feedback';

    public static function getPageList($filter,$page = 1,$size =15){
        return self::where($filter)->order('create_time','desc')->paginate($size,false,['page'=>$page]);
    }

    public static function onAfterInsert($model){
        //通知管理人员
        $customer = Customer::get($model->customer_id);
        $managers = Member::getManagers();
        foreach ($managers as $manager){
            if($manager->mp_openid){
                $feedbackNotice = new FeedbackNotice();
                $feedbackNotice->mp_openid = $manager->mp_openid;
                $feedbackNotice->customer_name = $customer['name'];
                $feedbackNotice->mobile = $customer['mobile_phone'];
                $feedbackNotice->description = $model['description'];
                $feedbackNotice->time = $model['create_time'];
                app('notice_queue')->feedbackNotice($feedbackNotice);
            }
        }

    }


    public static function complete($params){
        $feedbackObj = self::get($params['id']);
        if (!$feedbackObj) {
            throw new ParameterException();
        }

        if($feedbackObj->status != FeedbackStatus::UNREAD){
            throw new ParameterException([
                'msg' => '信息状态错误'
            ]);
        }

        $params['status'] = FeedbackStatus::READ;
        return $feedbackObj->save($params);
    }

}