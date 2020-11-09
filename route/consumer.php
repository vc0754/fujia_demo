<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-10-12
 * Time: 23:16
 */

use think\facade\Route;
Route::group('', function () {
    Route::group('consumer', function () {
        Route::group('v1',function (){
            Route::group('client', function () {
                //线上缴费
                Route::post('pay','api/consumer.v1.Client/pay');

                //轮询接口
                Route::post('query_order','api/consumer.v1.Client/queryOrder');

                //账单缴费
                Route::post('paid_from_bills','api/consumer.v1.Client/paidFromBills');

                //账单流水查询
                Route::get('bill_flow','api/consumer.v1.Client/getBillFlow');

                //账单流水查询备注（商户缴费类型详情）
                Route::get('bill_flow_remark/:payment_record_id','api/consumer.v1.Client/getBillFlowRemark');

                //账单数据统计
                Route::get('bill_statistics','api/consumer.v1.Client/getChargeStatistics');

                //每日对账
                Route::get('bill_proofread','api/consumer.v1.Client/getBillProofreading');

                //获取待缴费商户列表
                Route::get('get_customer_list', 'api/consumer.v1.Client/getCustomerList');

                //获取所有已缴费的单据列表
                Route::get('receipt_list', 'api/consumer.v1.Client/getReceipt');
            });

            Route::group('gateway', function () {
                //同步数据接口
                Route::post('sync', 'api/consumer.v1.Gateway/syncData');
                //每月账单
                Route::post('monthly', 'api/consumer.v1.Gateway/getMonthlyAccount');
                //新商户入驻账单
                Route::post('new_account', 'api/consumer.v1.Gateway/getNewCustomerAccount');
                //客户退费账单
                Route::post('refund_account', 'api/consumer.v1.Gateway/getCustomerRefundAccount');

            });

            Route::group('wechat',function (){

                Route::get('get_auth_token','api/consumer.v1.WeChat/getAuthToken');

                Route::rule('process_event', 'api/consumer.v1.WeChat/eventProcess');
            });
        });

    })->middleware(['IpCheck']);
})->middleware(['ReflexValidate'])->allowCrossDomain();