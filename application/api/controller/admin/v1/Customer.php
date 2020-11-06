<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-05
 * Time: 9:32
 */

namespace app\api\controller\admin\v1;


use app\api\model\Bill;
use app\api\model\Customer as CustomerModel;
use app\api\model\Contract;
use app\api\model\CardInfo;
use app\api\model\TimingBill;
use app\api\model\Meter;
use app\lib\enum\BillSource;
use app\lib\enum\FlowType;
use app\lib\enum\ListBillType;
use app\lib\enum\MeterType;
use app\lib\exception\common\ParameterException;
use think\Request;



/**
 * Class Customer
 * @package app\api\controller\cms
 */
class Customer
{

    /**
     * 查询商户信息列表
     * @param string $name
     * @param int $all
     * @param int $page
     * @param int $size
     * @param('page','页数','require|number')
     * @param('size','条数','require|number')
     * @auth('商户列表','商户管理')
     * @return \think\response\Json
     */
    public function getList($name = '',$all = 1 ,$page = 1,$size = 15){

        $filter = [];
        if(trim($name) != ''){
            $filter[] =  ['name', 'like', '%'.$name.'%'];
        }

        $result = CustomerModel::getList($filter,$all,$page,$size);

        if($result->isEmpty() == false){
            $result = $result->toArray();
            $result['data'] = array_map(function($v){
                $unpaidAmount = Bill::where('customer_fid',$v['fid'])->where('state',0)->where('type',1)->sum('unpaid_balance');
                $v['unpaid_amount'] = (string)$unpaidAmount;
                $cardAmount = CardInfo::where('customer_fid','=',$v['fid'])->sum('balance');
                $v['card_amount'] = (string)$cardAmount;
                return $v;
            },$result['data']);
        }

        return show(200,$result,'操作成功');
    }

    /**
     *  获取商户的合同列表
     * @param $id
     * @param int $page
     * @param int $size
     * @param('id','商户id','require')
     * @auth('商户合同列表','商户管理')
     * @return \think\response\Json
     * @throws ParameterException
     * @throws \think\exception\DbException
     */
    public function getCurrentContract($id,$page = 1,$size = 15){

        $res = CustomerModel::get($id);
        if(!$res){
            throw new ParameterException();
        }
        $params = input('param.');

        $where = [];
        if(isset($params['status']) && $params['status'] != ''){
            $where['status'] = $params['status'];
        }

        $result = Contract::with('housing')->where('customer_fid',$res->fid)->where($where)->order('create_time','desc')->paginate($size,false,['page'=>$page]);

        return show(200,$result,'操作成功');
        
    }

    /**
     * 获取当前商户的水电余额流水列表
     * @param $id
     * @param('id','商户id','require')
     * @auth('商户水电余额流水列表','商户管理')
     * @param int $page
     * @param int $size
     * @return \think\response\Json
     * @throws ParameterException
     */
    public function getBalanceTurnover($id,$page = 1,$size = 15){

        $res = CustomerModel::get($id);
        if(!$res){
            throw new ParameterException();
        }

        $params = input('param.');

        $where[] = ['customer_fid','=',$res->fid];

        if(isset($params['meter_id']) && $params['meter_id'] != ''){
            $where[] = ['meter_id','=',$params['meter_id']];
        }

        $totalPowerAmount = TimingBill::where($where)->where('meter_type','=',MeterType::POWER_METER)->sum('amount');
        $totalWaterAmount = TimingBill::where($where)->where('meter_type','=',MeterType::WATER_METER)->sum('amount');
        $totalPowerDegree = TimingBill::where($where)->where('meter_type','=',MeterType::POWER_METER)->sum('quantity');
        $totalWaterDegree = TimingBill::where($where)->where('meter_type','=',MeterType::WATER_METER)->sum('quantity');

        if(isset($params['meter_type']) && $params['meter_type'] != ''){
            $where[] = ['meter_type','=',$params['meter_type']];
        }

        $result = TimingBill::where($where)->order('create_time','desc')->paginate($size,false,['page'=>$page]);

        if($result->isEmpty() == false){
            $result = $result->toArray();

            $result['data'] = array_map(function($v){
                if($v['meter_type'] == MeterType::POWER_METER){
                    $v['meter_type_name'] = '电表';
                }elseif ($v['meter_type'] == MeterType::WATER_METER){
                    $v['meter_type_name'] = '水表';
                }else{
                    $v['meter_type_name'] = '';
                }

                $v['meter_name'] = Meter::where('id','=',$v['meter_id'])->value('meter_name');

                switch ($v['list_bill_type']){
                    case ListBillType::DEDUCT :
                            $v['list_bill_type_name'] = '扣费';
                        break;
                    case ListBillType::INCREASE :
                        $v['list_bill_type_name'] = '充值';
                        break;
                    case ListBillType::REFUND :
                        $v['list_bill_type_name'] = '退款';
                        break;
                    default:
                        $v['list_bill_type_name'] = '';
                }

                return $v;
            },$result['data']);
        }


        $data = [
            'result' => $result,
            'totalPowerAmount' => number_format($totalPowerAmount,2),
            'totalPowerDegree' => number_format($totalPowerDegree,2),
            'totalWaterAmount' => number_format($totalWaterAmount,2),
            'totalWaterDegree' => number_format($totalWaterDegree,2),
        ];


        return show(200,$data,'操作成功');
    }


