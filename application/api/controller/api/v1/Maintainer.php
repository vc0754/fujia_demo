<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-10-21
 * Time: 16:22
 */

namespace app\api\controller\api\v1;
use app\api\model\Housing;
use app\api\model\RepairApplication;
use app\lib\enum\ApplicationEnum;
use app\lib\enum\RepairStatus;
use app\lib\exception\common\ParameterException;
use app\lib\token\Token;
use think\Request;


/**
 * 维修人员
 * Class Maintainer
 * @package app\api\controller\api\v1
 */
class Maintainer
{

    /**
     * 获取报修事务列表信息
     * @auth('Maintainer')
     * @param Request $request
     * @param string $status
     * @param('status','状态','require|number')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     * @throws ParameterException
     */
    public function getRepairList(Request $request,$status = '',$page = 1,$size = 15){


        $member_id = Token::getCurrentMID(ApplicationEnum::FU_JIA);
        $filter[] = ['member_id','=',$member_id];
        switch ($status){
            //全部
            case 1:
                break;
            //待报价
            case 2:
                $filter[] = ['status','=',RepairStatus::QUOTED_PRICE];
                $filter[] = ['quoted_price','null',''];
                break;
            //待审核
            case 3:
                $filter[] = ['status','=',RepairStatus::QUOTED_PRICE];
                $filter[] = ['quoted_price','not null',''];
                break;
            //待付款
            case 4:
                $filter[] = ['status','=',RepairStatus::WAIT_PAID];
                break;
            //待维修
            case 5:
                $filter[] = ['status','=',RepairStatus::WAIT_REPAIR];
                break;
            //已完成
            case 6:
                $filter[] = ['status','=',RepairStatus::OVER];
                break;
            default:
                throw new ParameterException();
        }


        $result = app('repair')->getRepairList($filter,$page,$size);

        return show(200,$result,'success');
    }

    /**
     * 维修报价推送金蝶
     * @auth('Maintainer')
     * @param('id','报修记录ID','require')
     * @param('quoted_price','报价金额','require')
     * @param('quoted_price_remark','报价备注','require')
     * @param Request $request
     * @return \think\response\Json
     */
    public function quotedPrice(Request $request){
        $params = $request->put();

        if($params['quoted_price'] < 0){
            throw new ParameterException(['msg'=>'金额不得小于0']);
        }


        app('repair')->quotedPrice($params['id'],$params['quoted_price'],$params['quoted_price_remark']);

        return show(201,'','update repair success');
    }

    /**
     * 报修完成
     * @auth('Maintainer')
     * @param('id','报修记录ID','require')
     * @param Request $request
     * @return \think\response\Json
     * @throws ParameterException
     */
    public function completeRepair(Request $request){
        $params = $request->put();
        $params['id'] = input('id');
        RepairApplication::complete($params);
        return show(201,'','complete repair success');
    }

    /**
     * 报修信息详情
     * @auth('Maintainer')
     * @param('id','报修记录ID','require')
     * @param Request $request
     * @return array|mixed
     */
    public function getRepairDetail(Request $request){
        $params = $request->get();
        $params['id'] = input('id');

        $result = RepairApplication::get($params['id']);

        if ($result->isEmpty()) {
            return [];
        }

        $housingName = Housing::where('fid', '=', $result->repair_unit)->value('name');
        $result->repair_unit = $housingName;
        return show(200,$result,'success');
    }

}