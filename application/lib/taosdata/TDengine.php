<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-24
 * Time: 16:41
 */

namespace app\lib\taosdata;


class TDengine
{
    private $query_url='';

    private $auth_url='';

    public function __construct()
    {
        $this->auth_url = 'http://'.config('taosdata.ip').':'.config('taosdata.port').'/rest/login/'.config('taodata.username').'/'.config('taosdata.password');
        $this->query_url = 'http://'.config('taosdata.ip').':'.config('taosdata.port').'/rest/sql';
    }

    private function getToken()
    {
       // http://<ip>:6020/rest/login/<username>/<password>
        $arr_header[] = "Authorization: Basic ".base64_encode("root:admin123");

        $res =  http_request($this->auth_url,'GET');

        return $res;
    }

    public function query($sql){
        $arr_header[] = "Authorization: Basic ".base64_encode("root:admin123");
        $postData = $sql;
        $res = http_request($this->query_url,'POST',$postData,$arr_header);
        if(!$res){
            return $res;
        }
        $res = json_decode($res,true);
        return $res;
    }
}