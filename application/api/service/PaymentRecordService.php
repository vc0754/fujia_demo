<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/27
 * Time: 11:35
 */

namespace app\api\service;


use app\api\model\Bill;
use app\api\model\BillDetail;
use app\api\model\Customer;
use app\api\model\Housing;
use app\api\model\PaymentRecord;
use app\api\model\PaymentRecordDetail;
use app\api\model\PaymentRecordDetailSub;
use app\lib\enum\BillSource;
use app\lib\enum\TerminalType;
use app\lib\exception\common\ParameterException;
use think\Db;

class PaymentRecordService
{
    //账单流水
    public function getBillFlow($filter,$page,$size,$arrWhere = []){

        if(!empty($arrWhere)){
            $fids = Customer::where($arrWhere)->column('fid');
            $filter[] = ['customer_fid','IN',$fids];
        }
        $result = PaymentRecord::with('customer')->where($filter)->order('create_time desc')->paginate($size,false,['page'=>$page])->toArray();

        if(!empty($result['data'])){

            foreach ($result['data'] as $key=>$value){

                $data[$key]['id'] = $value['id'];
                $data[$key]['payment_no'] = $value['payment_no'];
                $data[$key]['customer_name'] = $value['customer']['name'];
                $data[$key]['bill_source'] = $value['bill_source'];
                $data[$key]['total'] = $value['total_amount'];
                $data[$key]['online_wechat'] = $value['online_wechat'];
                $data[$key]['offline_wechat'] = $value['offline_wechat'];
                $data[$key]['alipay'] = $value['offline_alipay'];
                $data[$key]['cash'] = $value['offline_cash'];
                $data[$key]['online_banking'] = $value['online_banking'];
                $data[$key]['card'] = $value['offline_by_card'];
                $data[$key]['flow_time'] = $value['charge_time'];

                if($value['bill_source'] == BillSource::BILL){
                    $data[$key]['bill_source_title'] = '商户缴费';
                }elseif ($value['bill_source'] == BillSource::RECHARGE){
                   if($value['total_amount'] > 0){
                       $data[$key]['bill_source_title'] = '余额充值';
                   }else{
                       $data[$key]['bill_source_title'] = '余额退款';
                   }
                }elseif($value['bill_source'] == BillSource::WATERCARD){
                    if($value['total_amount'] > 0){
                        $data[$key]['bill_source_title'] = '水卡充值';
                    }else{
                        $data[$key]['bill_source_title'] = '水卡退款';
                    }
                }else{
                    $data[$key]['bill_source_title'] = '';
                }
            }
            $result['data'] = $data;
        }



        return $result;

    }

    //账单流水（商户缴费详情）-后台
    public function getBillFlowRemarkForAdmin($payment_record_id){
        $output[] = [
            'housing_name' => '',
            'housing_fid' => '',
            'detail' => []
        ];
        $list = PaymentRecordDetail::where('payment_record_id','=',$payment_record_id)->field('detail_data')->select();

        foreach ($list as $k=>$v){
            $temp = json_decode($v->detail_data,true);
            $output[$k] = [
                'housing_name' => $temp['housing_name'],
                'housing_fid' => $temp['housing_fid']
            ];
            foreach ($temp['details_data'] as $key=>$item){
                $output[$k]['detail_data'][$key] = [
                    'charge_name' => $item['charge_name'],
                    'paid_balance' => $item['paid_balance']
                ];
            }
        }
        return $output;
    }

    //账单流水（商户缴费详情）-客户端
    public function getBillFlowRemarkForClient($payment_record_id){
        $output[] = [
            'housing_name' => '',
            'housing_fid' => '',
            'detail' => []
        ];
        $list = PaymentRecordDetail::where('payment_record_id','=',$payment_record_id)->field('detail_data')->select();

        foreach ($list as $k=>$v){
            $temp = json_decode($v->detail_data,true);
            $output[$k] = [
                'housing_name' => $temp['housing_name'],
                'housing_fid' => $temp['housing_fid']
            ];
            foreach ($temp['details_data'] as $key=>$item){
                $output[$k]['detail'][$key] = [
                    'charge_name' => $item['charge_name'],
                    'paid_balance' => $item['paid_balance']
                ];
            }
        }
        return $output;
    }

