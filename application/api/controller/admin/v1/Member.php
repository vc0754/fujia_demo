<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/7
 * Time: 9:44
 */

namespace app\api\controller\admin\v1;

use app\api\model\Member as MemberModel;
use think\facade\Hook;
use think\Request;
use app\lib\exception\common\ParameterException;

class Member
{
    /**
     * @auth('用户列表','小程序用户管理')
     * @param Request $request
     * @param int $page
     * @param int $size
     * @return \think\response\Json
     * @throws \think\exception\DbException
     */
    public function getList(Request $request,$page = 1,$size = 15){

        $params = $request->get();

        $filter = [];
        if(isset($params['id']) && $params['id'] != ''){
            $temp1 = trim($params['id']);
            $filter[] =  ['id', 'LIKE', "%{$temp1}%"];
        }
        if(isset($params['nick_name']) && $params['nick_name'] != ''){
            $temp2 = trim($params['nick_name']);
            $filter[] =  ['nick_name', 'LIKE', "%{$temp2}%"];
        }
        if(isset($params['mobile']) && $params['mobile'] != ''){
            $temp3 = trim($params['mobile']);
            $filter[] =  ['mobile', 'LIKE', "%{$temp3}%"];
        }
        if(isset($params['is_manager']) && $params['is_manager'] != ''){
            $filter[] = ['is_manager','=',$params['is_manager']];
        }
        if(isset($params['is_maintainer']) && $params['is_maintainer'] != ''){
            $filter[] = ['is_maintainer','=',$params['is_maintainer']];
        }
        if(isset($params['is_waiter']) && $params['is_waiter'] != ''){
            $filter[] = ['is_waiter','=',$params['is_waiter']];
        }
        if(isset($params['app_id'])){
            $filter[] = ['application_id','=',$params['app_id']];
        }

        $result = MemberModel::where($filter)->paginate($size,false,['page'=>$page]);

        return show(200,$result,'操作成功');
    }


    /**
     * @auth('设置管理员','小程序用户管理')
     * @param Request $request
     * @return \think\response\Json
     */
    public function setAuthority(Request $request){
        $params = $request->put();
        $params['id'] = input('id');
        MemberModel::setAuthority($params);

        return show(201,'','update success');

    }

    /**
     * @auth('设置真实姓名','小程序用户管理')
     * @param Request $request
     * @return \think\response\Json
     */
   public function setRealName(Request $request){
       $params = $request->put();
       $params['id'] = input('id');
       MemberModel::update([
           'id' => $params['id'],
           'real_name' => $params['real_name']
       ]);

       return show(201,'','update success');
   }
}