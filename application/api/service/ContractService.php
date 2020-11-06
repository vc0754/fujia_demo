<?php
namespace app\api\service;

use app\api\dto\kingdee\ContractState;
use app\api\dto\kingdee\StopContract;
use app\api\dto\notice\CustomerComingIn;
use app\api\model\Contract as ContractModel;
use app\api\model\Customer as CustomerModel;
use app\api\model\Housing as HousingModel;
use app\lib\enum\ContractStatus;
use app\lib\enum\HousingType;
use app\lib\exception\common\HandleException;
use app\lib\exception\common\ParameterException;
use think\Db;
use think\Exception;
use app\api\model\Member as MemberModel;
use think\helper\Time;

/**
 * 合同服务
 * Class ContractService
 * @package app\api\service
 */
class ContractService
{

    /**
     * 执行合同
     * @param $id
     * @throws HandleException
     * @throws ParameterException
     */
    public function execContract($id){
        //todo 执行合同
        // 1、查找合同，判断合同状态与开始时间
        // 2、检测房源水电表，如果原有绑定关系需手动先解除
        // 3、执行合同，修改合同状态，传给金蝶
        // 4、绑定新用户与房源水电表关系

            $contract = ContractModel::get($id);
            if (!$contract) {
                throw new ParameterException();
            }
            if ($contract->status != ContractStatus::WAITING_EXECUTE) {
                throw new ParameterException([
                    'msg' => '合同状态不是待执行,不可执行'
                ]);
            }
            $customer = CustomerModel::where('fid',$contract->customer_fid)->find();
            if ($contract->start_date > time() && $customer->fid != 643) {
                throw new HandleException([
                    'msg' => '请在' . date('Y-m-d', $contract->start_date) . '之后开启合同'
                ]);
            }
        Db::startTrans();
        try{
            $contract->status = ContractStatus::EXECUTING;
            $contract->save();
            Db::commit();
        }catch (Exception $e){
            Db::rollback();
            throw $e;
        }
        $contractState = new ContractState();
        $contractState->fid = $contract->fid;
        $contractState->state = ContractStatus::EXECUTING;
        app('kingdee_queue')->pushContract($contractState);
        //通知商户
        $members = MemberModel::getMembersByMobile($customer->mobile_phone);
        $housing_name =  HousingModel::where('fid',$contract->housing_fid)->value('name');;
        foreach ($members as $member) {
            if($member->mp_openid){
                $customerComingIn = new CustomerComingIn();
                $customerComingIn->mp_openid = $member->mp_openid;
                $customerComingIn->customer_name = $customer->name;
                $customerComingIn->contract_time = date('Y-m-d',$contract->start_date).'至'.date('Y-m-d',$contract->end_date);
                $customerComingIn->housing_name = $housing_name;
                app('notice_queue')->customerComingIn($customerComingIn);
            }
        }
    }

    /**
     * 终止合同
     * @param $params
     * @throws ParameterException
     */
    public function stopContract($params){
        $contract = ContractModel::get($params['id']);
        if(!$contract){
            throw new ParameterException();
        }
        if($contract->status != ContractStatus::WAITING_FINISH){
            throw new ParameterException([
                'msg' => '合同状态不是待终止，不可终止'
            ]);
        }
        Db::startTrans();
        try{
            //修改合同状态
            $contract->status = ContractStatus::FINISHED;
            $contract->save();
            Db::commit();
        }catch (Exception $e){
            Db::rollback();
            throw $e;
        }
        $params['fid'] = $contract->fid;

        $stopContract = new StopContract($params);

        app('kingdee_queue')->pushStopContract($stopContract);
    }


