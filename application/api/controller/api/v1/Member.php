<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/16
 * Time: 9:39
 */

namespace app\api\controller\api\v1;


use app\lib\exception\common\AuthActionException;
use app\lib\token\Token;
use think\facade\Cache;
use think\Request;
use app\api\model\Member as MemberModel;


/**
 * 小程序用户
 * Class Member
 * @package app\api\controller\v1
 */
class Member
{
    protected $applicationID;

    public function __construct()
    {
        $this->applicationID = request()->application_id;
    }

    /**
     * 颁布小程序令牌
     * @param Request $request
     * @return array
     * @throws \think\Exception
     */
    public function login(Request $request)
    {
        $code = $request->post('code');

        $token = app('member',['applicationID'=>$this->applicationID])->getToken($code);

        return show(200,$token,'ok');
    }


    /**
     * 获取用户微信信息
     * @param('encrypted_data','加密的用户数据','require')
     * @param('iv','与用户数据一同返回的初始向量','require')
     * @param Request $request
     * @return \think\response\Json
     * @throws \app\lib\exception\token\TokenException
     * @throws \think\Exception
     */
    public function getUserInfo(Request $request){

        $params = $request->post();
        $encryptedData = trim($params['encrypted_data']);
        $iv = trim($params['iv']);
        $mid = Token::getCurrentMID($this->applicationID);
        $result = app('member',['applicationID'=>$this->applicationID])->getUserInfo($mid,$encryptedData,$iv);
        return show(200,$result,'ok');
    }

    /**
     * 获取微信绑定手机号
     * @param('encrypted_data','加密的用户数据','require')
     * @param('iv','与用户数据一同返回的初始向量','require')
     * @param Request $request
     * @return \think\response\Json
     * @throws \app\lib\exception\token\TokenException
     * @throws \think\Exception
     */
    public function getPhoneNumber(Request $request){
        $params = $request->post();
        $encryptedData = trim($params['encrypted_data']);
        $iv = trim($params['iv']);

        $mid = Token::getCurrentMID($this->applicationID);

        $result = app('member',['applicationID'=>$this->applicationID])->getPhoneNumber($mid,$encryptedData,$iv);

        return show(200,$result,'ok');
    }


    /**
     * 刷新令牌
     * @return \think\response\Json
     */
    public function refresh(){
        $token = app('member',['applicationID'=>$this->applicationID])->refresh();

        return show(200,$token,'ok');
    }

    /**
     * 用户登录获取授权身份
     * @return mixed
     */
    public function authority(){

        $mobile = input('mobile');
        $mid = Token::getCurrentMID($this->applicationID);
        $member = MemberModel::get($mid);
        $result = app('member',['applicationID'=>$this->applicationID])->authority($member,$mobile);
        return  show(200,$result,'ok');
    }


    /**
     * 检测用户是否已经关注公众号
     * @return \think\response\Json
     * @throws \app\lib\exception\token\TokenException
     * @throws \think\Exception
     */
    public function checkAuthorizeAttention(){
        $mid = Token::getCurrentMID($this->applicationID);

        if(!$mid){
            throw new AuthActionException([
                'msg' => '找不到MID'
            ]);
        }

        $result = app('member',['applicationID'=>$this->applicationID])->checkAuthorizeAttention($mid);
        return  show(200,$result,'ok');
    }





    public function getWXMPAuthorizeUrl(){
//        $openID = Token::getCurrentWxOpenID($this->applicationId);
//        $auth = cache($openID);
        $mid = Token::getCurrentMID($this->applicationId);
        return  app('member',['applicationID'=>$this->applicationID])->getWXMPAuthorizeUrl($mid);
    }


    /**
     * 退出登录
     * @return \think\response\Json
     * @throws \app\lib\exception\token\TokenException
     * @throws \think\Exception
     */
    public function  logout(){
        $openID = Token::getCurrentWxOpenID($this->applicationID);
        Cache::rm($openID);
//        Cache::rm('SESSIONKEY'.$openID);
        return  show(201,'','logout success!');
    }


}