    //打印缴费记录-客户端
    public function getPaymentRecordToPrint($payment_record_id){

        $value = PaymentRecord::with('customer')->where('id','=',$payment_record_id)->find();

        $output = [
            'id' => $value['id'],
            'payment_no' => $value['payment_no'],
            'customer_name' => $value['customer']['name'],
            'bill_source' => $value['bill_source'],
            'total' => $value['total_amount'],
            'online_wechat' => $value['online_wechat'],
            'offline_wechat' => $value['offline_wechat'],
            'alipay' => $value['offline_alipay'],
            'cash' => $value['offline_cash'],
            'online_banking' => $value['online_banking'],
            'card' => $value['offline_by_card'],
            'flow_time' => $value['charge_time'],
        ];

        if($value['bill_source'] == BillSource::BILL){
            $output['bill_source_title'] = '商户缴费';
        }elseif ($value['bill_source'] == BillSource::RECHARGE){
            if($value['total_amount'] > 0){
                $output['bill_source_title'] = '余额充值';
            }else{
                $output['bill_source_title'] = '余额退款';
            }
        }elseif($value['bill_source'] == BillSource::WATERCARD){
            if($value['total_amount'] > 0){
                $output['bill_source_title'] = '水卡充值';
            }else{
                $output['bill_source_title'] = '水卡退款';
            }
        }else{
            $output['bill_source_title'] = '';
        }

        $list = PaymentRecordDetail::where('payment_record_id','=',$payment_record_id)->field('detail_data,bill_fid')->select();

        //$temp = $list->toArray();
        //$detailList = BillDetail::where('bill_fid','IN',array_column($temp,'bill_fid'))->column('paid_balance','fid');

        foreach ($list as $k=>$v){
            $temp = json_decode($v->detail_data,true);
            $output['detail_data'][$k] = [
                'housing_name' => $temp['housing_name'],
                'housing_fid' => $temp['housing_fid'],
                'type' => $temp['type']
            ];
            foreach ($temp['details_data'] as $key=>$item){
                $output['detail_data'][$k]['detail'][$key] = [
                    'charge_fid' => $item['charge_fid'],
                    'charge_name' => $item['charge_name'],
                    'paid_balance' => $item['paid_balance'],
                    'unpaid_balance' => $item['unpaid_balance'],
                    'paid_balance_total' => bcsub($item['total_amount'],$item['unpaid_balance'],2),
                    'total_amount' => $item['total_amount'],
                    'create_time' => $item['create_time'],
                    'remark' => $item['remark']
                ];
            }
        }

        return $output;
    }


    //账单流水（商户缴费详情）
    public function getBillFlowRemark($payment_record_id,$receiptHeader = false){

        $billFids = PaymentRecordDetail::where('payment_record_id','=',$payment_record_id)->column('bill_fid');

        $arrTemp = Bill::with(['detail'=>function($query){
            $query->with(['chargeType']);
        },'housing'])->where('fid','IN',$billFids)->select()->toArray();

        if(empty($arrTemp)){
            return [];
        }

        $temp = [];
        foreach ($arrTemp as $ak=>$av){
            $temp[$ak]['housing_fid'] = $av['housing_fid'];
            $temp[$ak]['housing_name'] = $av['housing']['name'];
            $temp[$ak]['bill_create_time'] = $av['create_time'];
            $temp[$ak]['paid_balance'] = $av['paid_balance'];
            $temp[$ak]['unpaid_balance'] = $av['unpaid_balance'];
            $temp[$ak]['type'] = $av['type'];
            $detailTemp = [];
            $tempBillTotal = 0;
            $tempPaidBillTotal = 0;
            foreach ($av['detail'] as $k=>$v){
                $detailTemp[$k] = [
                    'amount' => $v['amount'],
                    'paid_balance' => $v['paid_balance'],
                    'charge_name' => $v['charge_type']['name'],
                    'create_time' => $v['create_time'],
                    'remark' => $v['remark']
                ];

                $tempBillTotal = $tempBillTotal+$v['amount'];
                $tempPaidBillTotal = $tempPaidBillTotal+$v['paid_balance'];
            }

            //$tempBillTotal = array_sum(array_column($detailTemp,'amount'));
            $temp[$ak]['bill_total'] = number_format($tempBillTotal,2);
            $temp[$ak]['bill_paid_total'] = number_format($tempPaidBillTotal,2);
            $temp[$ak]['detail'] = $detailTemp;
        }


        if($receiptHeader){
            $value = PaymentRecord::with('customer')->where('id','=',$payment_record_id)->find();

            $data['id'] = $value['id'];
            $data['payment_no'] = $value['payment_no'];
            $data['customer_name'] = $value['customer']['name'];
            $data['bill_source'] = $value['bill_source'];
            $data['total'] = $value['total_amount'];
            $data['online_wechat'] = $value['online_wechat'];
            $data['offline_wechat'] = $value['offline_wechat'];
            $data['alipay'] = $value['offline_alipay'];
            $data['cash'] = $value['offline_cash'];
            $data['online_banking'] = $value['online_banking'];
            $data['card'] = $value['offline_by_card'];
            $data['flow_time'] = $value['charge_time'];

            if($value['bill_source'] == BillSource::BILL){
                $data['bill_source_title'] = '商户缴费';
            }elseif ($value['bill_source'] == BillSource::RECHARGE){
                if($value['total_amount'] > 0){
                    $data['bill_source_title'] = '余额充值';
                }else{
                    $data['bill_source_title'] = '余额退款';
                }
            }elseif($value['bill_source'] == BillSource::WATERCARD){
                if($value['total_amount'] > 0){
                    $data['bill_source_title'] = '水卡充值';
                }else{
                    $data['bill_source_title'] = '水卡退款';
                }
            }else{
                $data['bill_source_title'] = '';
            }
            $data['detail'] = $temp;
            return $data;
        }

        return $temp;
    }






