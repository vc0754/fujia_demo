<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-07
 * Time: 15:46
 */

namespace app\api\model;


use app\lib\enum\BillState;
use app\lib\enum\ContractStatus;
use app\lib\enum\MeterStatus;
use app\lib\enum\StallType;
use app\lib\enum\HousingState;
use app\lib\enum\BillSource;
use app\lib\enum\BillType;
use app\lib\exception\common\ParameterException;
use think\Db;
use think\Exception;

class Contract extends MyBaseModel
{
    protected $table = 't_contract';

    public function customer(){
        return $this->belongsTo('Customer','customer_fid','fid');
    }

    public function housing(){
        return $this->belongsTo('Housing','housing_fid','fid');
    }

    /**
     * 合同更新触发事件
     * 执行中关联
     * 终止账单与解除关联
     * @param $model
     */
    public static function  onAfterUpdate($model){

        if(($model->status == ContractStatus::EXECUTING && $model->is_meter_read == 0)|| ($model->status == ContractStatus::FINISHED && $model->is_meter_read == 1 )){
            $res = self::where('id',$model->id)->with(['housing','customer'])->find();
            if(!$res || !$res->housing || !$res->customer){
                throw new ParameterException();
            }
            $housing = Housing::where('fid',$model->housing_fid)->find();
            $powerMeter = model('PowerMeter')->where('fid',$res->housing->power_meter_fid)->find();
            if(!$powerMeter){
                throw new ParameterException([
                    'msg'=>'未找到关联电表'
                ]);
            }
            $myPowerMeter = Meter::where('union_meter_id',$powerMeter->id)->where('meter_status',MeterStatus::ENABLE)->find();
            if(!$myPowerMeter){
                throw new ParameterException([
                    'msg'=>'请先启用电表或查询电表是否未绑定金蝶系统记账电表'
                ]);
            }

            $insertList[] =  ['customer_id'=>$res->customer->id,'meter_id'=>$myPowerMeter->id];
            if($housing->stall_type == StallType::SHOP){
                $waterMeter = model('WaterMeter')->where('fid',$res->housing->water_meter_fid)->find();
                if(!$waterMeter){
                    throw new ParameterException([
                        'msg'=>'未找到关联水表'
                    ]);
                }
                $myWaterMeter = Meter::where('union_meter_id',$waterMeter->id)->where('meter_status',MeterStatus::ENABLE)->find();
                if(!$myWaterMeter){
                    throw new ParameterException([
                        'msg'=>'请先启用水表或查询水表是否未绑定金蝶系统记账水表'
                    ]);
                }
                $insertList[] = ['customer_id'=>$res->customer->id,'meter_id'=>$myWaterMeter->id];
            }

            if($model->status == ContractStatus::EXECUTING){
                //手動抄表
                $meterCurrentData = app('device')->meterReading($myPowerMeter->id,false);

                Db::table('t_contract')->where('id',$model->id)->update(['power_meter_org_data'=> $meterCurrentData->current_meter_degree,'is_meter_read'=>1]);
                if($housing->stall_type == StallType::SHOP){
                    $meterCurrentData = app('device')->meterReading($myWaterMeter->id,false);
                    Db::table('t_contract')->where('id',$model->id)->update(['water_meter_org_data'=> $meterCurrentData->current_meter_degree]);
                }

                $meterCustomer = new MeterCustomer();
                $meterCustomer->saveAll($insertList);
            }
            if($model->status == ContractStatus::FINISHED){
                //手動抄表
                app('device')->meterReading($myPowerMeter->id,false);
                //生成电表账单
                app('device')->makeAccountAndDeduct($myPowerMeter->id,'离场抄表');
                $meterIDs[] = $myPowerMeter->id;
                //手動抄表
                if($housing->stall_type == StallType::SHOP) {
                    app('device')->meterReading($myWaterMeter->id, false);
                    //生成水表账单
                    app('device')->makeAccountAndDeduct($myWaterMeter->id,'离场抄表');
                    $meterIDs[] = $myWaterMeter->id;
                }
                //删除关联绑定
                MeterCustomer::where('customer_id',$res->customer->id)->where('meter_id','in',$meterIDs)->delete();
            }
        }

        /*
        if($model->status == ContractStatus::WAITING_EXECUTE ){
            $housing = Housing::where('fid',$model->housing_fid)->find();
            $housing->state = HousingState::RENTED;
            $housing->save();
        }
        */

        if($model->status == ContractStatus::WAITING_FINISH ){
            $housing = Housing::where('fid',$model->housing_fid)->find();
            $housing->state = HousingState::NOTRENTED;
            $housing->save();
        }

        if($model->status == ContractStatus::VOID_CANCEL ){
            $housing = Housing::where('fid',$model->housing_fid)->find();
            $housing->state = HousingState::NOTRENTED;
            $housing->save();
            //判断合同是否有应收单，有未付款应收单，有则更新为作废
            $bill = Bill::where("customer_fid","=",$model->customer_fid)->where("housing_fid","=",$model->housing_fid)
                ->where("state","=",BillState::UNPAID)->where("type","=",BillType::RECEIVABLES)->find();
            if($bill){
                $bill->state = BillState::CLOSE;
                $bill->save();
            }
        }
    }

    /*合同新增时候触发
    *修改房源状态
    */
    public static function onAfterInsert($model){
        if($model->status == ContractStatus::WAITING_PAY ){
            $housing = Housing::where('fid',$model->housing_fid)->find();
            $housing->state = HousingState::RENTED;
            $housing->save();
        }
    }

}