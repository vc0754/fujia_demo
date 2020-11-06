<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/2/28
 * Time: 11:15
 */

namespace app\api\model;

use app\lib\exception\common\ParameterException;
use think\facade\Cache;

/**
 * 会员
 * Class Member
 * @package app\api\model
 */
class Member extends BaseModel
{
    protected  $table = 't_member';

    public function getMemberByMiniOpenID($openid){
       return self::where('minipro_openid',$openid)->find();
    }

    public static function getMembersByMobile($mobile){
        $memberPhones =  MemberPhone::where('mobile',$mobile)->select();
        if(!$memberPhones->isEmpty()){
            $memberIDs = array_column($memberPhones->toArray(),'member_id');
        }
        $members  = self::where('id','in',$memberIDs)->select();
        return $members;
    }

    /**
     * 获取管理人员
     * @param int $applicationID
     * @return array|\PDOStatement|string|\think\Collection
     */
    public static function getManagers($applicationID = 1){
        $managers = self::where('is_manager',1)->where('application_id',$applicationID)->select();
        if($managers->isEmpty()){
            return [];
        }
        return $managers;
    }

    /**
     * 获取客服人员
     * @param int $applicationID
     * @return array|\PDOStatement|string|\think\Collection
     */
    public static function getWaiter($applicationID = 1){
        $waiter = self::where('is_waiter',1)->where('application_id',$applicationID)->select();
        if($waiter->isEmpty()){
            return [];
        }
        return $waiter;
    }

    /**
     * 获取维修人员
     * @param int $applicationID
     * @return array|\PDOStatement|string|\think\Collection
     */
    public static function getMaintainer($applicationID = 1){
        $maintainer = self::where('is_maintainer',1)->where('application_id',$applicationID)->select();
        if($maintainer->isEmpty()){
            return [];
        }
        return $maintainer;
    }


    /**
     * 设置权限
     * @param $params
     * @return mixed
     * @throws ParameterException
     */
    public static function setAuthority($params){

        $member = self::get($params['id']);

        if (!$member) {
            throw new ParameterException();
        }

        $member->save($params);
        if(isset($params['is_mananger']) || isset($params['is_maintainer'])){
            Cache::rm($member->minipro_openid);
        }

        return $member;
    }
}