<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-10-16
 * Time: 11:32
 */

namespace app\api\controller\api\v1;


use app\lib\enum\ApplicationEnum;
use app\lib\token\Token;
use app\api\model\Staff as StaffModel;


class Staff
{

    /**
     * 获取对应的员工信息
     * @auth('Staff')
     * @return \think\response\Json
     * @throws \app\lib\exception\token\TokenException
     * @throws \think\Exception
     */
    public function getMyStaffInfo(){

        $openid = Token::getCurrentWxOpenID(ApplicationEnum::DINNING);
        $staffID = cache($openid)['staff_id'];
        $staff = StaffModel::get($staffID);
        return show(200,$staff);
    }
}