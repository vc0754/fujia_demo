<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-05
 * Time: 10:14
 */

namespace app\api\controller\admin\v1;

use app\api\model\Contract as ContractModel;
use app\lib\enum\ContractStatus;
use think\Request;


/**
 * 合同
 * Class Contract
 * @package app\api\controller\cms
 */
class Contract
{
    /**
     * 查询合同列表
     * @param int $page
     * @param int $size
     * @auth('合同列表','合同管理')
     * @return \think\response\Json
     * @throws \think\exception\DbException
     * @validate('ContractFilter')
     */
    public function getList($page = 1,$size = 15){

        $filter = [];
        $sortField = 'bill_no';
        $sortType = 'desc';

        if(input('sort_field')){
            $sortField = input('sort_field');
        }
        if(input('sort_type')){
            $sortType =input('sort_type');
        }

        $order = $sortField.' '.$sortType;
        $status = input('status',0);

        if(!empty($status)){
            $filter[] = ['status','=',$status];
        }

        $bill_no = input('bill_no','');
        if(!empty($bill_no)){
            $filter[] = ['bill_no','LIKE','%'.$bill_no.'%'];
        }


        $result = ContractModel::with('housing,customer')->where($filter)->order($order)->order('create_time desc')->paginate($size,false,['page'=>$page]);

        //$result = ContractModel::withJoin(['customer','housing'] ,'LEFT')->where($filter)->paginate($size,false,['page'=>$page]);
        return show(200,$result,'操作成功'); 
    }

    /**
     * 执行(待执行)状态合同
     * @param $request
     * @param('cid','合同ID','require')
     * @auth('启用合同','合同管理')
     * @return \think\response\Json
     */
    public function  execContract(Request $request){
        $cid = input('cid');
        $params = $request->put();
        $params['id'] = $cid;
        app('contract')->execContract($cid);
        return show(201,'','exec contract success');
    }


    /**
     * 终止合同
     * @param Request $request
     * @param('cid','合同ID','require')
     * @auth('终止合同','合同管理')
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
     * 获取合同状态
     * @return \think\response\Json
     * @throws \ReflectionException
     */
    public function getAllStatus(){

        $contractStatus = new ContractStatus();

        $rClass = new \ReflectionClass($contractStatus);
        $status = $rClass->getConstants();
        return show(200,$status);
    }


    /**
     * 获取合同详情
     * @param $cid
     * @param('cid','合同ID','require')
     * @param('合同详情','合同管理')
     * @return \think\response\Json
     */
    public function getInfo($cid){
        $result = app('contract')->getInfo($cid);
        return show(200,$result,'操作成功');
    }


}