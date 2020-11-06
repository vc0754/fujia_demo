<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/16
 * Time: 10:01
 */

namespace app\api\service;



use app\api\model\Customer as CustomerModel;
use app\api\model\MemberPhone;
use app\api\model\Staff as StaffModel;
use app\api\model\WechatFans;
use app\lib\enum\AppAuthEnum;
use app\lib\enum\ApplicationEnum;
use app\lib\enum\AttentionStatus;
use app\lib\enum\DinningAuthEnum;
use app\lib\enum\StaffState;
use app\lib\exception\api\WeChatException;
use app\lib\exception\common\AuthActionException;
use app\lib\exception\common\ParameterException;
use app\lib\exception\token\ForbiddenException;
use app\lib\exception\token\TokenException;
use app\lib\token\Token;
use think\Exception;
use app\api\model\Member as MemberModel;
use think\facade\Cache;


class Member
{
    protected  $wxAppID;
    protected  $wxAppSecret;
    protected  $mobile;
    protected  $applicationID;

    const KEY = 'authorize_';

    public  function  __construct($applicationID)
    {
        $this->applicationID = $applicationID;
        if($applicationID == ApplicationEnum::FU_JIA){
            $this->wxAppID =  config('wxmini.fj.app_id');
            $this->wxAppSecret = config('wxmini.fj.app_secret');
        }else{
          throw new ForbiddenException();
        }

    }

    public function  getToken($code){
        //以上三个拼接配置文件中%s的字符串
        $wxLoginUrl = sprintf(config('wxmini.login_url'),$this->wxAppID,$this->wxAppSecret,$code);
        $res = http_request($wxLoginUrl);  //向微信服务器请求结果1:openID;2:session_key
        $wxResult = json_decode($res,true); //转为数组

        //判断
        if(empty($wxResult)){
            throw new Exception('获取openid以及session_key异常，微信内部错误');
        }else{
            //检测微信是否有返回errcode码,有的话证明获取失败
            $loginFail = array_key_exists('errcode',$wxResult);
            if($loginFail){
                $this->processLoginError($wxResult);
            }else{
                return $this->grantToken($wxResult);
            }
        }
        //Hook::listen('logger', array('mid' => $user->id, 'username' => $user->username, 'msg' => '登陆成功获取了令牌'));

       // return $result;
    }

    //验证失败抛出异常
    private function  processLoginError ($wxResult){
        throw new WeChatException([
            'msg' => $wxResult['errmsg'],
            'errorCode' =>$wxResult['errcode']
        ]);
    }

    //验证成功授权
    private  function  grantToken($wxResult){
        //1、获取openid；清除上次缓存
        //2、检测openid在数据库中是否已经存在；
        //3、不存在新增openid记录,存在直接获取
        //4、生成令牌写入缓存并返回客户端
        $openid = $wxResult['openid'];
//        Cache::rm($openid);
//        Cache::rm('SESSIONKEY'.$openid);

        $member =  model('member')->getMemberByMiniOpenID($openid);

        $unionid = '';
        if(isset($wxResult['unionid'])){
            $unionid = $wxResult['unionid'];
        }

        if(!$member){
            $member = $this->addMember($openid,$unionid);
        }
        if(empty($member->unionid)){
            $member->unionid = $unionid;
            $member->save();
        }

        //缓存session_key有效时间为2天
        cache('SESSIONKEY'.$openid,$wxResult['session_key'],172800);

        $token = Token::getToken($member,true);

       return $token;
    }
    //刷新token
    public function  refresh(){
        $result = Token::refreshAppToken($this->applicationID);
        return $result;
    }


