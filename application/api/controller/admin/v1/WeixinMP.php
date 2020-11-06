<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-29
 * Time: 14:30
 */

namespace app\api\controller\admin\v1;


use app\api\model\WechatFans;
use app\lib\wxmp\WxmpProvider;
use think\Request;

class WeixinMP
{
    use WxmpProvider;

    /**
     * 获取并更新所有公众号粉丝到数据库
     * @param null $next_openId
     * @param bool $update_all  是否全部更新(否则跳过已有用户)
     * @return \think\response\Json
     * @throws \EasyWeChat\Kernel\Exceptions\InvalidConfigException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getAllFansAndUpdate($next_openId = null,$update_all = false)
    {

        $fans = $this->wx->user->list($next_openId);
        if ($fans) {
            if ($fans['data'] && $fans['data']['openid']) {
                foreach ($fans['data']['openid'] as $openID) {
                    $wechatFans = WechatFans::where('openid', $openID)->find();
                    if (!$wechatFans) {
                        $wechatFans = new WechatFans();
                        $wechatFans->openid = $openID;
                    }else{
                        if(!$update_all){
                            continue;
                        }
                    }
                    $user = $this->wx->user->get($openID);
                    $wechatFans->subscribe_date = $user['subscribe_time'];
                    $wechatFans->is_subscribe = $user['subscribe'];
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
            }
            if($fans['total'] > 10000 && $fans['count'] == 10000){
                $this->updateAllFans($fans['next_openid'],$update_all);
            }
        }
        return show(201, '', 'update success');
    }


}