<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/18
 * Time: 15:56
 */

namespace app\lib\notice\driver;


use app\lib\enum\WxmpTemplate;
use app\lib\notice\NoticeContract;
use app\lib\wxmp\AccessToken;

class WxmpNotice implements NoticeContract
{


    const TEMPLATE_SEND_URL = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=%s';


    public function send($postArr){
        $accessToken = (new AccessToken())->get();
//        foreach ($wxSendArr as $wxSend) {
//            if($wxSend['type']=='student'){
//                $first = $wxSend['student_name'].'同学您好，您有一门课程即将上课!';
//            }else{
//                $first = $wxSend['teacher_name'].'老师您好，您有一门课程即将上课!';
//            }
//            $postArr = config('wxmp_template.'.WxmpTemplate::CLASS_TIME);
//            $postArr['touser'] = $wxSend['touser'];
//            $postArr['template_id'] = $template;
//            $postArr['data']['first']['value'] = $first;
//            $postArr['data']['keyword1']['value'] = $wxSend['class_name'];
//            $postArr['data']['keyword2']['value'] = $wxSend['class_time'];
//            $postArr['data']['keyword3']['value'] = $wxSend['organization_name'].$wxSend['class_name'];
//            $postArr['data']['keyword4']['value'] = $wxSend['teacher_name'];

           // 替换成模板配置文件
//            $postArr = [
//                'touser' => $wxSend['touser'],
//                'template_id' => $template,
//                'mini_program'=>[],
//                'data' => [
//                    'first' => [
//                        'value' => $first,
//                    ],
//                    'keyword1'=> [
//                        'value'=> $wxSend['class_name']
//                    ],
//                    'keyword2'=>[
//                        'value'=>$wxSend['class_time']
//                    ],
//                    'keyword3'=>[
//                        'value'=>$wxSend['organization_name'].$wxSend['class_name']
//                    ],
//                    'keyword4'=>[
//                        'value'=>$wxSend['teacher_name']
//                    ],
//
//                ]
//            ];

            $url = sprintf(self::TEMPLATE_SEND_URL,$accessToken);
            $resJson = http_request($url,'post',json_encode($postArr),[],'query');
            $res = json_decode($resJson,true);
            if($res['errcode'] == 0 && $res['errmsg'] == 'ok'){
                return true;
            }else{
              // Log::error('公众号推送消息失败，请检查配置信息!');
                return false;
            }
//        }
    }
}