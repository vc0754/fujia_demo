<?php
/**
 * Created by PhpStorm.
 * User: 沁塵
 * Date: 2019/4/28
 * Time: 21:38
 */

namespace app\api\validate\user;


use app\api\validate\CommDefineRule;


class RegisterForm extends CommDefineRule
{
    protected $rule = [
        'password' => 'require|confirm:confirm_password',
        'confirm_password' => 'require',
        'username' => 'require|length:2,15',
        'group_id' => 'require',
        'email' => 'email',
    ];
}