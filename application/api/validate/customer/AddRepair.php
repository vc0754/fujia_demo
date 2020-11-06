<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/16
 * Time: 13:47
 */

namespace app\api\validate\customer;


use app\api\validate\CommDefineRule;

class AddRepair extends CommDefineRule
{
    protected $rule = [
        'repair_unit' => 'require|isPostiveInteger',
        'repair_type' => 'require|isPostiveInteger',
        'description' => 'require',
        'phone' => 'require|isMobile'
    ];
}