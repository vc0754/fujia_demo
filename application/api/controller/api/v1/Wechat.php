<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/21
 * Time: 13:58
 */

namespace app\api\controller\api\v1;




use think\Controller;
use think\facade\Cache;
use think\facade\Hook;
use think\Request;


/**
 * 微信公众号
 * Class Wechat
 * @package app\api\controller\v1
 */
class Wechat extends Controller
{
    const KEY = 'authorize_';


//region  公众号验证方法
    public function wxAuth(){
        $this->checkSignature();
        $echostr = input('echostr');
//        Hook::listen('logger',  array('uid'=>1,'username'=>'super','msg' => '微信认证'.$echostr . '字符串'));
        return response()->data($echostr)->contentType('application/text');
    }

    private function checkSignature()
    {

        $signature = input("signature");
        $timestamp = input("timestamp");
        $nonce = input("nonce");

        $token = "z20200725z";
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );

        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }
//endregion


    /**
     * 回调接口
     * @param Request $request
     */
    public function authorizeCallback(Request $request){

        config('default_return_type','html');
        $params['code'] = $request->param('code');
        $params['memberID'] = $request->param('member_id');
        $params['state'] = $request->param('state');
//        dump(Cache::get(self::KEY.$params['memberID']));
//        dump($params['state']);
//        die;
        if(!cache(self::KEY.$params['memberID']) || Cache::get(self::KEY.$params['memberID']) != $params['state'] ){
            $this->error('该二维码已失效请重新生成扫码!');
//            throw new WeChatException([
//                'msg' => '该二维码已失效请重新生成扫码！'
//            ]);
        }
        //获取OpenID
        $info = app('wechat')->getOpenID($params['code']);
        if(!$info){
            $this->error('授权失败,请联系管理员查看问题!');
        }
        if(isset($info['errcode'])){
            $this->error($info['errmsg']);
        }
        $openid = $info['openid'];

        $subscribe_url = 'https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MzU2NDkzNDg2MA==&scene=110#wechat_redirect';
        //绑定用户通知身份
        $res = app('wechat')->wxBind($params['memberID'],$openid);
        if(!$res){
            $this->error('请重新登录小程序退出身份后，重新登录后扫描授权',$subscribe_url);
        }
        //检测用户引导关注公众号
        $subscribeRes = app('wechat')->checkSubscribe($openid);
        if($subscribeRes){
            $userInfo = json_decode($subscribeRes,true);
            if(array_key_exists('errcode',$userInfo)){
                $this->error('错误码为:'.$userInfo['errcode'].',错误信息:'.$userInfo['errmsg']);
            }
            if(!$userInfo['subscribe']){
                $this->success('授权成功,请关注公众号才可接收通知',$subscribe_url);
                return;
            }else{
                $this->success('授权成功',$subscribe_url);
            }
        }else{
            $this->error('获取关注状态失败',$subscribe_url);
        }
    }

}