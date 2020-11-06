<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
use app\lib\auth\AuthMap;
use LinCmsTp5\exception\ParameterException;
use think\facade\Request;
use Ramsey\Uuid\Uuid;
/**
 * @param $httpCode
 * @param $data
 * @param string $msg
 * @param int $code
 * @return \think\response\Json
 */

function show($httpCode, $data, $msg = 'ok', $code = 0)
{
    $data = [
        'error_code' => $code,
        'data' => $data,
        'msg' => $msg
    ];
    return json($data, $httpCode);
}

function rand_char($length)
{
    $str = null;
    $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
    $max = strlen($strPol) - 1;

    for ($i = 0; $i < $length; $i++) {
        $str .= $strPol[rand(0, $max)];
    }

    return $str;
}

function split_modules($auths, $key = 'module')
{
    if (empty($auths)) {
        return [];
    }

    $items = [];
    $result = [];

    foreach ($auths as $key => $value) {
        if (isset($items[$value['module']])) {
            $items[$value['module']][] = $value;
        } else {
            $items[$value['module']] = [$value];
        }
    }
    foreach ($items as $key => $value) {
        $item = [
            $key => $value
        ];
        array_push($result, $item);
    }
    return $result;

}

/**
 * @param $auth
 * @return array
 * @throws ReflectionException
 */
function findAuthModule($auth)
{
    $authMap = (new AuthMap())->run();
    foreach ($authMap as $key => $value) {
        foreach ($value as $k => $v) {
            if ($auth === $k) {
                return [
                    'auth' => $k,
                    'module' => $key
                ];
            }
        }
    }
}

///**
// * @param string $message
// * @param string $uid
// * @param string $nickname
// * @throws \app\lib\exception\token\TokenException
// * @throws \think\Exception
// */
//function logger(string $message, $uid = '', $nickname = '')
//{
//    if ($message === '') {
//        throw new LoggerException([
//            'msg' => '日志信息不能为空'
//        ]);
//    }
//
//    $params = [
//        'message' => $nickname ? $nickname . $message : Token::getCurrentName() . $message,
//        'user_id' => $uid ? $uid : Token::getCurrentUID(),
//        'user_name' => $nickname ? $nickname : Token::getCurrentName(),
//        'status_code' => Response::getCode(),
//        'method' => Request::method(),
//        'path' => Request::path(),
//        'authority' => ''
//    ];
//    LinLog::create($params);
//}

/**
 * @return array
 * @throws ParameterException
 */
function paginate()
{
    $count = intval(Request::get('count'));
    $start = intval(Request::get('page'));

    $count = $count >= 15 ? 15 : $count;

    $start = $start * $count;

    if ($start < 0 || $count < 0) throw new ParameterException();

    return [$start, $count];
}

function curl_post($url,$rawData){
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_HEADER,0);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
    curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,10);
    curl_setopt($ch,CURLOPT_POST,1);
    curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,false);
    curl_setopt($ch,CURLOPT_POSTFIELDS,$rawData);
    curl_setopt($ch,CURLOPT_HTTPHEADER,array(
        'Content-Type:text'
    ));
    $data = curl_exec($ch);
    curl_close($ch);
    return ($data);
}


/**
 * CURL请求
 * @param $url 请求url地址
 * @param $method 请求方法 get post
 * @param null $postfields post数据数组
 * @param array $headers 请求header信息
 * @param bool|false $debug 调试开启 默认false
 * @return mixed
 */
function http_request($url, $method = "GET", $postfields = null, $headers = array(),$mode='json',$debug = false)
{
    $method = strtoupper($method);
    $ci = curl_init();
    /* Curl settings */
    curl_setopt($ci, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
    curl_setopt($ci, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0");
    curl_setopt($ci, CURLOPT_CONNECTTIMEOUT, 60); /* 在发起连接前等待的时间，如果设置为0，则无限等待 */
    curl_setopt($ci, CURLOPT_TIMEOUT, 7); /* 设置cURL允许执行的最长秒数 */
    curl_setopt($ci, CURLOPT_RETURNTRANSFER, true);
    switch ($method) {
        case "POST":
            curl_setopt($ci, CURLOPT_POST, true);
            if (!empty($postfields)) {
                if($mode == 'json'){
                    $tmpdatastr = is_array($postfields) ? json_encode($postfields) : $postfields;
                }else{
                    $tmpdatastr = is_array($postfields) ? http_build_query($postfields) : $postfields;
                }

                curl_setopt($ci, CURLOPT_POSTFIELDS, $tmpdatastr);
            }
            break;
        default:
            curl_setopt($ci, CURLOPT_CUSTOMREQUEST, $method); /* //设置请求方式 */
            break;
    }
    $ssl = preg_match('/^https:\/\//i', trim($url)) ? TRUE : FALSE;
    curl_setopt($ci, CURLOPT_URL, $url);
    if ($ssl) {
        curl_setopt($ci, CURLOPT_SSL_VERIFYPEER, FALSE); // https请求 不验证证书和hosts
        curl_setopt($ci, CURLOPT_SSL_VERIFYHOST, FALSE); // 不从证书中检查SSL加密算法是否存在
    }
    //curl_setopt($ci, CURLOPT_HEADER, true); /*启用时会将头文件的信息作为数据流输出*/
    curl_setopt($ci, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ci, CURLOPT_MAXREDIRS, 2);/*指定最多的HTTP重定向的数量，这个选项是和CURLOPT_FOLLOWLOCATION一起使用的*/
    curl_setopt($ci, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ci, CURLINFO_HEADER_OUT, true);
    /*curl_setopt($ci, CURLOPT_COOKIE, $Cookiestr); * *COOKIE带过去** */
    $response = curl_exec($ci);
    $requestinfo = curl_getinfo($ci);
    $http_code = curl_getinfo($ci, CURLINFO_HTTP_CODE);
    if ($debug) {
        echo "=====post data======\r\n";
        var_dump($postfields);
        echo "=====info===== \r\n";
        print_r($requestinfo);
        echo "=====response=====\r\n";
        print_r($response);
    }
    curl_close($ci);
    return $response;
}

//使用数组的差集来判断
function judgeEqual($key1,$key2){
    if(array_diff($key1,$key2) || array_diff($key2,$key1)){
        return true;
    }else{
        return false;
    }
}

function second_array_unique_bykey($arr, $key){
$tmp_arr = array();
foreach($arr as $k => $v)
{
    if(in_array($v[$key], $tmp_arr))  //搜索$v[$key]是否在$tmp_arr数组中存在，若存在返回true
    {
        unset($arr[$k]); //销毁一个变量 如果$tmp_arr中已存在相同的值就删除该值
    }
    else {
        $tmp_arr[$k] = $v[$key]; //将不同的值放在该数组中保存
    }
}
//ksort($arr); //ksort函数对数组进行排序(保留原键值key) sort为不保留key值
return $arr;
}

/**
 * 生成20位编号(时间+微秒+随机数+会员ID%1000)，该值会传给第三方支付接口
 * 长度 =12位 + 3位 + 2位 + 3位  = 20位
 * 1000个会员同一微秒提订单，重复机率为1/100
 * @param $mid
 * @return string
 */

function makePaySn($mid) {
    return date('ymdHis',  time()).sprintf('%03d', (float) microtime() * 1000) .mt_rand(10, 99).sprintf('%03d', intval($mid) % 1000);
}




function getGuid(){
    $uuid = Uuid::uuid1();
    return  $uuid->getHex()->toString();
}