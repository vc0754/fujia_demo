<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/25
 * Time: 16:43
 */

namespace app\api\service;

use app\api\model\WxBind as  WxBindModel;
use app\lib\wxmp\AccessToken;
use app\api\model\Member as MemberModel;
use think\Db;
use think\Exception;


class Wechat
{
    /**
     * cms绑定公众号授权通知
     */
    public function wxBindOrganization($organizationID,$info){
//        $organizationAuthorize = OrganizationAuthorize::where('openid',$info['openid'])->where('organization_id',$organizationID)
//            ->find();
//        if($organizationAuthorize){
//            return true;
//        }
//
//        $userInfo = $this->getUserInfoByOpenID($info['access_token'],$info['openid']);
//
//        $orgAuthorize = new OrganizationAuthorize();
//        $orgAuthorize->organization_id = $organizationID;
//        $orgAuthorize->openid = $userInfo['openid'];
//        $orgAuthorize->nickname = $userInfo['nickname'];
//        $orgAuthorize->headimgurl = $userInfo['headimgurl'];
//        $orgAuthorize->save();

        return true;
    }

    /**
     * 提供获取公众号OPENID服务
     * @param $code
     * @return mixed
     */
    public function getOpenID($code){

        //授权Openid
        $url = sprintf(config('wxmp.oauth_url'),config('wxmp.appid'),config('wxmp.secret'),$code);

        $res = http_request($url);
        if(!$res){
            return false;
        }
        $info = json_decode($res,true);

        return $info;
    }

    private  function getUserInfoByOpenID($accessToken,$openID){
        $url = sprintf(config('wxmp.user_info_api'),$accessToken,$openID);
        $res = http_request($url);
        if(!$res){
            return false;
        }
        $info = json_decode($res,true);
        return $info;
    }

    /**
     * 缓存绑定用户身份(传入openid为更新更新绑定)
     * @param $memberID
     * @param $openid
     * @throws \Exception
     */
    public function  wxBind($memberID,$openid=''){
        $member = MemberModel::get($memberID);
        $auth = cache($member->minipro_openid);
        if(!$auth){
            return false;
        }
        $list = [];
        $results = WxBindModel::where('member_id',$memberID)
            ->where('mobile',$member->mobile)
            ->select();
        Db::startTrans();
        try{
            if($openid){
                $member->mp_openid = $openid;
                $member->save();
            }else{
                if(!$member->mp_openid){
                    return;
                }
            }

            if($results){
                WxBindModel::where('member_id',$memberID)
                    ->where('mobile',$member->mobile)
                    ->delete();
            }

            if(array_key_exists('teacher',$auth)){
                foreach ($auth['teacher'] as $teacher){
                    $wxBind = WxBindModel::where('teacher_id',$teacher['id'])
                        ->where('mobile',$member->mobile)
                        ->find();
                    if($wxBind && $wxBind->member_id != $memberID){
                        $wxBind->delete();
                    }
                    $list[] = ['member_id'=>$memberID,'teacher_id'=>$teacher['id'],'mobile'=>$member->mobile];
                }
            }

            if(array_key_exists('student',$auth)){
                foreach ($auth['student'] as $student){
                    foreach ($student['students'] as $val){
                        $wxBind = WxBindModel::where('student_id',$val['id'])
                            ->where('mobile',$member->mobile)
                            ->find();
                        if($wxBind && $wxBind->member_id != $memberID){
                            $wxBind->delete();
                        }
                        $list[] = ['member_id'=>$memberID,'student_id'=>$val['id'],'mobile'=>$member->mobile];
                    }
                }
            }

            $wxBindModel = new WxBindModel;
            $wxBindModel->saveAll($list);
            Db::commit();
        }catch (Exception $e){
            Db::rollback();
            return false;
           // Hook::listen('logger', '绑定微信用户通知错误:' . $e->getMessage());
        }
        return true;

    }

    /**
     * 检测关注状态
     * @param $openid
     * @return mixed|\returns|string
     */
    public function  checkSubscribe($openid){
        $accessToken = new AccessToken();
        $token = $accessToken->get();
        $url = sprintf(config('wxmp.is_subscribe'),$token,$openid);
        $subscribeRes = http_request($url);
        return $subscribeRes;
    }

}