    /**
     * 获取微信客户详细信息
     * @param $mid
     * @param $encryptedData
     * @param $iv
     * @return mixed
     * @throws ParameterException
     * @throws TokenException
     */
    public function getUserInfo($mid,$encryptedData,$iv){

        $member = MemberModel::get($mid);

        if (!$member) {
            throw new TokenException([
                'msg' => '找不到用户，重新获取code'
            ]);
        }

        if(cache('SESSIONKEY'.$member->minipro_openid) === false){
            throw new TokenException([
                'msg' => 'session_key找不到'
            ]);
        }


        $params = [
            'appid' => $this->wxAppID,
            'sessionKey' => cache('SESSIONKEY'.$member->minipro_openid),
            'encryptedData' => trim($encryptedData),
            'iv' => trim($iv)
        ];

        $errCode = $this->decryptData($params, $data );

        if($errCode == 0){
            $objData = json_decode($data);

            if(isset($objData->unionId) && !empty($member->unionid)){
                $member->unionid = $objData->unionId;
            }

            $member->nick_name = $objData->nickName;
            $member->avatar_url = $objData->avatarUrl;
            $member->save();

            return $member;
        }else{
            throw new Exception();
//            throw new TokenException([
//                'msg' => '获取信息失败，重新登录'
//            ]);
        }
    }

    /**
     * 授权获取手机号
     * @param $mid
     * @param $encryptedData
     * @param $iv
     * @return array
     * @throws ParameterException
     * @throws TokenException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getPhoneNumber($mid,$encryptedData,$iv){
        $member = MemberModel::get($mid);

        if (!$member) {
            throw new AuthActionException([
                'msg' => '找不到用户,重新获取code授权'
            ]);
        }

        if(cache('SESSIONKEY'.$member->minipro_openid) === false){
            throw new TokenException([
                'msg' => 'session_key找不到'
            ]);
        }

        $params = [
            'appid' => $this->wxAppID,
            'sessionKey' => cache('SESSIONKEY'.$member->minipro_openid),
            'encryptedData' => trim($encryptedData),
            'iv' => trim($iv)
        ];

        $errCode = $this->decryptData($params, $data );

        if($errCode == 0){
            $objData = json_decode($data);

            //新增微信授权过的手机号记录
            $filter[] = ['member_id','=',$member->id];
            $filter[] = ['mobile','=',$objData->purePhoneNumber];
            $memberPhoneModel = new MemberPhone();
            $obj = $memberPhoneModel->where($filter)->find();
            //判断手机号是否已存在
            if(empty($obj)){
                $memberPhoneModel->save(['member_id'=>$member->id,'mobile'=> $objData->purePhoneNumber]);
            }


            //授权
            $authority = $this->authority($member,$objData->purePhoneNumber);
//            $authority = $this->authority($member->id,$member->minipro_openid,$objData->purePhoneNumber);

            return [
                'phone'=>$objData->purePhoneNumber,
                'authority'=>$authority,
                'member_id' => $mid
            ];

        }else{
            throw new Exception();
//            throw new TokenException([
//                'msg' => '获取信息失败，重新登录'
//            ]);
        }
    }


    /**
     * 授权用户身份权限
     * @param $mid
     * @param $openID
     * @param $mobile
     * @return array
     * @throws ParameterException
     */
    public function authority($member,$mobile){
        $return = [
            'auth' => 0,
            'scope' => 0,
        ];
        Cache::rm($member->minipro_openid);
//        $memberModel = new MemberModel;
//        $member = $memberModel->get($mid);
        if($member){
            if(!$mobile){
               if($member->mobile){
                   $mobile = $member->mobile;
               }else{
                   throw new ParameterException(['msg' => '没有正确的授权手机号码']);
               }
            }else{
                if($mobile != $member->mobile){
                    $member->mobile = $mobile;
                    $member->save();
                }
            }
        }else{
            if(!$mobile){
                return  $return;
            }
            $member =  $this->addMember($member->minipro_openid);
            $member->mobile = $mobile;
            $member->save();
        }
        if($member->application_id == ApplicationEnum::FU_JIA){
            $result = $this->getMemberAuthor($mobile);
        }else{

        }

        cache($member->minipro_openid,$result);

        return $result;
    }


    /**
     * 检测是否已经关注公众号
     * @param $mid
     * @return int
     * @throws ParameterException
     */
    public function checkAuthorizeAttention($mid){
        $member = MemberModel::get($mid);

        if (!$member) {
            throw new TokenException([
                'msg' => '找不到用户,重新获取code授权'
            ]);
        }

        if(empty($member->unionid)){
            return AttentionStatus::UNSUBSCRIBE;
        }

        if(empty($member->mp_openid)){

            $obj = WechatFans::where('unionid','=',$member->unionid)->find();

            if(!$obj){
                return AttentionStatus::UNSUBSCRIBE;
            }

            if($obj->is_subscribe == 0){

                return AttentionStatus::UNSUBSCRIBE;
            }

            $member->mp_openid = $obj->openid;
            $member->save();
        }

        return AttentionStatus::SUBSCRIBE;

    }




