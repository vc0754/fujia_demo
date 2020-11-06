<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-15
 * Time: 15:41
 */

namespace app\api\validate\gateway;


use app\api\validate\CommDefineRule;

class SyncForm extends CommDefineRule
{
    protected $rule = [
        'ModelName' => 'require',
        'Type' => 'require|in:insert,update,delete',
        'Data' => 'require|array'
    ];

    protected $message = [
        'ModelName.require' => '模型名称必须填写!',
        'Data.require' => 'data必须填写',
        'Type.require'=>'type 参数必须传',
        'Type.in' => 'type必须是insert,update,delete中一种',
        'Data.array' => 'data必须是个数组'
    ];


}