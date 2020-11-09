<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/16
 * Time: 14:53
 */

namespace app\lib\appAuth;



use app\lib\enum\AppAuthEnum;
use app\lib\enum\ApplicationEnum;
use app\lib\enum\ScopeEnum;
use app\lib\exception\token\ForbiddenException;
use app\lib\token\Token;
use think\Exception;
use think\facade\Cache;


class Auth
{
    protected $request;

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function check($appID=1)
    {

        if($this->request->controller()== 'Api.v1.Member' && ($this->request->action() == 'login' || $this->request->action() == 'refresh')){
            return true;
        }
        if($this->request->controller() == 'Api.v1.Wechat'){
            return true;
        }
        $openID = $this->memberOpenID($appID);
        if($openID){
            $this->request->minipro_openid = $openID;
            $auth = $this->actionAuthAndScope($appID);
            if(!$this->checkAuthority($openID,$auth,$appID)){
                return false;
            }
            return true;
        }else{
           return false;
        }

    }

    /**
     * @return array
     * @throws \ReflectionException
     * @throws \WangYu\exception\ReflexException
     * @throws \Exception
     */
    protected function actionAuthAndScope($appID)
    {
        // 获取当前请求的控制层
        $controller = $this->request->controller();
        // 控制层下有二级目录，需要解析下。如controller/cms/Admin，获取到的是Cms.Admin
        $controllerPath = explode('.', $controller);
        // 获取当前请求的方法
        $action = $this->request->action();
        // 反射获取当前请求的控制器类
        $class = new \ReflectionClass('app\\api\\controller\\' . strtolower($controllerPath[0]) . '\\' . $controllerPath[1]. '\\' . $controllerPath[2]);
        // 获取方法注解的权限名称
        $actionAuth = (new AuthMap())->getMethodAuthName($class->newInstance(),$action);
        if($appID == ApplicationEnum::FU_JIA){
            $appAuthRef = (new \ReflectionClass(AppAuthEnum::class));
        }else{
            throw new ForbiddenException();
        }
        $auth = 0;
        if($appAuthRef->getConstant($actionAuth)){
            $auth = $appAuthRef->getConstant($actionAuth);
        }
        // 获取方法注解的权限等级
        $actionScope = (new AuthMap())->getMethodScopeName($class->newInstance(),$action);
        $scopeRef = (new \ReflectionClass(ScopeEnum::class));
        $scope = 0;
        if($scopeRef->getConstant($actionScope)){
            $scope = $scopeRef->getConstant($actionScope);
        }
        return ['auth'=>$auth,'scope'=>$scope];
    }

    protected function checkAuthority($openID,$auth,$appID){
        if($auth['auth']){
            $res = Cache::get($openID);
            if(!$res){
                return false;
            }
            $lst = [];
            $authArr = $this->getAuthNum($res['auth'],$lst);
            if(in_array($auth['auth'],$authArr)){
                if($appID == ApplicationEnum::FU_JIA){
                    if($auth['auth'] == AppAuthEnum::Manager){
                        if($res['scope'] < $auth['scope']){
                            return false;
                        }
                    }
                }else{
                    throw new Exception();
                }
                return true;
            }
            return false;
        }else{
            return true;
        }
    }


    private function getAuthNum($int,$lst){
        if ($int <= 0){
            return $lst;
        }else{
            $dec = log($int) / log(2);
            $intMax = (int)$dec;
            $intMaxNum = (int)pow(2, $intMax);
            array_push($lst,$intMaxNum);
            $int = $int - $intMaxNum;
            return $this->getAuthNum($int, $lst);

        }
    }

    /**
     * @return mixed
     * @throws \app\lib\exception\token\TokenException
     * @throws \think\Exception
     */
    protected function memberOpenID($appId)
    {
        $openID = Token::getCurrentWxOpenID($appId);
        return $openID;

    }
}