    /**
     * 账单数据统计
     * @param $start_date   开始日期 eg.2020-07-29
     * @param $end_date     结束日期
     * @param $page         当前页码
     * @param $size         条数
     * @param $operatorId   操作员ID
     * @return array
     * @throws ParameterException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getChargeStatistics($start_date,$end_date,$page,$size,$operatorId = 0){

        $result = $this->getPage($start_date,$end_date,$page,$size);

        if(empty($result['filter'])){
            unset($result['filter']);
            $result['data'] = [];
            return $result;
        }

        foreach ($result['filter'] as $key=>$value){

            //$arrWhere = [['charge_time','between time',$value],['operator_id','=',$operatorId],['terminal_type','=',TerminalType::CLIENT]];

            $arrWhere[0] = ['charge_time','between time',$value];

            if($operatorId > 0){
                $arrWhere[1] = ['operator_id','=',$operatorId];
                $arrWhere[2] = ['terminal_type','=',TerminalType::CLIENT];
            }

            $temp = Db::name('t_payment_record')->fieldRaw(
                "COUNT( DISTINCT customer_fid) num,
                SUM(total_amount) total,
                SUM(case when total_amount>0 then total_amount else 0 end) total_receive,
                SUM(case when total_amount<0 then total_amount else 0 end) total_refund,
                SUM(online_wechat) online_wechat,
                SUM(offline_wechat) wechat,
                SUM(offline_alipay) alipay,
                SUM(offline_by_card) card,
                SUM(online_banking) online_banking,
                SUM(case when offline_cash>0 then offline_cash else 0 end) cash,
                SUM(case when offline_cash<0 then offline_cash else 0 end) refund,
                date_format(charge_time, '%Y-%m-%d') date_title"
            )->where($arrWhere)->find();

            $temp['total'] = $temp['total'] === null ? '0.00' : $temp['total'];
            $temp['total_receive'] = $temp['total_receive'] === null ? '0.00' : $temp['total_receive'];
            $temp['total_refund'] = $temp['total_refund'] === null ? '0.00' : $temp['total_refund'];
            $temp['online_wechat'] = $temp['online_wechat'] === null ? '0.00' : $temp['online_wechat'];
            $temp['wechat'] = $temp['wechat'] === null ? '0.00' : $temp['wechat'];
            $temp['alipay'] = $temp['alipay'] === null ? '0.00' : $temp['alipay'];
            $temp['card'] = $temp['card'] === null ? '0.00' : $temp['card'];
            $temp['cash'] = $temp['cash'] === null ? '0.00' : $temp['cash'];
            $temp['online_banking'] = $temp['online_banking'] === null ? '0.00' : $temp['online_banking'];
            $temp['refund'] = $temp['refund'] === null ? '0.00' : $temp['refund'];
            $temp['date_title'] = $temp['date_title'] === null ?  date('Y-m-d',strtotime($value[0])) : $temp['date_title'];

            $data[] = $temp;


        }
        $result['data'] = $data;
        unset($result['filter']);
        return $result;
    }

    public function getChargeStatisticsV2($start_date,$end_date,$page,$size,$operatorId = 0){
        $result = PaymentRecord::where('charge_time', 'between time', [$start_date,$end_date])
            ->field('substring(charge_time,1,10) as date_title,
                SUM(total_amount) total,
                SUM(online_wechat) online_wechat,
                SUM(offline_wechat) wechat,
                SUM(offline_alipay) alipay,
                SUM(offline_by_card) card,
                SUM(online_banking) online_banking,
                SUM(offline_cash) cash')
            ->group(['substring(charge_time,1,10)'])
            ->order('charge_time desc')
            ->paginate($size,false,['page'=>$page]);
        return $result;
    }


    public function getBillProofreading($arrWhere){
        $temp = Db::name('t_payment_record')->fieldRaw(
            "SUM(case when total_amount>=0 then total_amount else 0 end) total_revenue,
                SUM(case when total_amount<0 then total_amount else 0 end) total_refund,
                SUM(offline_wechat) wechat,
                SUM(offline_alipay) alipay,
                SUM(offline_by_card) card,
                SUM(case when offline_cash>0 then offline_cash else 0 end) cash,
                SUM(case when offline_cash<0 then offline_cash else 0 end) refund,
                SUM(case when bill_source=".BillSource::BILL." then total_amount else 0 end) bill_amount,
                SUM(case when bill_source=".BillSource::RECHARGE." and total_amount>0 then total_amount else 0 end) meter_balance_revenue,
                SUM(case when bill_source=".BillSource::RECHARGE." and total_amount<0 then total_amount else 0 end) meter_balance_refund,
                SUM(case when bill_source=".BillSource::WATERCARD." and total_amount>0 then total_amount else 0 end) water_card_revenue,
                SUM(case when bill_source=".BillSource::WATERCARD." and total_amount<0 then total_amount else 0 end) water_card_refund"
        )->where($arrWhere)->find();


        foreach($temp as $key=>$value){
            $temp[$key] = ($value === null) ? '0.00' : $value;
        }
        return $temp;
    }

    public function getBillProofreadingV2($arrWhere){
        $temp = Db::name('t_payment_record')->fieldRaw("SUM(total_amount) total,
        SUM(case when total_amount>0 then total_amount else 0 end) total_receive,
        SUM(case when total_amount<0 then total_amount else 0 end) total_refund,
        SUM(online_wechat) online_wechat,
        SUM(case when online_wechat>0 then online_wechat else 0 end) online_wechat_receive,
        SUM(case when online_wechat<0 then online_wechat else 0 end) online_wechat_refund,
        SUM(offline_wechat) offline_wechat,
        SUM(case when offline_wechat>0 then offline_wechat else 0 end) offline_wechat_receive,
        SUM(case when offline_wechat<0 then offline_wechat else 0 end) offline_wechat_refund,
        SUM(offline_alipay) alipay,
        SUM(case when offline_alipay>0 then offline_alipay else 0 end) alipay_receive,
        SUM(case when offline_alipay<0 then offline_alipay else 0 end) alipay_refund,
        SUM(offline_by_card) card,
        SUM(case when offline_by_card>0 then offline_by_card else 0 end) card_receive,
        SUM(case when offline_by_card<0 then offline_by_card else 0 end) card_refund,
        SUM(offline_cash) cash,
        SUM(case when offline_cash>0 then offline_cash else 0 end) cash_receive,
        SUM(case when offline_cash<0 then offline_cash else 0 end) cash_refund,
        SUM(online_banking) online_banking,
        SUM(case when online_banking>0 then online_banking else 0 end) online_banking_receive,
        SUM(case when online_banking<0 then online_banking else 0 end) online_banking_refund,
        SUM(case when bill_source=".BillSource::BILL." then total_amount else 0 end) bill_amount,
        SUM(case when bill_source=".BillSource::RECHARGE." and total_amount>0 then total_amount else 0 end) meter_balance_revenue,
        SUM(case when bill_source=".BillSource::RECHARGE." and total_amount<0 then total_amount else 0 end) meter_balance_refund,
        SUM(case when bill_source=".BillSource::WATERCARD." and total_amount>0 then total_amount else 0 end) water_card_revenue,
        SUM(case when bill_source=".BillSource::WATERCARD." and total_amount<0 then total_amount else 0 end) water_card_refund")->where($arrWhere)->find();


        foreach($temp as $key=>$value){
            $temp[$key] = ($value === null) ? '0.00' : $value;
        }
        return $temp;
    }









    private function getPage($start_time,$end_time,$page,$size,$desc_sort = true)
    {
        $start_time = strtotime($start_time);
        $end_time = strtotime($end_time);

        if($start_time>$end_time){
            throw new ParameterException([
                'msg' => '日期格式错误'
            ]);
        }

        $days = round(($end_time-$start_time)/3600/24)+1;

        $temp = $days;
        $count = $size;
        $start = ($page-1)*$size;
        $count = ($temp-$start) >= $count ? $count : ($temp-$start);

        $i=0;
        while ($start_time<=$end_time){
            $arr[$i] = [date('Y-m-d H:i:s',$start_time),date('Y-m-d 23:59:59',$start_time)];
            $start_time = strtotime('+1 day',$start_time);
            $i++;
        }

        if($desc_sort){
            krsort($arr);
        }
        $filter = array_slice($arr,$start,$count);

        $result = [
            'total' => $days,
            'per_page' => $size,
            'current_page' => intval($page),
            'last_page' => ceil($days/$size),
            'filter' => $filter
        ];

        return $result;
    }


}