<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/6
 * Time: 16:00
 */

namespace app\api\validate\customer;

use app\api\validate\CommDefineRule;

class AddFeedback extends CommDefineRule
{
    protected $rule = [
        'feedback_type' => 'require|isPostiveInteger',
        'description' => 'require',
        'phone' => 'require|isMobile'
    ];

    protected $message = [
        'feedback_type'    => '必填',
        'description'         => '必填',
        'phone'   => '必填且必须为数字'
    ];
}