<?php

use think\facade\Route;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-10-12
 * Time: 23:15
 */
Route::group('', function () {
    Route::group('admin', function () {
        Route::group('v1', function () {
            //region 员工
            Route::group('staff', function () {
                Route::post('', 'api/admin.v1.Staff/addStaff');
                Route::put('set_admin/:id', 'api/admin.v1.Staff/setAdmin')->middleware('PasswordConfirm');
                Route::put('set_status/:id', 'api/admin.v1.Staff/setStatus')->middleware('PasswordConfirm');
                Route::put(':id', 'api/admin.v1.Staff/editStaff');
                Route::delete(':id', 'api/admin.v1.Staff/deleteStaff');
                Route::get('', 'api/admin.v1.Staff/getList');
                Route::get('balance_log', 'api/admin.v1.Staff/getBalanceLog');

                Route::get('group','api/admin.v1.Staff/getStaffGroups');
                Route::post('group','api/admin.v1.Staff/addStaffGroup');
                Route::put('group/:sid','api/admin.v1.Staff/editStaffGroup');
                Route::delete('group/:sid','api/admin.v1.Staff/deleteStaffGroup');
            });
            // endregion

            //region 账户相关接口分组
            Route::group('user', function () {
                // 登陆接口
                Route::post('login', 'api/admin.v1.User/login');
                // 刷新令牌
                Route::get('refresh', 'api/admin.v1.User/refresh');
                // 查询自己拥有的权限
                Route::get('auths', 'api/admin.v1.User/getAllowedApis');
                // 注册一个用户
                Route::post('register', 'api/admin.v1.User/register');
                // 更新头像
                Route::put('avatar', 'api/admin.v1.User/setAvatar');
                // 查询自己信息
                Route::get('information', 'api/admin.v1.User/getInformation');
                // 用户更新信息
                Route::put('', 'api/admin.v1.User/update');
                // 修改自己密码
                Route::put('change_password', 'api/admin.v1.User/changePassword');
                //超管密码验证
                Route::post('super_password_valid', 'api/admin.v1.User/superPasswordValid');
                //公众号免密登录
                Route::get('wxmp_free_login', 'api/admin.v1.User/wxmpFreeLogin');

            });
            //endregion
            //region 管理类接口
            Route::group('manager', function () {
                // 查询所有权限组
                Route::get('group/all', 'api/admin.v1.Manager/getGroupAll');
                // 查询一个权限组及其权限
                Route::get('group/:id', 'api/admin.v1.Manager/getGroup');
                // 删除一个权限组
                Route::delete('group/:id', 'api/admin.v1.Manager/deleteGroup');
                // 更新一个权限组
                Route::put('group/:id', 'api/admin.v1.Manager/updateGroup');
                // 新建权限组
                Route::post('group', 'api/admin.v1.Manager/createGroup');
                // 查询所有可分配的权限
                Route::get('authority', 'api/admin.v1.Manager/authority');
                // 删除多个权限
                Route::post('remove', 'api/admin.v1.Manager/removeAuths');
                // 添加多个权限
                Route::post('/dispatch/patch', 'api/admin.v1.Manager/dispatchAuths');
                // 查询所有用户
                Route::get('users', 'api/admin.v1.Manager/getAdminUsers');
                // 修改用户密码
                Route::put('password/:uid', 'api/admin.v1.Manager/changeUserPassword');
                // 删除用户
                Route::delete(':uid', 'api/admin.v1.Manager/deleteUser');
                // 更新用户信息
                Route::put(':uid', 'api/admin.v1.Manager/updateUser');
            });

            Route::group('sysconfig', function () {

                Route::post('', 'api/admin.v1.SysConfig/setConfig');

                Route::get('', 'api/admin.v1.SysConfig/getList');
            });

            //endregion
            //region 后台设置小程序权限
            Route::group('member', function () {

                Route::get('', 'api/admin.v1.Member/getList');
                // 设置小程序权限
                Route::put('set/:id', 'api/admin.v1.Member/setAuthority')->middleware('PasswordConfirm');
                // 设置小程序用户真实姓名
                Route::put('set_name/:id', 'api/admin.v1.Member/setRealName');
            });
            //endregion
            //region 文章管理
            Route::group('article', function () {
                // 查询所有文章分类
                Route::get('category', 'api/admin.v1.ArtCategory/getCategories');
                // 新增文章分类
                Route::post('category', 'api/admin.v1.ArtCategory/create');
                // 编辑文章分类
                Route::put('category/:cid', 'api/admin.v1.ArtCategory/update');
                //删除文章分类
                Route::delete('category/:cid', 'api/admin.v1.ArtCategory/delete');

                // 查询所有文章
                Route::get('', 'api/admin.v1.Article/getArticles');
                //查询指定id文章
                Route::get(':aid', 'api/admin.v1.Article/getArticle');
                // 新增文章
                Route::post('', 'api/admin.v1.Article/create');
                // 编辑文章
                Route::put(':aid', 'api/admin.v1.Article/update');
                //删除文章
                Route::delete(':aid', 'api/admin.v1.Article/delete');
                //排序
                Route::put('sort/:aid', 'api/admin.v1.Article/sort');
            });
            //endregion
            //region 日志类接口
            Route::group('log', function () {
                Route::get('', 'api/admin.v1.Log/getLogs');
                Route::get('users', 'api/admin.v1.Log/getUsers');
                Route::get('search', 'api/admin.v1.Log/getUserLogs');
            });
            //endregion
            //上传文件类接口
            Route::post('file', 'api/admin.v1.File/postFile')->middleware('HasToken');
            //region 商户管理
            Route::group('customer', function () {
                //查询商户列表
                Route::get('', 'api/admin.v1.Customer/getList');
                //获取当前商户所有合同
                Route::get('contracts/:id', 'api/admin.v1.Customer/getCurrentContract');
                //获取当前商户的水电余额流水列表
                Route::get('balance/:id', 'api/admin.v1.Customer/getBalanceTurnover');
                //获取当前商户的表枚举
                Route::get('meter_enum/:id', 'api/admin.v1.Customer/getMeterEnum');
                //获取当前商户的账单流水列表
                Route::get('bill_flow', 'api/admin.v1.Customer/getBillFlow');
                //账单流水查询备注（商户缴费类型详情）
                Route::get('bill_flow_remark/:payment_record_id', 'api/admin.v1.Customer/getBillFlowRemark');

            });
            //endregion

            //region 合同管理
            Route::group('contract', function () {

                Route::get('', 'api/admin.v1.Contract/getList');
                //启动合同
                Route::put('exec/:cid', 'api/admin.v1.Contract/execContract');
                //终止合同
                Route::put('stop/:cid', 'api/admin.v1.Contract/stopContract');
                //合同状态
                Route::get('all_status', 'api/admin.v1.Contract/getAllStatus');
                //合同详情
                Route::get('info/:cid', 'api/admin.v1.Contract/getInfo');
            });
            //endregion

            //region 房源管理
            Route::group('housing', function () {
                //查询房源区域列表
                Route::get('area', 'api/admin.v1.Housing/getAreaList');
                //查询房源列表
                Route::get('', 'api/admin.v1.Housing/getList');
            });
            //endregion
            //region 故障报修
            Route::group('repair', function () {
                //查询报修列表
                Route::get('', 'api/admin.v1.Repair/getList');
                //处理报修信息
                Route::put('processing/:rid', 'api/admin.v1.Repair/processingRepair');
                //确认维修完成
                Route::put('complete/:rid', 'api/admin.v1.Repair/completeRepair');
                //取消报修单
                Route::put('cancel/:rid', 'api/admin.v1.Repair/cancelRepair');
            });
            //endregion
            //region 投诉反馈
            Route::group('feedback', function () {
                //查询反馈列表
                Route::get('', 'api/admin.v1.Feedback/getList');

                //确认反馈信息已读
                Route::put('complete/:id', 'api/admin.v1.Feedback/completeFeedback');

            });
            //endregion

            //region 账单查询(后台客户端共享)
            Route::group('account', function () {
                //根据商户id获取未交费应收单列表(含详情)
                Route::get('unpaid/:customer_fid', 'api/admin.v1.Account/getUnPaidBillByCid')->middleware('IpCheck');
                //近一个月的充值与消费记录
                Route::get('before_record/:customer_fid', 'api/admin.v1.Account/getBalanceAccount');
                //获取可退款客户信息
                Route::get('balance_refund/:customer_fid', 'api/admin.v1.Account/getCanRefundCustomerInfo');

                //账单数据查询(主页)
                Route::get('bill_statistics', 'api/admin.v1.Account/getChargeStatistics');
                //账单流水查询(子页)
                Route::get('bill_flow', 'api/admin.v1.Account/getBillFlow');
                //账单流水查询备注（商户缴费类型详情）
                Route::get('bill_flow_remark/:payment_record_id', 'api/admin.v1.Account/getBillFlowRemark');
                //每日对账
                Route::get('bill_proofread', 'api/admin.v1.Account/getBillProofreading');
            });
            //endregion
            /**
             * 例子
             */
            Route::group('book', function () {
                // 查询所有图书
                Route::get('', 'api/admin.v1.Book/getBooks');

                Route::get('test_meter', 'api/admin.v1.Book/testMeter');

            });

            /**
             * 财务统计
             */
            Route::group('payment', function () {
                //流水账
                Route::get('accounts', 'api/admin.v1.Payment/getAccounts');
                //流水详情
                Route::get('account_detail/:rid', 'api/admin.v1.Payment/getAccountDetail');
            });

            /**
             * 首页
             */
            Route::group('index', function () {

                Route::get('housing_statistics', 'api/admin.v1.Index/housingStatistics');

                Route::get('contract_statistics', 'api/admin.v1.Index/contractStatistics');

                Route::get('customer_statistics', 'api/admin.v1.Index/customerStatistics');

                Route::get('serve_message_count', 'api/admin.v1.Index/serveMessageCount');
            })->middleware('HasToken');


            //region 翻动相册、通告接口
            Route::group('adv', function () {
                //获取列表
                Route::get('', 'api/admin.v1.Adv/getList');
                //新增
                Route::post('', 'api/admin.v1.Adv/createAdv');
                //修改翻动相册、通告
                Route::put(':id', 'api/admin.v1.Adv/updateAdv');
                //获取一条翻动相册、通告数据
                Route::get(':id', 'api/admin.v1.Adv/getAdv');
                //删除
                Route::delete(':id', 'api/admin.v1.Adv/delAdv');

                Route::put('video_enable/:aid', 'api/admin.v1.Adv/videoEnable');

            });

            Route::group('wxmp', function () {
                Route::get('get_and_update_fans', 'api/admin.v1.WeixinMP/getAllFansAndUpdate');
            });
            //endregion
        });
    })->middleware(['Auth']);

})->middleware(['ReflexValidate'])->allowCrossDomain();//->domain('api');