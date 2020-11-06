<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/13
 * Time: 10:14
 */

namespace app\api\controller\api\v1;


use app\lib\enum\RepairStatus;
use app\lib\exception\common\ParameterException;
use think\Request;

class Customer
{

    /**
     * 获取当前商户信息
     * @auth('Customer')
     * @return \think\response\Json
     */
    public function getInfo(){
        $result = app('customer')->getInfo();

        return show(200,$result,'success');
    }

    /**
     * 获取客户全部房源的水电表当前信息
     * @auth('Customer')
     * @return \think\response\Json
     */
    public function getMeterDetail(){
        $result = app('customer')->getMeterDetail();

        return show(200,$result,'success');
    }

    /**
     * 获取水卡卡包信息
     * @auth('Customer')
     * @return \think\response\Json
     */
    public function getCardList(){
        $result = app('customer')->getCardList();

        return show(200,$result,'success');
    }

    /**
     * 查询报修列表
     * @auth('Customer')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @param int $page
     * @param int $size
     * @return \think\response\Json
     */
    public function getRepairList($page = 1,$size = 15){
        $result = app('customer')->getRepairList($page,$size);
        return show(200,$result,'操作成功');
    }

    /**
     * 添加报修信息
     * @auth('Customer')
     * @validate('AddRepair')
     * @param Request $request
     * @return \think\response\Json
     */
    public function addRepair(Request $request){
        $params = $request->post();
        $result = app('customer')->addRepair($params);
        return show(201,$result,'add repair success');
    }

    /**
     * 取消报修申请
     * @auth('Customer')
     * @param('rid','报修记录ID','require')
     * @param Request $request
     * @return \think\response\Json
     */
    public function cancelRepair(Request $request){
        $params = $request->put();
        $params['rid'] = input('rid');
        app('customer')->cancelRepair($params);

        return show(201,'','update repair success');
    }

    /**
     * 评价报修
     * @auth('Customer')
     * @param('rid','报修记录ID','require')
     * @param('evaluation_status','评价状态','require')
     * @param('evaluation_content','评价内容','require')
     * @param Request $request
     * @return \think\response\Json
     */
    public function evaluationRepair(Request $request){
        $params = $request->put();
        $params['rid'] = input('rid');
        app('customer')->evaluationRepair($params);

        return show(201,'','update repair success');
    }


    /**
     * 获取报修详情
     * @auth('Customer')
     * @param('rid','报修记录ID','require')
     * @param null $rid
     * @return \think\response\Json
     * @throws ParameterException
     */
    public function getRepairInfo($rid){
        $filter[] = ['id','=',$rid];
        $result = app('customer')->getRepairInfo($filter);

        return show(200,$result,'操作成功');
    }

    /**
     * 查询反馈列表
     * @auth('Customer')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @param int $page
     * @param int $size
     * @return \think\response\Json
     */
    public function getFeedbackList($page = 1,$size = 15){
        $result = app('customer')->getFeedbackList($page,$size);
        return show(200,$result,'操作成功');

    }

    /**
     * 添加反馈信息
     * @auth('Customer')
     * @validate('AddFeedback')
     * @param Request $request
     * @return \think\response\Json
     */
    public function addFeedback(Request $request){
        $params = $request->post();
        $result = app('customer')->addFeedback($params);
        return show(201,$result,'add feedback success');
    }

    /**
     * 获取反馈信息详情
     * @auth('Customer')
     * @param('f_id','报修记录ID','require')
     * @param null $f_id
     * @return \think\response\Json
     * @throws ParameterException
     */
    public function getFeedbackInfo($f_id){

        $filter[] = ['id','=',$f_id];
        $result = app('customer')->getFeedbackInfo($filter);

        return show(200,$result,'操作成功');
    }

    /**
     * 获取客户当前拥有的房源信息
     * @auth('Customer')
     * @return \think\response\Json
     */
    public function getHousing(){
        $result = app('customer')->getHousing();
        return show(200,$result,'操作成功');
    }

    /**
     * 获取客户拥有过房源信息
     * @auth('Customer')
     * @return \think\response\Json
     */
    public function getAllHousing(){
        $result = app('customer')->getHousing(true);
        return show(200,$result,'操作成功');
    }

    /**
     * 获取客户所有合同
     * @auth('Customer')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     */
    public function getCustomerContract($page = 1,$size = 15){

        $result = app('customer')->getContract($page,$size);
        return show(200,$result,'操作成功');
    }

    /**
     * 获取客户合同详情
     * @auth('Customer')
     * @param('cid','合同ID','require')
     * @param $cid
     * @return \think\response\Json
     */
    public function getCustomerContractInfo($cid){
        $result = app('contract')->getInfo($cid);
        return show(200,$result,'操作成功');
    }

}