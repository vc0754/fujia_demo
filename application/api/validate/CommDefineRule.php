<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/10
 * Time: 16:50
 */

namespace app\api\validate;


use app\api\model\Organization;
use app\lib\exception\common\ParameterException;
use LinCmsTp5\validate\BaseValidate;


/**
 * 自定义公用规则
 * Class BaseDefineRule
 * @package app\api\validate
 */
class CommDefineRule  extends  BaseValidate
{

    //自定义验证规则 必须为数字（可负数，小数）
    protected function isNumber($value){
        if(is_numeric($value)){
            return true;
        }else{
            return false;
        }
    }

    //自定义验证规则  必须为整数
    protected  function isNaturalInteger($value,$rule='',$data='',$field='')
    {
        if(is_numeric($value) && is_int($value + 0) && ($value+0) >= 0){
            return true;
        }else{
            return false;
        }
    }


    //自定义验证规则  必须为整数
    protected  function isPostiveInteger($value,$rule='',$data='',$field='')
    {
        if(is_numeric($value) && is_int($value + 0) && ($value+0) > 0){
            return true;
        }else{
            return false;
        }
    }
    //自定义验证规则  不能为空
    protected  function  isNotEmpty($value,$rule='',$data='',$field=''){
        if(empty($value)){
            return false;
        }else{
            return true;
        }
    }

    protected  function  isMobile($value){
        $rule = '^1(3|4|5|6|7|8|9)[0-9]\d{8}$^';
        $res = preg_match($rule,$value);
        if($res){
            return true;
        }else{
            return false;
        }
    }


    /**
     * 是否微信头像
     */
    protected  function  isWxAvatar($value){
        //判断是否是微信的qlogo地址
        $rule = '/https:\/\/[\w]+\.qlogo.cn\/.*/';
        $res = preg_match($rule,$value);
        if($res){
            return true;
        }else{
            return false;
        }
    }

    protected function validDate($value,$data){
       if(strtotime($value) <= time()){
           return false;
       }
       return true;
    }



}