    private  function  getMemberAuthor($mobile){
        $output = [];
        $auth = 0;
        $scope = 0;
        $authList = [];
        //查詢是否商户
        $customer = CustomerModel::where('mobile_phone',$mobile)->find();
        if($customer){
            //查询合同状态
//           $contract = ContractModel::where('customer_fid',$customer->fid)
//                ->where('status',['=',ContractStatus::EXECUTING],['=',ContractStatus::WAITING_FINISH],'or')
//               ->find();
//           if($contract){
               $auth = AppAuthEnum::Customer;
               $authList[] =  AppAuthEnum::Customer;
//           }
            $output['customer_id'] = $customer->id;
        }

        $member = MemberModel::where('mobile',$mobile)->where('application_id',ApplicationEnum::FU_JIA)->find();
        if($member){
            if($member->is_manager){
                $auth = $auth + AppAuthEnum::Manager;
                $authList[] = AppAuthEnum::Manager;
                $scope = $member->scope;
            }
            if($member->is_maintainer){
                $auth = $auth + AppAuthEnum::Maintainer;
                $authList[] = AppAuthEnum::Maintainer;
            }
        }

        $output['auth'] = $auth;
        $output['auth_list'] = $authList;
        $output['scope'] = $scope;

        return $output;
    }


    public function getWXMPAuthorizeUrl($mid){


        //$member_id =  MemberModel::get($mid);
        $key = self::KEY.$mid;
        if(cache($key)){
            $state = cache($key);
        }else{
            $state = rand(10000,999999);
            cache($key,$state,1800);
        }
        $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=%s&redirect_uri=%s&response_type=code&scope=snsapi_base&state=%u#wechat_redirect';
        $uri = sprintf($url,config('wxmp.appid'),urlencode(config('wxmp.redirect_uri').'?member_id='.$mid),$state);
        $data['uri'] = $uri;
        $data['state'] = $state;
        $data['member_id'] = $mid;
        return $data;
    }

    private function addMember($openid,$unionid = ''){
        $data=[
            'minipro_openid'=>$openid,
            'unionid' => $unionid,
            'application_id' => $this->applicationID
        ];
        $member = model('member');
        $member->save($data);
        return $member;
    }


    /**
     * 检验数据的真实性，并且获取解密后的明文.
     * @param $params=[
     *      'appid'         string 小程序appid
     *      'sessionKey'    string 用户sessionKey
     *      'encryptedData' string 加密的用户数据
     *      'iv'            string 与用户数据一同返回的初始向量
     * ];
     * @param $data string 解密后的原文
     *
     * @return int 成功0，失败返回对应的错误码
     */
    private function decryptData( $params,&$data )
    {
        //-41001: encodingAesKey 非法
        //-41003: aes 解密失败
        //-41004: 解密后得到的buffer非法
        //-41005: base64加密失败
        //-41016: base64解密失败
        static $OK = 0;
        static $IllegalAesKey = -41001;
        static $IllegalIv = -41002;
        static $IllegalBuffer = -41003;
        static $DecodeBase64Error = -41004;


        if (strlen($params['sessionKey']) != 24) {
            return $IllegalAesKey;
        }
        $aesKey=base64_decode($params['sessionKey']);


        if (strlen($params['iv']) != 24) {
            return $IllegalIv;
        }
        $aesIV=base64_decode($params['iv']);

        $aesCipher=base64_decode($params['encryptedData']);

        $result=openssl_decrypt( $aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);

        $dataObj=json_decode( $result );

        if( $dataObj  == NULL )
        {
            return $IllegalBuffer;
        }
        if( $dataObj->watermark->appid != $params['appid'] )
        {
            return $IllegalBuffer;
        }
        $data = $result;
        return $OK;
    }



}