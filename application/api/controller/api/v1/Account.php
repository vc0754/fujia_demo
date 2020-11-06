<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-16
 * Time: 15:06
 */

namespace app\api\controller\api\v1;


use app\lib\exception\common\HandleException;
use app\lib\token\Token;
use think\Exception;
use think\facade\Cache;
use think\Request;

class Account
{

    /**
     * 获取未缴费账单
     * @auth('Customer')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     */
    public function getUnpaidBill($page = 1,$size = 15){
        $result = app('customer')->getUnpaidBill($page,$size);
        return show(200,$result,'操作成功');
    }

    /**
     * 获取账单列表
     * @auth('Customer')
     * @param('start_date','开始日期','require|date')
     * @param('end_date','结束日期','require|date')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     */
    public function getBill($page = 1,$size = 15){

        $start_date = input('start_date');
        $end_date = input('end_date');

        $result = app('customer')->getBill($start_date,$end_date,$page,$size);
        return show(200,$result,'操作成功');

    }

    /**
     * 获取待缴费用总额数，本月账单总额数
     * @return \think\response\Json
     */
    public function getPendingStatistics(){

        $openID = Token::getCurrentWxOpenID();
        $authCache = cache($openID);
        if(!$authCache){
            $result = ['upaid_total'=>0,'monthTotal'=>0];
            return show(200,$result,'操作成功');
        }

        try{
            $result = app('customer')->getPendingStatistics();
        }catch (Exception $ex){
            if($ex->getCode() == 403){
                $result = ['upaid_total'=>0,'monthTotal'=>0];

                return show(200,$result,'操作成功');
            }
            throw $ex;
        }

        return show(200,$result,'操作成功');
    }

    /**
     * 一键缴费，查询并生成预支付账单
     * @auth('Customer')
     * @validate('ReceivableBill.mini_pro')
     * @return \think\response\Json
     */
    public function prePayAccount(Request $request){

        $params = $request->post();

        $result = app('customer')->prePayAccount($params['fids']);

        return show(200,$result,'操作成功');
    }

    /**
     * 充值水电余额，生成预支付账单
     * @auth('Customer')
     * @param float $amount
     * @return \think\response\Json
     */
    public function payMyAccountBalance(Request $request){

        $params = $request->post();
        $amount = floatval($params['amount']);

        if(is_numeric($amount) && ($amount+0) >= 0){
            $result = app('customer')->payMyAccountBalance($amount);
            return show(200,$result,'操作成功');
        }else{
            throw new HandleException(['mag' => '充值金额填写有误']);
        }
    }

    /**
     * 获取水电余额展示信息
     * @auth('Customer')
     * @return \think\response\Json
     */
    public function getHydropowerBalance(){
        $result = app('customer')->getHydropowerBalance();

        return show(200,$result,'success');
    }

    /**
     * 获取水电表余额明细记录列表
     * @auth('Customer')
     * @param('start_date','开始日期','require|date')
     * @param('end_date','结束日期','require|date')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     */
    public function getBalanceMeter(Request $request){

        $params = $request->get();
        $result = app('customer')->getBalanceMeter($params);

        return show(200,$result,'success');
    }

    /**
     * 获取余额明细记录列表(含统计信息)
     * @auth('Customer')
     * @param('start_date','开始日期','require|date')
     * @param('end_date','结束日期','require|date')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     */
    public function getBalanceMeterTotal(Request $request){
        $params = $request->get();
        $result = app('customer')->getBalanceMeterTotal($params);

        return show(200,$result,'success');
    }

    /**
     * 获取余额变动记录统计列表
     * @auth('Customer')
     * @param('year','年份','require')
     * @param $year 查询年份统计 默认2020
     * @return \think\response\Json
     */
    public function getBalanceMeterGroup( $year= '2020' ){

        $result = app('customer')->getBalanceMeterGroup($year);

        return show(200,$result,'success');
    }

    /**
     * 获取余额变动记录详情
     * @auth('Customer')
     * @param('bid','ID','require')
     * @param $bid
     * @return \think\response\Json
     */
    public function getBalanceMeterInfo($bid){
        $result = app('customer')->getBalanceMeterInfo($bid);

        return show(200,$result,'success');
    }

    /**
     * 获取水卡消费明细记录列表
     * @auth('Customer')
     * @param Request $request
     * @param('start_date','开始日期','require|date')
     * @param('end_date','结束日期','require|date')
     * @param('page','页码','require|number')
     * @param('size','条数','require|number')
     * @return \think\response\Json
     */
    public function getCardBillDetails(Request $request){
        $params = $request->get();

        $result = app('customer')->getCardBillDetails($params);

        return show(200,$result,'success');
    }

    /**
     * 获取水卡消费统计列表
     * @auth('Customer')
     * @param $year 查询年份统计 默认2020
     * @return \think\response\Json
     */
    public function getCardBillGroup( $year= '2020' ){

        //$params = $request->get();
        //$result = app('customer')->getConsumerDetails($params);
        $result = app('customer')->getCardBillGroup($year);

        return show(200,$result,'success');
    }

    /**
     * 充值水卡，生成预支付账单
     * @param('machine_key','秘钥','require')
     */
    public function cardRecharge(Request $request){
        $params = $request->post();
        $res = cache($params['machine_key']);

        //心跳检测未通过
        if($res == HeartStatus::UNPASSING){
            throw new HandleException([
                'msg' => '连接中断,请退出小程序重新扫描二维码',
                'error_code' => '90001'
            ]);
        }

        //支付页面超时
        if(!$res){
            throw new HandleException([
                'msg' => '支付超时,请退出小程序重新扫描二维码',
                'error_code' => '90001'
            ]);
        }

        Cache::clear($params['machine_key']);
        $result = app('card')->cardRecharge($params);


        return show(200,$result,'操作成功');
    }

    /**
     * 获取缴费明细列表
     * @auth('Customer')
     * @param('start_date','开始日期','date')
     * @param('end_date','结束日期','date')
     * @param('housing_fid','房源FID','number')
     * @param Request $request
     * @param int $page
     * @param int $size
     * @return \think\response\Json
     */
    public function getBills(Request $request,$page=1,$size=15){
        $params = $request->get();
        $result = app('customer')->getPaymentList($params,$page,$size);

        return show(200,$result,'success');
    }

    /**
     * 获取缴费记录详情
     * @auth('Customer')
     * @param('bid','记录信息ID','require')
     * @param $bid
     * @return \think\response\Json
     */
    public function getBillInfo($bid){
        $result = app('customer')->getPaymentInfo($bid);

        return show(200,$result,'success');
    }

    /**
     * 获取当前用户的水卡充值记录（微信线上）
     * @param int $page
     * @param int $size
     * @return \think\response\Json
     * @throws Exception
     * @throws \app\lib\exception\token\TokenException
     */
    public function getRechargeCardList($page=1,$size=15){

        $mid = Token::getCurrentMID();

        $result = app('account')->getRechargeCardList($mid,$page,$size);

        return show(200,$result,'success');
    }

    /**
     * 获取当前用户的水卡充值记录详情（微信线上）
     * @param('oid','订单id','require')
     * @param $oid
     * @return \think\response\Json
     */
    public function getRechargeCardDetail($oid){
        $result = app('account')->getRechargeCardDetail($oid);
        return show(200,$result,'success');
    }

}