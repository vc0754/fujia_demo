<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-05
 * Time: 10:52
 */

namespace app\api\controller\admin\v1;

use app\lib\exception\common\ParameterException;
use think\Request;
use app\api\model\Machine as MachineModel;
/**
 * 仪表
 * Class Meter
 * @package app\api\controller\cms
 */
class Machine
{

    /**
     * 添加设备信息
     * @auth('添加水控机','水控设备管理')
     * @param Request $request
     * @return \think\response\Json
     */
    public function addMachine(Request $request){
        $post = $request->post();
        //$machine = new MachineModel();
        //$machine->save($post);
        app('card')->addMachine($post);
        return show(200,'','insert success');
    }

    /**
     * 更新设备信息
     * @auth('更新水控机','水控设备管理')
     */
    public function updateMachine(Request $request)
    {
        $params = $request->put();
        $params['id'] = input('id');
        //$machine = new MachineModel();
        //$machine->allowField(['machine_no','machine_ip','port'])->save($post,['id'=> $request->put('id')]);
        app('card')->editMachine($params);
        return show(200,'','update success');
    }


    /**
     * 批量更新设备qrcolde
     * @auth('设置机器二维码','水控设备管理')
     * @param('ids','设备ID','require|array')
     */
    public function updateMachineQrCode(Request $request){
        $params = $request->post();
        //$machine = new MachineModel();
        //$machine->allowField(['machine_ip','port'])->save($post,['machine_no'=> $request->put('machine_no')]);
        app('card')->editMachineQrCode($params);
        return show(201,'','update qrcode success');
    }

    /**
     * 设置水卡机水费单价
     * @auth('设置水费单价','水控设备管理')
     * @param('ids','设备ID','require|array')
     */
    public function setMachinePrice(Request $request){
        $params = $request->post();
        //$machine = new MachineModel();
        //$machine->allowField(['machine_ip','port'])->save($post,['machine_no'=> $request->put('machine_no')]);
        app('card')->setMachinePrice($params);
        return show(201,'','update price success');
    }

    /**
     * 设置水卡机水费单位倍数
     * @auth('设置水费单位倍数','水控设备管理')
     * @param('ids','设备ID','require|array')
     */
    public function setMachineUnitTimes(Request $request){
        $params = $request->post();
        app('card')->setMachineUnitTimes($params);
        return show(201,'','update unit_times success');
    }

    /**
     * 获取设备列表
     * @auth('水控设备列表','水控设备管理')
     */
    public function getMachineList($page=1,$size=15,$order='asc',$machine_no = ''){

        //$rows = MachineModel::all();
        $filter = [];
        $order = $order == 'desc'? 'desc':'asc';

        if($machine_no != ''){
            $filter[] = ['machine_no','=',$machine_no];
        }


        $rows = MachineModel::getList($filter,$page ,$size,$order);
        return show(200,$rows,'get machine list success');
    }


}