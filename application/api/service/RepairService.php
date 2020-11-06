<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/10/24
 * Time: 14:00
 */

namespace app\api\service;


use app\api\dto\kingdee\RepairOffer;
use app\api\model\Bill;
use app\api\model\Contract;
use app\api\model\Customer;
use app\api\model\Housing;
use app\api\model\RepairApplication;
use app\lib\enum\ContractStatus;
use app\lib\enum\RepairStatus;
use app\lib\exception\common\ParameterException;

class RepairService
{
    /**
     * 获取报修列表
     * @param $filter
     * @param int $page
     * @param int $size
     * @return array
     */
    public function getRepairList($filter,$page = 1,$size = 15){

        $result = RepairApplication::where($filter)->order('create_time desc')->paginate($size,false,['page'=>$page])->toArray();

        $repairTypeNameStr = [
            1 => '电表问题',
            2 => '水表问题',
            3 => '门闸问题',
            4 => '制冷问题',
            5 => '其他问题'
        ];

        if(!empty($result['data'])){
            foreach ($result['data'] as $rk=>$rv){
                $result['data'][$rk]['repair_type_name'] = $repairTypeNameStr[$rv['repair_type']];
                $result['data'][$rk]['paid_price'] = $rv['status'] >= RepairStatus::WAIT_PAID && $rv['quoted_price'] > 0 ? $rv['quoted_price'] : 0;
                $result['data'][$rk]['housing_name'] = Housing::where('fid','=',$rv['repair_unit'])->value('name');
            }
        }

        return $result;

    }

    /**
     * 报价
     * @param $repair_id
     * @param string $quoted_price
     * @param string $quoted_price_remark
     * @return mixed
     * @throws ParameterException
     */
    public function quotedPrice($repair_id,$quoted_price = '0.00',$quoted_price_remark = ''){

        $repairObj = RepairApplication::get($repair_id);

        if(!$repairObj){
            throw new ParameterException(['msg'=>'找不到该报修记录']);
        }

        if($repairObj->status != RepairStatus::QUOTED_PRICE){
            throw new ParameterException(['msg'=>'非待报价记录']);
        }

        $repairObj->quoted_price = $quoted_price;
        $repairObj->quoted_price_remark = $quoted_price_remark;
        $repairObj->status = RepairStatus::WAIT_PAID;
        if($quoted_price == 0){
            $repairObj->status = RepairStatus::WAIT_REPAIR;
            $repairObj->paid_time = time();
        }

        $repairObj->save();

        //报价大于0才推送至金蝶生成应收单
        if($repairObj->quoted_price > 0){
            //推送到金蝶
            $customer = Customer::get($repairObj->customer_id);
            $arrWhere[] = ['customer_fid','=',$customer->fid];
            $arrWhere[] = ['housing_fid','=',$repairObj->repair_unit];
            $fid = Contract::where($arrWhere)->where('status',['=',ContractStatus::EXECUTING],['=',ContractStatus::WAITING_FINISH],'or')->value('fid');
            $param = [
                'fid' => $fid,
                'customer_fid' => $customer->fid,
                'housing_fid' => $repairObj->repair_unit,
                'repair_no' => $repairObj->repair_no,
                'quoted_price' => $quoted_price,
                'quoted_price_remark' => $quoted_price_remark,
                'create_time' => $repairObj->create_time
            ];
            $data = new RepairOffer($param);
            app('kingdee_queue')->pushRepair($data);
        }




        return $repairObj;
    }





}