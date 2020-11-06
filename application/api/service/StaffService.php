<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-09-27
 * Time: 16:12
 */

namespace app\api\service;


use app\api\model\Staff;
use app\api\model\StaffGroup;
use app\lib\token\Token;

class StaffService
{

    public function getList($filter = null,$page = 1,$size = 15){
        $data = Staff::where($filter)
                ->order('create_time','asc')
                ->paginate($size,false,['page'=>$page]);
        if($data->isEmpty()){
            return $data;
        }
        $data = $data->toArray();
        $data['data'] = array_map(function($v){
          $v['group_name'] =  $v['staff_group_id'] ? StaffGroup::where('id',$v['staff_group_id'])->value('group_name') : '未分组';
            return $v;
        },$data['data']);
        return $data;
    }

//    public function getCurrentStaff(){
//        $member = \app\api\model\Member::where('id', Token::getCurrentMID())->find();
//        $staff = Staff::where('mobile',$member->mobile)->find();
//        return $staff;
//    }
}