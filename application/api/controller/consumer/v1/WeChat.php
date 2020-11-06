<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-25
 * Time: 11:35
 */

namespace app\api\controller\consumer\v1;

use app\api\model\Member;
use app\api\model\WechatFans;
use app\lib\exception\common\AuthActionException;
use app\lib\exception\token\ForbiddenException;
use app\lib\wxmp\WxmpProvider;
use think\Exception;
use think\facade\Cache;
use think\facade\Hook;
use think\Request;
use think\Response;

class WeChat
{
    use WxmpProvider;

    /**
     * 微信公众号确认授权
     */
    private function tokenValid()
    {
        $echostr = input('echostr');
//        Hook::listen('logger',  array('uid'=>1,'username'=>'super','msg' => '请求进来'.$echostr . '字符串'));
        if ($this->checkSignature()) {
//        Hook::listen('logger',  array('uid'=>1,'username'=>'super','msg' => '微信认证'.$echostr . '字符串'));
            return response()->data($echostr)->contentType('application/text');
        }
        Hook::listen('logger', array('uid' => 1, 'username' => 'super', 'msg' => '微信认证失败' . $echostr . '字符串'));
        return false;
    }

    public function getAuthToken(){
        $token = Cache::get('wq_auth_token');
        if(!$token){
            throw new AuthActionException([
                'msg' => '未授权禁止登录！'
            ]);
        }
        return show(200,$token);
    }

    /**
     * 公众号来源签名认证
     * @return bool
     */
    private function checkSignature()
    {
        $signature = input("signature");
        $timestamp = input("timestamp");
        $nonce = input("nonce");

        $token = "THYX20200725";
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode($tmpArr);
        $tmpStr = sha1($tmpStr);

        if ($tmpStr == $signature) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获取公众号AccessToken存入缓存
     */
    public function getAccessToken()
    {

    }

    public function eventProcess(Request $request)
    {
        $message = $request->post();
//        file_put_contents('wxwee.txt',json_encode($message));
        try {
            switch ($message['msgtype']) {
                case 'event':
                    if ($message['event'] == 'subscribe') {
                        $this->subscribeEvent($message);
                    //    file_put_contents('sub.txt', json_encode($message));
                    }
                    if ($message['event'] == 'unsubscribe') {
                        $this->unsubscribeEvent($message);
                     //   file_put_contents('unsub.txt', json_encode($message));
                    }
                    break;
                default:
                    break;
            }
        } catch (Exception $e) {
            file_put_contents('wxerror.txt', $e->getMessage());
        }
    }


    /**
     *  关注事件
     */
    public function subscribeEvent($message)
    {
        $openId = $message['fromusername'];
        $wechatFans = WechatFans::where('openid', $message['fromusername'])->find();
        if (!$wechatFans) {
            $wechatFans = new WechatFans();
            $wechatFans->openid = $message['fromusername'];
        }
        $user = $this->wx->user->get($openId);
        $wechatFans->subscribe_date = $user['subscribe_time'];
        $wechatFans->is_subscribe = 1;
        $wechatFans->nickname = $user['nickname'];
        $wechatFans->sex = $user['sex'];
        $wechatFans->headimgurl = $user['headimgurl'];
        $wechatFans->language = $user['language'];
        $wechatFans->country = $user['country'];
        $wechatFans->city = $user['city'];
        $wechatFans->province = $user['province'];
        $wechatFans->unionid = $user['unionid'];
        $wechatFans->save();
    }


    /**
     * 取关事件
     */
    public function unsubscribeEvent($message)
    {
        $wechatFans = WechatFans::where('openid', $message['fromusername'])->find();
        if ($wechatFans) {
            $wechatFans->openid = $message['fromusername'];
            $wechatFans->subscribe_date = $message['createtime'];
            $wechatFans->is_subscribe = 0;
            $wechatFans->save();

            $member = Member::where('unionid', '=', $wechatFans->unionid)->find();
            if ($member) {
                $member->mp_openid = '';
                $member->save();
            }
        }
    }

}