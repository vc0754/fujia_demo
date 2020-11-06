<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-05
 * Time: 10:58
 */

namespace app\api\controller\admin\v1;

use app\api\model\TimingBill as TimingBillModel;
use app\lib\enum\BillSource;
use app\lib\enum\BillType;
use app\api\model\Bill;
use app\lib\enum\ContractStatus;
use app\lib\enum\FlowType;
use app\lib\enum\BillState;
use app\api\model\Customer as CustomerModel;

use app\lib\token\Token;
use function PHPSTORM_META\type;
use think\helper\Time;
use think\Request;

/**
 * 财务账单
 * Class Account
 * @package app\api\controller\cms
 */
class Account
{

    /**
     * 根据商户id获取未交费应收单(含详情)
     * @param integer $customer_fid 商户id
     * @param integer $page
     * @param integer $size
     * @return \think\response\Json
     */
    public function getUnPaidBillByCid(int $customer_fid,$page = 1,$size = 15){

        $filter[] = ['state','=',BillState::UNPAID];
        $filter[] = ['customer_fid','=',$customer_fid];
        $filter[] = ['type','IN',[BillType::RECEIVABLES,BillType::RELIEFORDER]];

        $list = Bill::getBillByCid($filter,$page,$size);

        return show(200,$list,'操作成功');
    }

    /**
     * @param $customer_fid
     */
    public function getBalanceAccount($customer_fid){
           $results =  TimingBillModel::getDetailListByCustomer($customer_fid);
           if(!$results){
               return [];
           }
           return $results;
    }

    /**
     * 检测客户是否可退款与客户余额
     */
    public function getCanRefundCustomerInfo($customer_fid){
        $contractStatus[] = ['status','not in',[ContractStatus::WAITING_EXECUTE,ContractStatus::EXECUTING,ContractStatus::WAITING_FINISH]];

        $result = CustomerModel::getInfoByFID($customer_fid,$contractStatus);
        if(!$result){
            $result = [];
        }
        unset($result['contract']);
        return show(200,$result);
    }



    /**
     * 账单流水查询(主页)
     * @auth('每日流水','数据统计')
     * param $time_tag //参数：上周lastWeek 本周week 本月month 上月lastMonth
     * param $start_date // 开始日期
     * param $end_date // 结束日期
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     * @throws Exception
     * @throws \app\lib\exception\token\TokenException
     */
    public function getChargeStatistics(){
        //时间标签
        $timeTag = input('time_tag','');
        //开始与结束日期
        $start_date = input('start_date',date('Y-m-d'));
        $end_date = input('end_date',date('Y-m-d'));

        $end_date = $end_date.' 23:59:59';

        $page = input('page',1);
        $size = input('size',15);

        if(!empty($timeTag)){
            switch ($timeTag){
                case 'week':
                    list($start,$end) = Time::week();
                    break;
                case 'lastWeek':
                    list($start,$end) = Time::lastWeek();
                    break;
                case 'month':
                    list($start,$end) = Time::month();
                    break;
                case 'lastMonth':
                    list($start,$end) = Time::lastMonth();
                    break;
                default:

            }

            $start_date = date('Y-m-d H:i:s',$start);
            $end_date = date('Y-m-d H:i:s',$end);
        }


        $data = app('payment_record')->getChargeStatisticsV2($start_date,$end_date,$page,$size);
        return show(200,$data,'success');
    }



    /**
     * 账单流水查询(子页)
     * @auth('流水明细','数据统计')
     * @param Request $request
     * @return \think\response\Json
     * @throws Exception
     * @throws \app\lib\exception\token\TokenException
     */
    public function getBillFlow(Request $request){

        $params = $request->get();
        
        $filter = [];
        //类型:1 商户缴费;2 余额充值;3余额退款 ;4 水卡充值;5 水卡退款
        if(isset($params['type'])){
            if(!empty($params['type'])){

                switch ($params['type']){
                    case FlowType::BILL:
                        $filter[] = ['bill_source','=',BillSource::BILL];
                        break;
                    case FlowType::BALANCE_RECHARGE:
                        $filter[] = ['bill_source','=',BillSource::RECHARGE];
                        $filter[] = ['total_amount','>',0];
                        break;
                    case FlowType::BALANCE_REFUND:
                        $filter[] = ['bill_source','=',BillSource::RECHARGE];
                        $filter[] = ['total_amount','<',0];
                        break;
                    case FlowType::CARD_RECHARGE:
                        $filter[] = ['bill_source','=',BillSource::WATERCARD];
                        $filter[] = ['total_amount','>',0];
                        break;
                    case FlowType::CARD_REFUND:
                        $filter[] = ['bill_source','=',BillSource::WATERCARD];
                        $filter[] = ['total_amount','>',0];
                        break;
                }
            }
        }

        $arrWhere = [];
        //商户姓名
        if(isset($params['name'])){
            if(!empty($params['name'])){
                $arrWhere[] = ['name','LIKE',"%{$params['name']}%"];
            }
        }

        //开始与结束日期
        $start_date = input('start_date');
        $end_date = input('end_date');

        $page = input('page',1);
        $size = input('size',15);

        if(!empty($start_date)){
            $start_date = $start_date.' 00:00:00';
        }else{
            $start_date = date('Y-m-d',strtotime("-6 month"));
        }
        if(!empty($end_date)){
            $end_date = $end_date.' 23:59:59';
        }else{
            $end_date = date('Y-m-d H:i:s',time());
        }

        $filter[] = ['charge_time','between time',[$start_date,$end_date]];
        $data = app('payment_record')->getBillFlow($filter,$page,$size,$arrWhere);

        return show(200,$data,'success');

    }

    /**
     * @auth('流水明细详情','数据统计')
     * 账单流水查询备注（商户缴费类型详情）
     * @param $payment_record_id
     * @param('payment_record_id','ID','require')
     * @return \think\response\Json
     */
    public function getBillFlowRemark($payment_record_id){
        //$data = app('payment_record')->getBillFlowRemark($payment_record_id);
        $data = app('payment_record')->getBillFlowRemarkForAdmin($payment_record_id);
        return show(200,$data,'success');
    }


    /**
     * 获取每日对账
     * @auth('每日对账','数据统计')
     * param $time_tag //参数：上周lastWeek 本周week 本月month 上月lastMonth
     * param $start_date // 开始日期
     * param $end_date // 结束日期
     * @return \think\response\Json
     * @throws Exception
     * @throws \app\lib\exception\token\TokenException
     */
    public function getBillProofreading(){

        //时间标签
        $timeTag = input('time_tag','');
        //开始与结束日期
        $start_date = input('start_date',date('Y-m-d'));
        $end_date = input('end_date',date('Y-m-d'));

        if(!empty($start_date)){
            $start_date = $start_date.' 00:00:00';
        }
        if(!empty($end_date)){
            $end_date = $end_date.' 23:59:59';
        }

        if(!empty($timeTag)){
            switch ($timeTag){
                case 'week':
                    list($start,$end) = Time::week();
                    break;
                case 'lastWeek':
                    list($start,$end) = Time::lastWeek();
                    break;
                case 'month':
                    list($start,$end) = Time::month();
                    break;
                case 'lastMonth':
                    list($start,$end) = Time::lastMonth();
                    break;
                default:

            }

            $start_date = date('Y-m-d H:i:s',$start);
            $end_date = date('Y-m-d H:i:s',$end);
        }

        $filter[] = ['charge_time','between time',[$start_date,$end_date]];
        $data = app('payment_record')->getBillProofreadingV2($filter);

        return show(200,$data,'success');
    }




}