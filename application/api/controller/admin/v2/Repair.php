<?php
namespace app\api\controller\admin\v2;

use app\api\model\Bill;
use app\api\model\RepairApplication;
use app\api\model\Member;
use app\lib\enum\RepairStatus;
use app\lib\exception\common\ParameterException;
use app\api\model\Housing;
use app\lib\token\Token;
use think\Request;


/**
 * Class Repair
 * @package app\api\controller\cms
 */
class Repair
{

    /**
     * 查询列表
     * @auth('报修列表','报修管理')
     * @param Request $request
     * @param integer $page
     * @param integer $size
     * @return \think\response\Json
     */
    public function getList(Request $request, $page = 1,$size = 15){

        $params = $request->get();

        $filter = [];
        //处理进度
        if(isset($params['status']) && $params['status'] != ''){
            $filter[] =  ['status', '=', intval($params['status'])];
        }
        //报修类型
        if(isset($params['repair_type']) && $params['repair_type'] != ''){
            $filter[] =  ['repair_type', '=', intval($params['repair_type'])];
        }

        $startDate = input('start_date','');
        $endDate = input('end_date','');

        if($startDate != '' && $endDate == ''){
            // 大于等于某个时间
            $filter[] = ['create_time', '>= time' , $startDate];
        }

        if($startDate == '' && $endDate != ''){
            // 小于等于某个时间
            $filter[] = ['create_time', '<= time' , $startDate];
        }

        if($startDate != '' && $endDate != ''){
            // 时间区间查询
            $filter[] =  ['create_time', 'between time', [$startDate, $endDate]];
        }

        $result = RepairApplication::getPageList($filter,$page,$size);

        $tempRes = $result->toArray();


        if(!empty($tempRes['data'])){
            $unitList = array_column($tempRes['data'],'repair_unit');

            $fids = array_unique($unitList);

            $housingEnum = Housing::where('fid','IN',$fids)->column('name','fid');

            foreach ($tempRes['data'] as $key=>$value){
                $tempRes['data'][$key]['repair_unit'] =  isset($housingEnum[$value['repair_unit']]) ? $housingEnum[$value['repair_unit']] : '';
                $tempRes['data'][$key]['paid_price'] = $value['status'] >= RepairStatus::WAIT_PAID && $value['quoted_price'] > 0 ? $value['quoted_price'] : 0;
            }

        }

        return show(200,$tempRes,'操作成功');
    }

    /**
     * 报修指派
     * @auth('报修派单','报修管理')
     * @validate('ProcessingRepair')
     * @param Request $request
     * @return \think\response\Json
     * @throws ParameterException
     */
    public function processingRepair(Request $request){
        $params = $request->put();
        $params['id'] = input('rid');
        $obj = Member::get($params['member_id']);
        if(!$obj){
            throw new ParameterException(['msg'=>'找不到维修工信息']);
        }
        $params['member_id'] = $obj->id;
        $params['staff'] = $obj->real_name ?: $obj->nick_name;
        $params['staff_phone'] = $obj->mobile;

        RepairApplication::processing($params);
        return show(201,'','update repair success');
    }

    /**
     * 确认报修信息完成
     * @auth('完成报修','报修管理')
     * @param('rid','报修信息ID','require')
     * @param $rid
     * @return mixed
     * @throws ParameterException
     */
    public function completeRepair(Request $request){
        $params = $request->put();
        $params['id'] = input('rid');

        RepairApplication::complete($params);

        return show(201,'','update repair success');
    }


    /**
     * 确认报修信息完成
     * @auth('取消报修','报修管理')
     * @param('rid','报修信息ID','require')
     * @param $rid
     * @return mixed
     * @throws ParameterException
     */
    public function cancelRepair(Request $request){

        $params = $request->put();
        $params['user_id'] = Token::getCurrentUID();
        $params['id'] = input('rid');

        RepairApplication::cancel($params);

        return show(201,'','update repair success');
    }
}