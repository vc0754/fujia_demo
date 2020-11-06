<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/4/9
 * Time: 9:39
 */

namespace app\api\controller\admin\v1;


use app\api\model\Bill as BillModel;
use app\api\model\Housing as HousingModel;
use app\lib\enum\BillState;
use app\lib\enum\BillType;
use app\lib\enum\CardStatus;
use app\lib\enum\FeedbackStatus;
use app\lib\enum\RepairStatus;
use app\lib\enum\StallType;
use app\api\model\Customer as CustomerModel;
use app\api\model\CardInfo as CardInfoModel;
use app\api\model\Feedback as FeedbackModel;
use app\api\model\RepairApplication as RepairModel;

/**
 * 首頁
 * Class Index
 * @package app\api\controller\cms
 */
class Index
{
    /**
     * 统计近30天内所有商铺、档口每日用电、用水量
     * @param int $days
     */
    public function meterStatistics(){
        $days = 29;
        $results = cache('meter_statistics');
        if(!$results){
            $results = app('device')->meterStatistics($days);
            cache('meter_statistics',$results,7200);
        }
        return show(200,$results);
    }

    /**
     * 房源租赁统计
     * @return \think\response\Json
     */
    public  function  housingStatistics(){
        //统计总房源数
        //摊位
        $where[] = ['stall_type','=',StallType::STALL];
        $stallCount['stall'][] = HousingModel::getHousingTotalCounts($where);
        //商铺
        $where2[] = ['stall_type','=',StallType::SHOP];
        $stallCount['shop'][] = HousingModel::getHousingTotalCounts($where2);
        return show(200,$stallCount);
    }

    /**
     * 商户合同状态统计
     * 近期到租数(1个月内)  过期未缴  本月退租  本月新租合同
     */
    public function contractStatistics(){

        $result = app('contract')->statusCountsStatistics();

        return show(200,$result);
    }

    /**
     * 商户统计
     * 总商户数量  商户总储值 商户总待缴 商户水卡总储值 水卡当前激活数量
     */
    public function customerStatistics(){
        $output = [
            'all_customer_count' => 0,
            'customer_total_balance' => 0,
            'total_unpaid_amount' => 0,
            'water_card_total_balance' => 0,
            'water_card_active_num' => 0
        ];

        $output['all_customer_count'] = CustomerModel::count('*');
        $output['customer_total_balance'] = (string) CustomerModel::sum('balance');
        $output['total_unpaid_amount']=(string) BillModel::where('type',BillType::RECEIVABLES)->where('state',BillState::UNPAID)->sum('total');
        $output['water_card_total_balance'] = (string) CardInfoModel::where('status',CardStatus::ACTIVE)->whereOr('status',CardStatus::LOSS)->sum('balance');
        $output['water_card_active_num'] = CardInfoModel::where('status',CardStatus::ACTIVE)->count('*');
        $output['water_card_counts'] = CardInfoModel::count('*');
        return show(200,$output);
    }

    /**
     * 水电表在线状态展示
     * @return \think\response\Json
     */
    public function meterOnlineStateCount(){
        $res = app('device')->meterOnlineStateCount();
        return show(200,$res);

    }

    /**
     * 服务消息统计
     */
    public function serveMessageCount(){
        $output = [
            'unread_feedback_count' => 0,
            'pending_repair_count' => 0,
            'accepting_repair_count' => 0
        ];
        $output['unread_feedback_count'] = FeedbackModel::where('status',FeedbackStatus::UNREAD)->count();
        $output['pending_repair_count'] =  RepairModel::where('status',RepairStatus::PENDING)->count();
        //$output['accepting_repair_count'] = RepairModel::where('status',RepairStatus::)->count();

        return show(200,$output);
    }


}