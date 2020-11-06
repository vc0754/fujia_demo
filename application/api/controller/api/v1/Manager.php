<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/17
 * Time: 16:37
 */

namespace app\api\controller\api\v1;

use app\api\model\Member;
use app\api\model\Housing;
use app\lib\enum\ApplicationEnum;
use app\lib\enum\ContractStatus;
use app\lib\exception\token\ForbiddenException;
use app\lib\token\Token;
use think\Request;

class Manager
{
    public $member = null;

    public function __construct()
    {
        $memberId = Token::getCurrentMID(ApplicationEnum::FU_JIA);
        $member = Member::get($memberId);

        if(!$member){
            throw new ForbiddenException([
                'msg' => '当前无权限,退出登录',
                'error_code' => 10004
            ]);
        }

        if($member->is_manager == 1){
            $this->member = $member;
        }else{
            throw new ForbiddenException([
                'msg' => '当前无权限,退出登录',
                'error_code' => 10004
            ]);
        }
    }


    /**
     * 执行(待执行)状态合同
     * @auth('Manager')
     * @param('cid','合同ID','require')
     * @param $cid
     * @return \think\response\Json
     */
    public function execContract($cid){
        app('contract')->execContract($cid);
        return show(201,'','exec contract success');
    }

    /**
     * 终止合同
     * @auth('Manager')
     * @param('cid','合同ID','require')
     * @param('amount','退租差额','require')
     * @param('remark','备注','require')
     * @param Request $request
     * @return \think\response\Json
     */
    public function stopContract(Request $request){
        $cid = input('cid');
        $params = $request->put();
        $params['id'] = $cid;
        app('contract')->stopContract($params);
        return show(201,'','stop contract success');
    }

    /**
     * 获取合同列表
     * @auth('Manager')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @param Request $request
     * @return \think\response\Json
     */
    public function getContract(Request $request){

        $params = $request->get();

        $filter = [];
        if(isset($params['parent_fid']) && $params['parent_fid'] != ''){
            $filter[] = ['parent_fid','=',intval($params['parent_fid'])];
        }

        if(isset($params['stall_type']) && $params['stall_type'] != ''){
            $filter[] = ['stall_type','=',intval($params['stall_type'])];
        }

        if(isset($params['housing']) && $params['housing'] != ''){
            $filter[] = ['housing.name','LIKE','%'.$params['housing'].'%'];
        }

        $contractFilter = [];
        if(isset($params['status']) && $params['status'] != ''){
            $contractFilter[] = ['status','=',intval($params['status'])];
        }

        $result = app('contract')->getContract($params['page'],$params['size'],$contractFilter,$filter);
        return show(200,$result,'操作成功');
    }

    /**
     * 获取合同详情
     * @auth('Manager')
     * @param $cid
     * @return \think\response\Json
     */
    public function getContractInfo($cid){
        $result = app('contract')->getInfo($cid);
        return show(200,$result,'操作成功');
    }


    /**
     * 获取分区类型集合
     * @auth('Manager')
     * @return array|\think\response\Json
     */
    public function getPartition(){

        $result = Housing::where('parent_fid','=',0)->column('name','fid');

        if(empty($result)){
            return [];
        }
        return show(200,$result,'操作成功');
    }


    /**
     * 获取所有将到期或已到期未续约合同
     * @auth('Manager')
     * @param Request $request
     * @return \think\response\Json
     */
    public function getMaturityContract(Request $request){

        $params = $request->get();

        $filter = [];
        if(isset($params['parent_fid']) && $params['parent_fid'] != ''){
            $filter[] = ['parent_fid','=',intval($params['parent_fid'])];
        }

        if(isset($params['stall_type']) && $params['stall_type'] != ''){
            $filter[] = ['stall_type','=',intval($params['stall_type'])];
        }

        if(isset($params['housing']) && $params['housing'] != ''){
            $filter[] = ['housing.name','LIKE','%'.$params['housing'].'%'];
        }

        $contractFilter[] = ['status','=',ContractStatus::EXECUTING];
        $tempResult = app('contract')->getContract(1,15,$contractFilter,$filter,false);

        $result = [
            'near_count' => 0,
            'expired_count' => 0,
            'data' => []
        ];

        if(!empty($tempResult['data'])){

            $start = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
            $eCount = 0;
            $nCount = 0;
            foreach ($tempResult['data']['data'] as $contract) {
                $timeSpans = 30 * 24 * 3600;
                if ($contract['end_date'] - $timeSpans <= $start) {
                    $temp = (int)(($contract['end_date'] - $start) / (24 * 3600));
                    if ($temp >= 0) {
                        $nCount++;
                    } else {
                        $eCount++;
                    }
                    $result['data'][] = $contract;
                }
            }
            $result['near_count'] = $nCount;
            $result['expired_count'] = $eCount;
        }

        return show(200,$result,'操作成功');
    }



}