    /**
     * 合同详情
     * @param $cid
     * @return array
     * @throws ParameterException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getInfo($cid){
        $filter[] = ['id','=',$cid];

        $list = ContractModel::with('housing,customer')->where($filter)->find();

        if(!$list){
            throw  new ParameterException([
                'msg' => '找不到合同信息'
            ]);
        }

        $result = $list->toArray();

        $dateEnum = [
            1 => '个月',
            2 => '年'
        ];

        $statusEnum = [
            ContractStatus::WAITING_PAY => '待付款',
            ContractStatus::WAITING_EXECUTE => '待执行',
            ContractStatus::EXECUTING => '执行中',
            ContractStatus::WAITING_FINISH => '待终止',
            ContractStatus::FINISHED => '已终止',
            ContractStatus::FINISHED_AND_REFUND => '终止且已退款',
            ContractStatus::VOID_CANCEL => '作废取消'
        ];

        $data = [
            'id' => $result['id'], //ID
            'status' => $result['status'],
            'status_name' => isset($statusEnum[$result['status']]) ? $statusEnum[$result['status']] : '',
            'bill_no' => $result['bill_no'],
            'housing_name' => $result['housing']['name'], //房源名称
            'housing_area' => $result['housing']['pool_area'], //公摊面积
            'lease_time' => $result['payment_date'].$dateEnum[$result['payment_type']], //租期
            'lease_price' => $result['price'],
            'remark' => $result['remark'],
            'power_meter_org_data' => $result['power_meter_org_data'],
            'water_meter_org_data' => $result['water_meter_org_data'],
            'customer_name' => $result['customer']['name'],
            'customer_address' => $result['customer']['address'],
            'customer_contact' => $result['customer']['contact'],
            'customer_phone' => $result['customer']['mobile_phone'],
            'signing_time' => date('Y年m月d日',$result['start_date']), //签约时间
            'expire_time' => date('Y年m月d日',$result['end_date']) //到期时间
        ];

        //类型
        if($result['housing']['stall_type'] == HousingType::STALL){
            $data['type'] = '档口';
        }elseif ($result['housing']['stall_type'] == HousingType::SHOP){
            $data['type'] = '商铺';
        }

        //区域
        if($result['housing']['parent_fid'] == 0){
            $data['area'] = $result['housing']['name'];
        }else{
            $str = HousingModel::where('fid','=',$result['housing']['parent_fid'])->value('name');
            if(empty($str)){
                throw new ParameterException([
                    'msg' => '房源信息异常错误：找不到房源的归属区域'
                ]);
            }
            $data['area'] = $str;
        }

        return $data;

    }


    /**
     * 获取所有合同
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getContract($page = 1,$size = 15,$contractFilter = [],$arrWhere = [],$pagination = true){
        $contractFilter[] = ['status','<>',ContractStatus::VOID_CANCEL];

        if($pagination){
            $list = ContractModel::withJoin(['customer','housing' => function($query)use($arrWhere){
                $query->where($arrWhere);
            }])->where($contractFilter)->order('status asc,create_time desc')->paginate($size,false,['page'=>$page]);

            if($list->isEmpty()){
                return ['data'=>[]];
            }
            $result = $list->toArray();
        }else{
            $list = ContractModel::withJoin(['customer','housing' => function($query)use($arrWhere){
                $query->where($arrWhere);
            }])->where($contractFilter)->order('status asc,create_time desc')->select();

            if($list->isEmpty()){
                return ['data'=>[]];
            }
            $result['data'] = $list->toArray();
        }

        $dateEnum = [
            1 => '个月',
            2 => '年'
        ];

        $statusEnum = [
            ContractStatus::WAITING_PAY => '待付款',
            ContractStatus::WAITING_EXECUTE => '待执行',
            ContractStatus::EXECUTING => '执行中',
            ContractStatus::WAITING_FINISH => '待终止',
            ContractStatus::FINISHED => '已终止',
            ContractStatus::FINISHED_AND_REFUND => '终止且已退款',
            ContractStatus::VOID_CANCEL => '作废取消'
        ];

        $data = [];
        foreach ($result['data'] as $key=>$value){
            $data[$key] = [
                'id' => $value['id'],
                'status' => $value['status'],
                'status_name' => isset($statusEnum[$value['status']]) ? $statusEnum[$value['status']] : '',
                'bill_no' => $value['bill_no'],
                'housing' => $value['housing']['name'],
                'lease_time' => $value['payment_date'].$dateEnum[$value['payment_type']],
                'expire_time' => date('Y年m月d日',$value['end_date']),
                'signing_time' => date('Y年m月d日',$value['start_date']),
                'start_date' => $value['start_date'],
                'end_date' => $value['end_date'],
                'customer_name' => $value['customer']['name'],
                'customer_address' => $value['customer']['address'],
                'customer_contact' => $value['customer']['contact'],
                'customer_phone' => $value['customer']['mobile_phone']
            ];

            if($value['housing']['stall_type'] == HousingType::STALL){
                $data[$key]['type'] = '档口';
            }elseif ($value['housing']['stall_type'] == HousingType::SHOP){
                $data[$key]['type'] = '商铺';
            }
        }

        $result['data'] = $data;

        return ['data'=>$result];
    }


    public function statusCountsStatistics(){
        $output = [
            'near_expire_count' => 0,
            'expire_count' => 0,
            'current_month_leave_count' => 0,
            'current_month_coming_count' => 0
        ];
        list($monthStart,$monthEnd) = Time::month();
        $startDateStr = date('Y-m-d H:i:s',$monthStart);
        $endDateStr = date('Y-m-d H:i:s',$monthEnd);
        //本月退租
        $leaveFilter[] = ['status','=',ContractStatus::FINISHED_AND_REFUND];
        $leaveFilter[] = ['update_time','between',[$startDateStr,$endDateStr]];
        $output['current_month_leave_count'] = ContractModel::where($leaveFilter)->count();
        //30天内即将到期数
        list($todayStart,$todayEnd) = Time::today();
        $t_startDateStr = $todayStart;
        $t_endDateStr = $todayStart + Time::daysToSecond(30);
        $nearExpireFilter[] = ['status','=',ContractStatus::EXECUTING];
        $nearExpireFilter[] = ['end_date','between',[$t_startDateStr,$t_endDateStr]];
        $output['near_expire_count'] = ContractModel::where($nearExpireFilter)->count();

        $expireFilter[] = ['status','=',ContractStatus::EXECUTING];
        $expireFilter[] = ['end_date','lt',time()];
        $output['expire_count'] = ContractModel::where($nearExpireFilter)->count();

        $comingFilter[] =  ['status','=',ContractStatus::EXECUTING];
        $comingFilter[] = ['start_date','between',[$t_startDateStr,$t_endDateStr]];
        $output['current_month_coming_count'] = ContractModel::where($comingFilter)->count();

        return $output;
    }

}