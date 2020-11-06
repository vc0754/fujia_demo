<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-10-12
 * Time: 23:15
 */

use think\facade\Route;
Route::group('', function () {
    /**
     * 小程序接口
     */
    Route::group('api', function () {
        Route::group('v1', function () {

            Route::group('adv',function (){
                Route::get('banner','api/api.v1.Adv/getBanner');
                Route::get('notice','api/api.v1.Adv/getNotice');
                Route::get('video','api/api.v1.Adv/getVideo');
            });

            // endregion
            //公众号验证接口
            // Route::get('check_wxmp', 'api/api.v1.Wechat/wxAuth');

            //region 商户
            Route::group('customer',function (){
                //查询当前商户信息
                Route::get('info', 'api/api.v1.Customer/getInfo');
                //获取客户房源的水电表信息
                Route::get('meter_detail', 'api/api.v1.Customer/getMeterDetail');


                //查询报修列表
                Route::get('repair_list', 'api/api.v1.Customer/getRepairList');
                //添加报修信息
                Route::post('repair_add', 'api/api.v1.Customer/addRepair');
                //取消报修申请
                Route::put('repair_cancel/:rid', 'api/api.v1.Customer/cancelRepair');
                //评价报修
                Route::put('repair_evaluation/:rid', 'api/api.v1.Customer/evaluationRepair');
                //获取报修详情
                Route::get('repair_info/:rid','api/api.v1.Customer/getRepairInfo');


                //查询反馈列表
                Route::get('feedback_list', 'api/api.v1.Customer/getFeedbackList');
                //添加反馈信息
                Route::post('feedback_add', 'api/api.v1.Customer/addFeedback');
                //反馈信息详情
                Route::get('feedback_info/:f_id', 'api/api.v1.Customer/getFeedbackInfo');

                //获取客户当前拥有的房源信息
                Route::get('housing', 'api/api.v1.Customer/getHousing');
                //获取客户拥有过的房源信息
                Route::get('all_housing', 'api/api.v1.Customer/getAllHousing');

                //获取客户的所有合同
                Route::get('contract', 'api/api.v1.Customer/getCustomerContract');
                //获取客户合同详情
                Route::get('contract_info/:cid', 'api/api.v1.Customer/getCustomerContractInfo');


            });
            //endregion
            //region 账单
            Route::group('account',function(){
                //查询当前商户所有未缴费账单
                Route::get('unpaid', 'api/api.v1.Account/getUnpaidBill');
                //查询当前商户账单列表
                Route::get('all', 'api/api.v1.Account/getBill');
                //获取当前商户全部待缴总额与本月待缴总额
                Route::get('unpaid_total', 'api/api.v1.Account/getPendingStatistics');
                //缴费单据-预支付账单
                Route::post('pre_bill', 'api/api.v1.Account/prePayAccount');

                //获取缴费明细列表
                Route::get('get_bills', 'api/api.v1.Account/getBills');
                //获取缴费明细详情
                Route::get('bills_info/:bid', 'api/api.v1.Account/getBillInfo');


            });
            //endregion
            //region 高级权限
            Route::group('manager', function () {

                //获取分区类型集合
                Route::get('partition', 'api/api.v1.Manager/getPartition');
                //获取客户的所有合同
                Route::get('contract', 'api/api.v1.Manager/getContract');
                //获取所有将到期或已到期未续约合同
                Route::get('maturity_contract', 'api/api.v1.Manager/getMaturityContract');
                //获取客户合同详情
                Route::get('contract_info/:cid', 'api/api.v1.Manager/getContractInfo');

            });


            //region 维修人员
            Route::group('maintainer',function (){
                //获取报修事务列表
                Route::get('repair/:status','api/api.v1.Maintainer/getRepairList');
                //报价
                Route::put('repair/quotedPrice','api/api.v1.Maintainer/quotedPrice');
                //完成报修
                Route::put('repair/complete','api/api.v1.Maintainer/completeRepair');
                //获取报修信息详情
                Route::get('repair/detail/:id','api/api.v1.Maintainer/getRepairDetail');

            });
            //endregion

            //支付
            Route::post('pay', 'api/api.v1.Pay/pay');

            Route::get('wxmp/authorize', 'api/api.v1.Wechat/authorizeCallback');

            Route::group('article',function (){
                //获取文章分类 默认3条
                Route::get('get_category', 'api/api.v1.Article/getCategory');
                //根据文章类型获取列表
                Route::get('get_list/:category_id', 'api/api.v1.Article/getListByCategoryID');
                //根据ID 获取文章
                Route::get('get_article/:id', 'api/api.v1.Article/getArticleByID');
            });
        });

    })->middleware(['AppAuth:fu_jia']);
})->middleware(['ReflexValidate'])->allowCrossDomain();//->domain('api');