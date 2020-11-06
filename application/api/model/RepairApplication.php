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
        $repairObj->status = RepairStatus::QUOTED_PRICE;
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
        //待付款通知事件在应收单
        $statusStr = [
            1=>'待受理',2=>'待报价',3=>'待付款',4=>'待维修',5=>'完成',-1=>'取消'
        ];
        $customer = Customer::get($model->customer_id);
        $housingName = Housing::where('fid',$model['repair_unit'])->value('name');
        //待报价
        if($model->status == RepairStatus::QUOTED_PRICE){
            if(is_null($model->quoted_price)){
                //通知商户
                $members = Member::getMembersByMobile($customer->mobile_phone);
                foreach ($members as $member){
                    if($member->mp_openid){
                        $repairStatusNotice = new RepairStatusNotice();
                        $repairStatusNotice->mp_openid = $member->mp_openid;
                        $repairStatusNotice->staff = $model['staff'] ? $model['staff'] : "暂无";
                        $repairStatusNotice->staff_mobile = $model['staff_phone'] ? $model['staff_phone'] : "暂无";
                        $repairStatusNotice->order_no =  $model['repair_no'];
                        $repairStatusNotice->repair_status = $statusStr[$model['status']];
                        app('notice_queue')->repairStatusNotice($repairStatusNotice);
                    }
                }
                //通知维修工
                $newRepairNotice = new NewRepairNotice();
                $newRepairNotice->customer_name = $customer['name'];
                $newRepairNotice->mp_openid = Member::where('id',$model->member_id)->value('mp_openid');
                $newRepairNotice->repair_content = $model['description'];
                $newRepairNotice->repair_housing_name = $housingName;
                $newRepairNotice->repair_mobile = $model['phone'];
                $newRepairNotice->time = $model['create_time'];
                app('notice_queue')->repairNotice($newRepairNotice);
            }else{
                if($model->queted_price > 0){
                    //通知客服，维修工已报价
                    $waiters = Member::getWaiter();
                    foreach ($waiters as $waiter){
                        $repairRateNotice = new RepairRateNotice();
                        $repairRateNotice->mp_openid = $waiter->mp_openid;
                        $repairRateNotice->order_no = $model->repair_no;
                        $repairRateNotice->time = $model->update_time;
                        $repairRateNotice->housing_name = $housingName;
                        $repairRateNotice->content = $model->quoted_price_remark;
                        $repairRateNotice->repair_status = '已报价(待财务审核)';
                        app('notice_queue')->repairRateNotice($repairRateNotice);
                    }
                }
            }
        }
        //已付款-待维修
        if($model->status == RepairStatus::WAIT_REPAIR){
            $repairRateNotice = new RepairRateNotice();
            $repairRateNotice->mp_openid = Member::where('id',$model->member_id)->value('mp_openid');;
            $repairRateNotice->order_no = $model->repair_no;
            $repairRateNotice->time = $model->update_time;
            $repairRateNotice->housing_name = $housingName;
            $repairRateNotice->content = $model->description;
            $repairRateNotice->repair_status = '已付款';
            app('notice_queue')->repairRateNotice($repairRateNotice);
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

            //通知维修工
            if($model->member_id > 0){
                $repairCancelNotice = new RepairCancelNotice();
                $repairCancelNotice->mp_openid = Member::where('id',$model->member_id)->value('mp_openid');
                $repairCancelNotice->order_no = $model->repair_no;
                $repairCancelNotice->time = $model->update_time;
                $repairCancelNotice->housing_name = $housingName;
                $repairCancelNotice->content = $model->cancel_remark;
                $repairCancelNotice->type_name = $repairTypeNameStr[$model->repair_type];
                app('notice_queue')->repairCancelNotice($repairCancelNotice);
            }
        }
    }

    /**
     * 完成报修
     * @param $params
     * @return bool
     * @throws ParameterException
     */
    public static function complete($params){
        $repairObj = self::where('status',RepairStatus::WAIT_REPAIR)->find($params['id']);
        if (!$repairObj) {
            throw new ParameterException();
        }

        if($repairObj->status != RepairStatus::WAIT_REPAIR){
            throw new ParameterException([
                'msg' => '非待完成信息'
            ]);
        }
        $data = [
            'complete_time' => time(),
            'status' => RepairStatus::OVER
        ];
        return $repairObj->save($data);
    }

    /**
     * 取消报修
     * @param $params
     * @return bool
     * @throws ParameterException
     */
    public static function cancel($params){
        $repairObj = self::where('status',RepairStatus::PENDING)
            ->whereOr('status',RepairStatus::QUOTED_PRICE)
            ->whereOr('status',RepairStatus::WAIT_PAID)
            ->find($params['id']);
        if (!$repairObj) {
            throw new ParameterException();
        }
        $params['cancel_operator_type'] = OperatorType::USER;
        $params['cancel_operator_id'] = $params['user_id'];
        $params['complete_time'] = time();
        $params['status'] = RepairStatus::CANCEL;
        //当金额大于0时才需要推送
        if($repairObj->quoted_price > 0){
            $billObj = Bill::where('state',BillState::UNPAID)->where('other_no',$repairObj->repair_no)->find();
            if($billObj){
                app('kingdee_queue')->pushRepairCancel(['fid'=>$billObj->fid]);
                $billObj->state = BillState::CLOSE;
                $billObj->save();
            }
        }
        return $repairObj->save($params);
    }

}