    /**
     * 获取当前商户流水列表
     * @param Request $request
     * @param('id','商户id','require')
     * @auth('商户账单流水列表','商户管理')
     * @return \think\response\Json
     * @throws Exception
     * @throws \app\lib\exception\token\TokenException
     */
    public function getBillFlow(Request $request){

        $params = $request->get();

        $filter = [];
        //类型:1 商户缴费;2 余额充值;3余额退款 ;4 水卡充值;5 水卡退款
        if(isset($params['type'])){
            if(!empty($params['type'])){

                switch ($params['type']){
                    case FlowType::BILL:
                        $filter[] = ['bill_source','=',BillSource::BILL];
                        break;
                    case FlowType::BALANCE_RECHARGE:
                        $filter[] = ['bill_source','=',BillSource::RECHARGE];
                        $filter[] = ['total_amount','>',0];
                        break;
                    case FlowType::BALANCE_REFUND:
                        $filter[] = ['bill_source','=',BillSource::RECHARGE];
                        $filter[] = ['total_amount','<',0];
                        break;
                    case FlowType::CARD_RECHARGE:
                        $filter[] = ['bill_source','=',BillSource::WATERCARD];
                        $filter[] = ['total_amount','>',0];
                        break;
                    case FlowType::CARD_REFUND:
                        $filter[] = ['bill_source','=',BillSource::WATERCARD];
                        $filter[] = ['total_amount','>',0];
                        break;
                }
            }
        }

        $arrWhere = [];
        //商户id
        if(isset($params['id'])){
            if(!empty($params['id'])){
                $arrWhere[] = ['id','=',$params['id']];
            }
        }

        //开始与结束日期
        $start_date = input('start_date',date('Y-m-d'));
        $end_date = input('end_date',date('Y-m-d'));
        $page = input('page',1);
        $size = input('size',15);

        if(!empty($start_date)){
            $start_date = $start_date.' 00:00:00';
        }
        if(!empty($end_date)){
            $end_date = $end_date.' 23:59:59';
        }

        $filter[] = ['charge_time','between time',[$start_date,$end_date]];

        $data = app('payment_record')->getBillFlow($filter,$page,$size,$arrWhere);

        return show(200,$data,'操作成功');

    }

    /**
     * 账单流水查询备注（商户缴费类型详情）
     * @param $payment_record_id
     * @param('payment_record_id','ID','require')
     * @return \think\response\Json
     */
    public function getBillFlowRemark($payment_record_id){
        //$data = app('payment_record')->getBillFlowRemark($payment_record_id);
        $data = app('payment_record')->getBillFlowRemarkForAdmin($payment_record_id);
        return show(200,$data,'success');
    }

    /**
     * 获取当前商户的表枚举
     */
    public function getMeterEnum($id){

        $res = CustomerModel::get($id);
        if(!$res){
            throw new ParameterException();
        }

        $params = input('param.');

        $where[] = ['customer_fid','=',$res->fid];
        if(isset($params['meter_type']) && $params['meter_type'] != ''){
            $where[] = ['meter_type','=',$params['meter_type']];
        }

        $tempResult = TimingBill::where($where)->group('meter_id')->column('meter_id,meter_type','meter_id');

        $result = [];
        if($tempResult){
            foreach ($tempResult as $key=>$value){
                $result[$value][] = [
                    'meter_id' => $key,
                    'meter_name' => Meter::where('id','=',$key)->value('meter_name')
                ];
            }
        }

        return show(200,$result,'success');
    }

}