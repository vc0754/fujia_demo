<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/26
 * Time: 9:55
 */

namespace app\api\model;


class LinFile extends BaseModel
{
    public function  getPathAttr($value,$data){
        $http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
        $finalurl = $http_type.$_SERVER['HTTP_HOST'].'/'.config('file.store_dir').'/'.$value;

        return $finalurl;
    }
}