<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/12/11
 * Time: 11:09
 */

namespace app\api\service;


use app\api\dto\account\Operator;
use app\api\dto\account\PaymentDetails;
use app\api\dto\account\Receivables;
use app\api\model\Bill;
use app\api\model\Customer;
use app\api\model\DinningBill;
use app\api\model\Machine;
use app\api\model\OnlineOrder;
use app\lib\enum\BillSource;
use app\lib\enum\CardCommEnum;
use app\lib\enum\OrderStatus;
use app\lib\enum\PayStatus;
use app\lib\enum\TerminalType;
use app\lib\enum\OnlineOrderCardStatus;
use app\lib\exception\common\OrderException;
use app\lib\exception\common\ParameterException;
use LinCmsTp5\admin\model\LinLog;
use think\facade\Request;
use think\facade\Response;


class WxNotify
{

    public function  ThirdNotifyProcess($result){

        if($result){
            if(array_key_exists('mch_orderid' ,$result)){

                $thirdOrderId = '';
                if(array_key_exists('orderid' ,$result)){
                    $thirdOrderId = $result['orderid'];
                }

                return $this->OrderResultProcess($result['mch_orderid'],$thirdOrderId);
            }else{
                return false;
            }
        }else{
            return true;
        }
    }


    public function CCBNotifyProcess($orderNO,$thirdOrderId = '',$expand = []){

        if($orderNO == ''){
            return false;
        }else{
            return $this->OrderResultProcess($orderNO,$thirdOrderId,$expand);
        }
    }


    private function OrderResultProcess($orderNO,$thirdOrderId,$expand = []){
        //todo: 处理支付订单结果
        $payOrder =  OnlineOrder::where('order_no','=',$orderNO)->find();
        if(!$payOrder){
            throw new ParameterException([
                'msg' => '传入的支付单ID有误'
            ]);
        }

        if($payOrder->order_status != PayStatus::UNPAID){
            if($payOrder->order_status == PayStatus::PAID){
                throw new OrderException([
                    'msg' => '该订单已被支付过'
                ]);
            }
            if($payOrder->order_status == PayStatus::OVERTIME){
                throw new OrderException([
                    'msg' => '该订单已过期'
                ]);
            }
        }

        $temp['third_orderid'] = $thirdOrderId;
        if(isset($expand['ccb_orderid'])){
            $temp['ccb_orderid'] = $expand['ccb_orderid'];
        }
        $payOrder->save($temp);

        //食堂订单处理
        if($payOrder->bill_source == BillSource::DINNING_BILL){
            return app('dinning')->finishOnlinePay($payOrder->id);
        }

        $remark = json_decode($payOrder->bill_remark,true);
        $customer = Customer::where('fid','=',$remark['customer_fid'])->find();
        if((!$customer)&&($payOrder->bill_source!=BillSource::WATERCARD)){
            throw new ParameterException([
                'msg' => '找不到商户信息'
            ]);
        }

        $params = [
            'online_wechat'     => $payOrder->payment_amount,
            'offline_cash'      => 0.00,
            'offline_wechat'    => 0.00,
            'offline_alipay'    => 0.00,
            'offline_by_card'   => 0.00,
            'online_banking'    => 0.00,
            'pay_order_id'      => $payOrder->order_no
        ];


        $operator = new Operator([
            'terminal_type' => TerminalType::MINIPRO,
            'operator_id' => $payOrder->member_id,
            'client_no' => ''
        ]);

        //单据
        if($payOrder->bill_source == BillSource::BILL){
            //$params['fids'] = $remark['bill_fids'];
            $filter[] = ['fid', 'IN', $remark['bill_fids']];
            $list = Bill::where($filter)->select();
            foreach ($list as $k=>$v) {
                $params['bills'][$k]['fid'] = $v->fid;
                $params['bills'][$k]['amount'] = $v->unpaid_balance;
            }

            $params['charge_time'] = time();
            $receivables = new Receivables($params);
            app('account')->createReceivables($customer,$receivables,$operator);
        }
        //水电充值
        elseif($payOrder->bill_source == BillSource::RECHARGE){
            $details = new PaymentDetails($params);

            app('account')->rechargeBalance($customer,$details,$operator);
        }elseif ($payOrder->bill_source == BillSource::WATERCARD){

            $payOrder->save(['order_status' => OrderStatus::PAID,'card_status'=>OnlineOrderCardStatus::WAITING]);

            //发送指令
            //获取订单备注信息 水卡充值前需传入往备注信息里写入充值机器号
            $remark = json_decode($payOrder->bill_remark,true);
            if(array_key_exists('machine_no',$remark)){
                $machine = Machine::where('machine_no',$remark['machine_no'])->find();
                if(!$machine){
                    //记录异常
                    $data = [
                        'message' =>  '水卡充值未找到机器号',
                        'user_id' => $payOrder->member_id,
                        'user_name' => '小程序用户',
                        'status_code' => Response::getCode(),
                        'method' => Request::method(),
                        'path' => Request::path(),
                        'authority' => ''
                    ];
                    LinLog::create($data);
                }
            }else{
                //记录异常
                $data = [
                    'message' =>  '水卡充值未记录机器号',
                    'user_id' => $payOrder->member_id,
                    'user_name' => '小程序用户',
                    'status_code' => Response::getCode(),
                    'method' => Request::method(),
                    'path' => Request::path(),
                    'authority' => ''
                ];
                LinLog::create($data);
            }
            $commandData = [$payOrder->payment_amount,$payOrder->order_no];
            //发送指令
            app('card')->commandSend(CardCommEnum::RECHARGE,$remark['machine_no'],$commandData);
        }else{

        }
        return true;
    }

}