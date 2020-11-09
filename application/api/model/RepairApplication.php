<?php
namespace app\api\model;


use app\api\dto\notice\NewRepairNotice;
use app\api\dto\notice\RepairCancelNotice;
use app\api\dto\notice\RepairRateNotice;
use app\api\dto\notice\RepairStatusNotice;
use app\lib\enum\BillState;
use app\lib\enum\OperatorType;
use app\lib\enum\RepairStatus;
use app\lib\exception\common\ParameterException;

class RepairApplication extends MyBaseModel
{
    protected $table = 't_repair_application';

    public static function getPageList($filter,$page = 1,$size =15){
        return self::where($filter)->order('create_time','desc')->paginate($size,false,['page'=>$page]);
    }


    public static function processing($params){
        $repairObj = self::get($params['id']);
        if (!$repairObj) {
            throw new ParameterException();
        }
        $repairObj->processing_time = time();
        $repairObj->status = RepairStatus::ACCEPTING;
        $repairObj->member_id = $params['member_id'];
        $repairObj->staff = $params['staff'];
        $repairObj->staff_phone = $params['staff_phone'];
        return $repairObj->save();
    }

    public static function onAfterInsert($model){
        //通知客服人员
        $customer = Customer::get($model->customer_id);
        $waiters = Member::getWaiter();
        foreach ($waiters as $waiter){
            if($waiter->mp_openid){
                $newRepairNotice = new NewRepairNotice();
                $newRepairNotice->customer_name = $customer['name'];
                $newRepairNotice->mp_openid = $waiter->mp_openid;
                $newRepairNotice->repair_content = $model['description'];
                $newRepairNotice->repair_housing_name = Housing::where('fid',$model['repair_unit'])->value('name');
                $newRepairNotice->repair_mobile = $model['phone'];
                $newRepairNotice->time = $model['create_time'];
                app('notice_queue')->repairNotice($newRepairNotice);
            }
        }
    }

    public static function onAfterUpdate($model){
        $customer = Customer::get($model->customer_id);
        $housingName = Housing::where('fid',$model['repair_unit'])->value('name');
        //通知管理人员
        $statusStr = [
            1=>'待受理',2=>'维修中',3=>'完成',9=>'取消'
        ];
        $members = Member::getMembersByMobile($customer->mobile_phone);
        foreach ($members as $member){
            if($member->mp_openid){
                $repairStatusNotice = new RepairStatusNotice();
                $repairStatusNotice->mp_openid = $member->mp_openid;
                $repairStatusNotice->staff = $model['staff'] ? $model['staff'] : "暂无";
                $repairStatusNotice->staff_mobile = $model['staff_phone'] ? $model['staff_phone'] : "暂无";
                $repairStatusNotice->order_no =   str_pad($model['order_no'], 10, '0', STR_PAD_LEFT);;
                $repairStatusNotice->repair_status = $statusStr[$model['status']];
                app('notice_queue')->repairStatusNotice($repairStatusNotice);
            }
        }


        if($model->status == RepairStatus::CANCEL){
            $repairTypeNameStr = [
                1 => '电表问题',
                2 => '水表问题',
                3 => '门闸问题',
                4 => '制冷问题',
                5 => '其他问题'
            ];

            if($model->cancel_operator_type == OperatorType::USER){
                //客服取消通知客户
                $members = Member::getMembersByMobile($customer->mobile_phone);
                foreach ($members as $member){
                    if($member->mp_openid){

                        $repairCancelNotice = new RepairCancelNotice();
                        $repairCancelNotice->mp_openid = $member->mp_openid;
                        $repairCancelNotice->order_no = $model->repair_no;
                        $repairCancelNotice->time = $model->update_time;
                        $repairCancelNotice->housing_name = $housingName;
                        $repairCancelNotice->content = $model->cancel_remark;
                        $repairCancelNotice->type_name = $repairTypeNameStr[$model->repair_type];
                        app('notice_queue')->repairCancelNotice($repairCancelNotice);

                    }
                }
            }else{
                //客户取消通知客服
                $waiters = Member::getWaiter();
                foreach ($waiters as $waiter) {
                    $repairCancelNotice = new RepairCancelNotice();
                    $repairCancelNotice->mp_openid = $waiter->mp_openid;
                    $repairCancelNotice->order_no = $model->repair_no;
                    $repairCancelNotice->time = $model->update_time;
                    $repairCancelNotice->housing_name = $housingName;
                    $repairCancelNotice->content = $model->cancel_remark;
                    $repairCancelNotice->type_name = $repairTypeNameStr[$model->repair_type];
                    app('notice_queue')->repairCancelNotice($repairCancelNotice);
                }
            }

        }
    }

    public static function complete($params){
        $repairObj = self::where('status',RepairStatus::ACCEPTING)->find($params['id']);
        if (!$repairObj) {
            throw new ParameterException();
        }

        if($repairObj->status != RepairStatus::ACCEPTING){
            throw new ParameterException([
                'msg' => '非待完成信息'
            ]);
        }

        $params['complete_time'] = time();
        $params['status'] = RepairStatus::OVER;
        return $repairObj->save($params);
    }


    public static function cancel($params){
        $repairObj = self::where('status',RepairStatus::PENDING)
            ->whereOr('status',RepairStatus::ACCEPTING)->find($params['id']);
        if (!$repairObj) {
            throw new ParameterException();
        }
        $params['cancel_operator_type'] = OperatorType::USER;
        $params['cancel_operator_id'] = $params['user_id'];
        $params['complete_time'] = time();
        $params['status'] = RepairStatus::CANCEL;
        return $repairObj->save($params);
    }

}