<?php

namespace app\api\model;
use app\api\dto\notice\NewAccountNotice;
use app\lib\enum\BillSource;
use app\lib\enum\BillState;
use app\lib\enum\BillType;
use app\api\model\PaymentRecord;
use app\api\model\PaymentRecordDetail;
use app\lib\enum\RepairStatus;
use think\Exception;
use think\facade\Hook;


class Bill extends MyBaseModel
{
    protected $table = 't_bill';


    public function customer(){
        return $this->belongsTo('Customer','customer_fid','fid');
    }

    public function detail()
    {
        return $this->hasMany('BillDetail','bill_fid','fid')->order('fid asc');
    }

    public function housing(){
        return $this->belongsTo('Housing','housing_fid','fid');
    }


    public static function getBillByCid($params,$page,$size){

        $list = self::with(['detail'=>function($query){
            $query->with(['chargeType']);
        },'housing'])->where($params)->order('create_time desc')->paginate($size,false,['page'=>$page]);

        return $list;

    }

    /**
     *
     * @param $model
     */
    public static function  onAfterInsert($model){
        if($model['type'] == BillType::RECEIVABLES){
            $customer = Customer::where('fid',$model->customer_fid)->find();
            $noticeDto = new NewAccountNotice();
            $noticeDto->notice_name = '缴费通知';
            $noticeDto->customer_name = $customer['name'];
            $memberPhones = MemberPhone::where('mobile',$customer['mobile_phone'])->select();
            if($memberPhones->isEmpty()){
                return;
            }
            //当插入的应收单未支付且是报修单时，需要更新报修状态更新为待支付
            if($model->other_no != '' && substr($model->other_no,0,3) === config('billPrefix.repair_bill')){
                $obj = RepairApplication::where('repair_no','=',$model->other_no)->where('status','=',RepairStatus::QUOTED_PRICE)->find();
                if($obj){
                    $obj->status = RepairStatus::WAIT_PAID;
                    $obj->save();
                }
            }

            $memberIDs = array_column($memberPhones->toArray(),'member_id');
            foreach ($memberIDs as $memberID){
                $member = Member::get($memberID);
                if($member && $member->mp_openid){
                    $noticeDto->mp_openid = $member->mp_openid;
                }else{
                    continue;
                }
                app('notice_queue')->newAccountNotice($noticeDto);
            }
        }
    }

    public static function  onAfterUpdate($model){
        if($model['type'] == BillType::RECEIVABLES){
            if($model->state == BillState::PAID && $model->other_no != ''){
                if(substr($model->other_no,0,3) === config('billPrefix.repair_bill')){
                    $obj = RepairApplication::where('repair_no','=',$model->other_no)->where('status','=',RepairStatus::WAIT_PAID)->find();
                    if($obj){
                        $obj->paid_time = time();
                        $obj->status = RepairStatus::WAIT_REPAIR;
                        $obj->save();
                    }
                }
            }
        }
    }




}