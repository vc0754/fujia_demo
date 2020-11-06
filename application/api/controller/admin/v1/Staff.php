<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-09-27
 * Time: 16:11
 */

namespace app\api\controller\admin\v1;

use app\api\model\DinningBalanceLog;
use app\api\model\Staff as M;
use app\api\model\StaffGroup;
use app\lib\exception\common\HandleException;
use app\lib\exception\common\ParameterException;
use think\db\exception\ModelNotFoundException;
use think\Request;

/**
 * Class Staff 员工管理
 * @package app\api\controller\admin\v10
 */
class Staff
{
    /**
     * 获取员工列表
     * @param Request
     * @param $page
     * @param $size
     * @auth('员工列表','员工管理')
     */
    public function getList($page = 1,$size = 15){
        $params = input('param.');
        $filter = [];
        if (isset($params['keyword']) && $params['keyword'] != ''){
            $filter[] = ['real_name|mobile','like',$params['keyword'].'%'];
        }
        if(isset($params['status']) && $params['status'] != ''){
            $filter[] = ['status','=',$params['status']];
        }

        if(isset($params['group_id']) && $params['group_id'] != 'all'){
            $filter[] = ['staff_group_id','=',$params['group_id']];
        }
        $paginator = app('staff')->getList($filter,$page,$size);
        return show(200,$paginator,"操作成功");
    }

    /**
     * 添加员工
     * @param Request $request
     * @return \think\response\Json
     * @auth('添加员工','员工管理')
     */
    public function addStaff(Request $request){

        $data = $request->post();

        $staff = new M();
        $filter['no'] = trim($data['no']);
        $filter['mobile'] = trim($data['mobile']);
        $obj = $staff->whereOr($filter)->select();
        if($obj->isEmpty()){
            $staff->save($data);
            return show(201,['id'=>$staff->id],"操作成功");
        }else{
            throw new ParameterException(['msg'=>'编号跟手机号码必须唯一']);
        }
    }

    /**
     * 修改员工信息
     * @param Request $request
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @auth('修改员工','员工管理')
     */
    public function editStaff(Request $request){
        $data = $request->put();
        $staff = M::where('id',input('id'))->find();
        if ($staff == null){
            throw new ParameterException([
                'msg'=>'找不到指定员工'
            ]);
        }
        $staff->real_name = $data['real_name'];
        $staff->gender = $data['gender'];
        $staff->no = $data['no'];
        $staff->mobile = $data['mobile'];
        $staff->staff_group_id = $data['staff_group_id'];
        $staff->save($data);
        return show(201,"","操作成功");
    }

    /**
     * 设为管理员或取消管理员
     * @param Request $request
     * @auth('管理员设置','员工管理')
     */
    public function setAdmin(Request $request){
        $data = $request->put();
        $staff = M::where('id',input('id'))->find();
        if ($staff == null){
            throw new ModelNotFoundException('找不到指定员工');
        }
        $staff->save(['dinning_role'=> $data["dinning_role"]]);
        return show(200,"","操作成功");
    }


    /**
     * 设为员工在职或离职
     * @param Request $request
     * @auth('员工状态设置','员工管理')
     */
    public function setStatus(Request $request){
        $data = $request->put();
        $staff = M::where('id',input('id'))->find();
        if ($staff == null){
            throw new ModelNotFoundException('找不到指定员工');
        }
        $staff->save(['status'=> $data["status"]]);
        return show(200,"","操作成功");
    }

    /**
     * 删除员工
     * @return \think\response\Json
     * @throws ModelNotFoundException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\exception\DbException
     * @auth('删除员工','员工管理')
     */
    public function deleteStaff(){
        $staff = M::where('id',input('id'))->find();
        if ($staff == null){
            throw new ModelNotFoundException('找不到指定员工');
        }
        $staff->delete();
        return show(200,"","操作成功");
    }

    /**
     * 获取员工余额消费记录
     * @param Request $request
     * @param int $page
     * @param int $size
     * @return \think\response\Json
     * @auth('员工余额消费记录','员工管理')
     */
    public function getBalanceLog(Request $request,$page = 1,$size = 15){
        $params = $request->get();

        $staff_id = input('staff_id','');
        $type = input('type','');

        if($staff_id == ''){
            throw new ParameterException();
        }

        $filter[] = ['staff_id','=',$staff_id];
        if ($type != ''){
            $filter[] = ['type','=',$type];
        }

        $result = DinningBalanceLog::where($filter)->order('create_time','desc')->paginate($size,false,['page'=>$page]);

        return show(200,$result,"操作成功");
    }

    /**
     * 添加员工分组
     * @param Request $request
     * @return \think\response\Json
     * @auth('添加员工分组','员工管理')
     */
    public function addStaffGroup(Request $request){
        $post = $request->post();
        $staffGroup = new StaffGroup();
        $staffGroup->save($post);
        return show(201,'','添加分组成功');
    }

    /**
     * 编辑员工分组
     * @auth('编辑员工分组','员工管理')
     * @param Request $request
     * @return \think\response\Json
     * @throws ModelNotFoundException
     * @throws ParameterException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\exception\DbException
     */
    public function editStaffGroup(Request $request){
        $id = input('sid');
        $put = $request->put();
        $staffGroup = StaffGroup::where('id',$id)->find();
        if(!$staffGroup){
            throw new ParameterException();
        }
        $staffGroup->group_name = $put['group_name'];
        $staffGroup->save();
        return show(201,'','编辑分组成功');
    }

    /**
     * 删除员工分组
     * @auth('删除员工分组','员工管理')
     * @param $sid
     * @return \think\response\Json
     * @throws HandleException
     */
    public function deleteStaffGroup($sid){
        $count = M::where('staff_group_id',$sid)->count();
        if($count > 0){
            throw new HandleException([
                'msg' => '请先清空分组下的员工'
            ]);
        }
        StaffGroup::destroy($sid);
        return show(201,'','删除分组成功');
    }

    /**
     * 分组列表
     * @auth('查询员工分组列表','员工管理')
     * @return \think\response\Json
     */
    public function getStaffGroups(){
        $res = StaffGroup::all();
        return show(200,$res);
    }

}