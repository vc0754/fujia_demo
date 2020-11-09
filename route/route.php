<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\facade\Route;

Route::group('', function () {

    Route::group('adv',function (){
        Route::get('banner','api/api.v1.Adv/getBanner');
        Route::get('notice','api/api.v1.Adv/getNotice');
        Route::get('video','api/api.v1.Adv/getVideo');
    });

    Route::group('article',function (){
        //获取文章分类 默认3条
        Route::get('get_category', 'api/api.v1.Article/getCategory');
        //根据文章类型获取列表
        Route::get('get_list/:category_id', 'api/api.v1.Article/getListByCategoryID');
        //根据ID 获取文章
        Route::get('get_article/:id', 'api/api.v1.Article/getArticleByID');
    });

    //第三方支付回调
    Route::post('pay/third_notify', 'api/api.v1.Pay/receiveThirdNotify');

    //建行支付回调
    Route::post('pay/ccb_notify','api/api.v1.Pay/ccbNotify');

    Route::group('cron',function(){
        //定时接口-每日推送缴费单
        Route::get('daily_charge', 'api/cron.Business/chargeAndPushDailyAccounts');

        //定时接口-合同通知
        Route::get('contract_notice', 'api/cron.Notice/contractNotice');
    })->middleware(['IpCheck']);
    
    Route::group('api', function () {
        Route::group('v1', function () {
            //region 微信用户
            Route::group('member', function () {
                // 颁布小程序令牌
                Route::post('login', 'api/api.v1.Member/login');
                // 获取用户微信信息
                Route::post('info','api/api.v1.Member/getUserInfo');
                // 获取微信绑定手机号码
                Route::post('phone','api/api.v1.Member/getPhoneNumber');
                // 刷新小程序令牌
                Route::get('refresh', 'api/api.v1.Member/refresh');
                // 查询所有可分配的权限
                Route::get('authority', 'api/api.v1.Member/authority');
                //确认用户身份
                Route::post('confirm_author', 'api/api.v1.Member/confirmAuthor');
                //退出登录
                Route::get('logout', 'api/api.v1.Member/logout');
                //公众号授权
                Route::get('wxmp_authorize_url', 'api/api.v1.Member/getWXMPAuthorizeUrl');
                //检测是否关注公众号
                Route::get('check_attention', 'api/api.v1.Member/checkAuthorizeAttention');
                // 获取员工信息
                //Route::get('staff','api/api.v1.Member/getStaffInfo');
            })->middleware(['AppRoute','AppAuth:fu_jia']);
        });
    });
})->middleware(['ReflexValidate'])->allowCrossDomain();

//清除缓存
Route::get('clear',function (){
    $res = \think\facade\Cache::clear();
    return 'clear '.$res;
});
//Route::get('test','api/admin.v1.Book/getBooks');


