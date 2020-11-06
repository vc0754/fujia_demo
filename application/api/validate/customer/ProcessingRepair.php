<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/17
 * Time: 14:22
 */

namespace app\api\validate\customer;


use app\api\validate\CommDefineRule;

class ProcessingRepair extends CommDefineRule
{
    protected $rule = [
        'rid' => 'require',
        'member_id' => 'require'
    ];
}