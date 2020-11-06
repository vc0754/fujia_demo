<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-02
 * Time: 18:11
 */

namespace app\api\model;



use app\lib\enum\ListBillType;
use think\Db;
use think\helper\Time;

class TimingBill extends MyBaseModel
{
    protected  $table = 't_timing_bill';

    public static  function getDetailListByCustomer($customer_fid){
        $time =  date('Y-m-d H:i:s',Time::daysAgo(30));

        $now =  date('Y-m-d H:i:s',time());

        return self::where('customer_fid',$customer_fid)->where('create_time','between',[$time,$now])->select();
    }

    public function housingMeter(){
        return $this->belongsTo('HousingMeter','meter_id','meter_id');
    }

    public static function statisticsToMonthsByMID($mid){
        list($start,$end) = Time::month();
        $statDate = date('Y-m-d H:i:s',strtotime(" -12 month", $start));
        $endDate = date('Y-m-d H:i:s',$end);

        $res = Db::name('t_timing_bill')
            ->fieldRaw("date_format(create_time, '%Y-%m') `date`,SUM(quantity) total_quantity")
            ->where('meter_id',$mid)
            ->where('list_bill_type',ListBillType::DEDUCT)
            ->where('create_time','between',[$statDate,$endDate])
            ->group('`date`')
            ->cache(7200)
            ->select();

        return $res;

    }

    public static function statisticsToDaysByMID($where,$page,$size){
        $output = [
            'total_amount'=>0,
            'total_degree'=>0,
            'data' => []
        ];

        $totalAmount = self::where($where)->sum('amount');
        $totalDegree = self::where($where)->sum('quantity');
        $result = self::where($where)->field('create_time,price,quantity,amount,meter_degree,customer_fid')->order('create_time','desc')->paginate($size,false,['page'=>$page]);
        if(!$result->isEmpty()){
            $result = $result->toArray();
            $result['data'] = array_map(function($v){
               $v['customer_name'] = $v['customer_fid'] ? Customer::where('fid',$v['customer_fid'])->value('name') : '';
               return $v;
            },$result['data']);
        }
        $output['total_amount'] =  number_format($totalAmount,2);
        $output['total_degree'] =  number_format($totalDegree,2);
        $output['data'] = $result;
        return $output;
    }

}