<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-16
 * Time: 13:42
 */

namespace app\api\controller\api\v1;

use app\api\model\Adv as AdvModel;
use app\lib\enum\AdvType;


class Adv
{
    /**
     * 首页广告横幅
     */
    public function getBanner(){
        $adsense = 1;
        if(input('adsense')){
            $adsense = input('adsense');
        }
        $filter[] = ['adsense','=',$adsense];
        $filter[] = ['type','=',AdvType::IMAGES];
        $filter[] = ['status','=',1];
        $result = AdvModel::getList($filter,false);
        if(!$result){
            $result = [];
        }
        return show(200,$result,'操作成功');
    }

    /**
     * 首页广告通知
     *
     */
    public function getNotice(){
        $adsense = 1;
        if(input('adsense')){
            $adsense = input('adsense');
        }
        $filter[] = ['adsense','=',$adsense];
        $filter[] = ['type','=',AdvType::NOTICE];
        $filter[] = ['status','=',1];
        $result = AdvModel::getList($filter,false);
        if(!$result){
            $result = [];
        }
        return show(200,$result,'操作成功');
    }

    /**
     * 获取视频
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getVideo(){
        $filter[] = ['type','=',AdvType::VIDEO];
        $filter[] = ['status','=',1];
        $result = AdvModel::with('file,coverFile')->where($filter)->order('sort','desc')->find();
        if(!$result){
            $result = [];
        }
        return show(200,$result,'操作成功');
    }
}