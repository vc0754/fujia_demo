<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-02
 * Time: 10:20
 */

namespace app\api\controller\admin\v1;


use app\lib\exception\common\ParameterException;
use think\Request;
use  app\api\model\Sysconfig as  SysconfigModel;

class SysConfig
{
    /**
     * 系统配置
     * @auth('系统配置','管理员','hidden')
     * @param Request $request
     */
    public function setConfig(Request $request){
        $field = config('sysConfFiled.');

        $params = $request->post();
        if(!in_array($params['field'],$field)){
            throw new ParameterException([
                'msg' => '无该配置项'
            ]);
        }
        $sys = SysconfigModel::where('field',$params['field'])->find();
        if($sys){
            $sys->value = $params['value'];
        }else{
            $sys = new SysconfigModel();
            $sys->field = $params['field'];
            $sys->value = $params['value'];
            //$sys->desc = $params['desc'];
        }
        $sys->save();

        return show(201,[],'set success');
    }

    /**
     * @auth('系统配置列表','管理员','hidden')
     * @return \think\response\Json
     */
    public function getList(){
        $sysConfigList = SysconfigModel::all();
        if($sysConfigList->isEmpty()){
            return show(200,[]);
        }
        return show(200,$sysConfigList);
    }
}