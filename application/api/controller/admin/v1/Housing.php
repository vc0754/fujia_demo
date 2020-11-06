<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-05
 * Time: 10:14
 */

namespace app\api\controller\admin\v1;

use think\Request;
use app\api\model\Housing as HousingModel;


/**
 * 房源管理
 * Class Housing
 * @package app\api\controller\cms
 */
class Housing
{
    /**
     * 查询列表
     * @auth('房源列表','房源管理')
     * @param Request $request
     * @return \think\response\Json
     */
    public function getList($page = 1,$size = 15){

        $filter[] = ['parent_fid','>',0];
        //查询的父级
        $parentFid = input('get.parent_fid',0);
        if($parentFid!=0){
            $filter[] =  ['parent_fid','=',$parentFid];
        }

        //房源名称  
        $name = input('get.name','');
        if(trim($name) != ''){
            $filter[] =  ['name', 'LIKE', '%'.$name.'%'];
        }
        //状态
        $state = input('get.state',0);
        if(!empty($state)){
            $filter[] = ['state','=',$state];
        }

        $result = HousingModel::getList($filter,$page,$size);
        return show(200,$result,'操作成功'); 
    }

    /**
     * @auth('区域列表','房源管理')
     * @param int $page
     * @param int $size
     * @return \think\response\Json
     */
    public function getAreaList($page = 1,$size = 15){


        $filter[] = ['parent_fid','=',0];


        $result = HousingModel::getList($filter,$page,$size);

        foreach($result as $key =>$item)
        {
            $where=[
                ['parent_fid','=',$item->fid]
            ];
            $result[$key]["total_all"] = HousingModel::where($where)->count("id");
            $where=[
                ['parent_fid','=',$item->fid],
                ['state','=',1]
            ];
            $result[$key]["total_use"] = HousingModel::where($where)->count("id");
            $where=[
                ['parent_fid','=',$item->fid],
                ['state','=',2]
            ];
            $result[$key]["total_not_use"] = HousingModel::where($where)->count("id");
        }

        return show(200,$result,'操作成功');
    }
}