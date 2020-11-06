<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/4/29
 * Time: 9:32
 */

namespace app\api\controller\admin\v1;


use app\lib\workerMan\CmsWorker;
use think\Controller;
use think\facade\Cache;
use think\facade\Hook;
use think\Request;

class WeChat extends Controller
{
    /**
     * 小程序回调接口
     * @param Request $request
     */
    public function authorizeCallback(Request $request){

//        config('default_return_type','html');
//        $params['code'] = $request->param('code');
//        $params['organizationID'] = $request->param('organization_id');
//        $params['state'] = $request->param('state');
//
//        if(!cache(config('cacheKey.authorize').$params['organizationID'])){
//            $this->error('该二维码已失效请重新生成扫码!');
//        }
//
//        if(cache(config('cacheKey.authorize').$params['organizationID']) != $params['state']){
//            $this->error('参数有异常，重新获取二维码!');
//        }
//
//        //获取OpenID
//        $info = app('wechat')->getOpenID($params['code']);
//        if(!$info){
//            $this->error('获取OpenID失败,请联系管理员查看问题!');
//        }
//        if(isset($info['errcode'])){
//            $this->error($info['errmsg']);
//        }
//        $openid = $info['openid'];
//
//        $subscribe_url = 'https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MzU2NDkzNDg2MA==&scene=110#wechat_redirect';
//        //绑定用户通知身份
//        $res = app('wechat')->wxBindOrganization($params['organizationID'],$info);
//        if(!$res){
//            $this->error('授权失败,请联系管理员查看问题!',$subscribe_url);
//        }else{
//            //长连接 通知前端授权成功更新列表
//            $clientID = Cache::pull($params['state']);
//            if($clientID){
//                $worker = new CmsWorker();
//                $worker->send($clientID, '{ "msg":"success"}');
//            }
//        }
//        //检测用户引导关注公众号
//        $subscribeRes = app('wechat')->checkSubscribe($openid);
//        if($subscribeRes){
//            $userInfo = json_decode($subscribeRes,true);
//            if(array_key_exists('errcode',$userInfo)){
//                $this->error('错误码为:'.$userInfo['errcode'].',错误信息:'.$userInfo['errmsg']);
//            }
//            if(!$userInfo['subscribe']){
//                $this->success('授权成功,请关注公众号才可接收通知',$subscribe_url);
//                return;
//            }else{
//                $this->success('授权成功',$subscribe_url);
//            }
//
//        }else{
//            $this->error('获取关注状态失败',$subscribe_url);
//        }
    }
}