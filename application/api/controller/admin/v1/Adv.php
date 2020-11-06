<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-16
 * Time: 13:48
 */

namespace app\api\controller\admin\v1;

use app\lib\enum\AdvType;
use app\lib\exception\common\ParameterException;
use think\Db;
use think\Exception;
use think\Request;
use app\api\model\Adv as AdvModel;

/**
 * Class Adv
 * @package app\api\controller\cms
 */
class Adv
{

    /**
     * 获取列表
     * @param('type','类型','require|number')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @param Request $request
     * @auth('广告列表','广告管理')
     * @return \think\response\Json
     */
    public function getList(Request $request){
        $params = $request->get();

        $filter[] = ['type','=',$params['type']];

        $result = AdvModel::getList($filter,true,$params['page'],$params['size']);
        return show(200,$result,'update ads success');
    }

    /**
     * @param Request $request
     * @return \think\response\Json
     * @auth('添加广告','广告管理')
     */
    public function createAdv(Request $request){
        $params = $request->post();
        if($params['type'] == AdvType::VIDEO){
            if($params['status'] == 1){
                AdvModel::where('type',AdvType::VIDEO)->update(['status'=>0]);
            }
        }
        $advModel = new AdvModel();
        $advModel->save($params);
        return show(201,'','add ads success');
    }

    /**
     * 编辑信息
     * @param('id','ID','require')
     * @param Request $request
     * @return \think\response\Json
     * @throws ParameterException
     * @auth('编辑广告','广告管理')
     */
    public function updateAdv(Request $request){
        $params = $request->put();
        $params['id'] = input('id');
        if($params['type'] == AdvType::VIDEO){
            if($params['status'] == 1){
                AdvModel::where('type',AdvType::VIDEO)->update(['status'=>0]);
            }
        }
        AdvModel::editAdv($params);
        return show(201,'','update ads success');
    }



    /**
     * 根据ID获取记录信息
     * @param('id','ID','require')
     * @param $id
     * @return \think\response\Json
     * @throws ParameterException
     * @auth('广告详情','广告管理')
     */
    public function getAdv($id){
        $result = AdvModel::get($id);

        if(!$result){
            throw new ParameterException();
        }

        return show(200,$result,'update ads success');
    }

    /**
     * 删除记录
     * @auth('删除广告','广告管理')
     * @param('id','ID','require')
     * @return \think\response\Json
     * @throws ParameterException
     */
    public function delAdv($id){
        $result = AdvModel::get($id);

        if(!$result){
            throw new ParameterException();
        }

        $result->delete();
        return show(201,'','delete success');
    }

    /**
     * @auth('启用视频','广告管理')
     * @param Request $request
     * @return \think\response\Json
     * @throws Exception
     */
    public function  videoEnable(Request $request){
        $aid = input('aid');
        Db::startTrans();
        try{
            AdvModel::where('type',AdvType::VIDEO)->update(['status'=>0]);
            $adv = AdvModel::get($aid);
            if(!$adv || ($adv->type != AdvType::VIDEO)){
               throw new ParameterException();
            }
            $adv->status = 1;
            $adv->save();
            Db::commit();
        }catch (Exception $e){
            Db::rollback();
            throw $e;
        }
        return show(201,'','start success');
    }

}