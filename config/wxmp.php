<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/18
 * Time: 16:35
 */
return [
    'appid'=> '',
    'secret'=> '',
    'token'=>'',
    'access_token_url' => 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s',
    'redirect_uri' => 'http://th.api.yuxiangxx.com/v1/wxmp/authorize',
    'org_redirect_uri' =>  'http://th.api.yuxiangxx.com/wechat/authorize',
    'oauth_url' => 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code',
    'user_info_api' =>'https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s&lang=zh_CN',
    'is_subscribe' => 'https://api.weixin.qq.com/cgi-bin/user/info?access_token=%s&openid=%s&lang=zh_CN'
];