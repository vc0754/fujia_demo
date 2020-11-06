<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-11
 * Time: 11:24
 */

namespace app\api\controller\consumer\v1;

use app\api\model\Meter as MeterModel;

use app\api\model\TakeMeterData;
use app\api\model\WaterMeter;
use app\lib\enum\MeterStatus;
use app\lib\enum\MeterType;
use app\lib\exception\common\ParameterException;
use think\Request;

/**
 * 对接金蝶服务网关接口
 * Class GatewayServController
 * @package app\api\controller\rpc
 */
class Gateway
{
    /**
     * 同步更新金蝶数据接口
     * @validate('SyncForm')
     */
    public  function syncData(Request $request){
        $models = $request->post('ModelName');
        $type = $request->post('Type');
        $data = $request->post('Data');
        $autoUnion = $request->post('AutoUnion');
        $union_field = $request->post('UnionField');
        $autoUnion = $autoUnion ?: false;
        $union_field = $union_field ?: '';
        app('data_maintain')->syncUpdate($models,$type,$data,$autoUnion,$union_field);


        return show(201,'','base data sync success');
    }

    /**
     *  获取每月客户应收账单
     */
    public function getMonthlyAccount(){
        return '每月账单接口';
    }

    /**
     *  新商户入驻账单
     */
    public function getNewCustomerAccount(){

        return '新客户入住账单接口';
    }

    /**
     * 客户退费账单
     */
    public function getCustomerRefundAccount(){

        return '退租账单接口';
    }


    /**
     * 接收来自EMQX-BROKER转发的数据
     */
    public function updateCurrentMeterRead(Request $request){
        $params = $request->post();
        $devEUI = $params['dev_eui'];
        $meterAddr = str_pad((string)hexdec($params['meter_addr']), 2, '0', STR_PAD_LEFT);

        $meter = MeterModel::where('dev_eui',$devEUI)
            ->where('meter_addr',$meterAddr)
            ->where('meter_status',MeterStatus::ENABLE)
            ->find();
        if(!$meter){
            throw new ParameterException([
                'msg'=>'找不到仪表或仪表未启用'
            ]);
        }
        $takeMeterData = TakeMeterData::where('meter_id',$meter->id)->find();
        if($meter->meter_type == MeterType::POWER_METER){
            $takeMeterData->electric = $params['electric'];
            $takeMeterData->switch = $params['switch'];
            if($meter->switch_state != $params['switch']){
                $meter->switch_state = $params['switch'];
                $meter->save();
            }
        }else{
            $takeMeterData->battery = $params['battery'];
        }
        $takeMeterData->take_time =  $params['take_time'];
        $takeMeterData->voltage = $params['voltage'];
        $takeMeterData->degree =  $params['degree'];
        $takeMeterData->save();

        return show(201,'','update current meter data success');
    }



}