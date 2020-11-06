<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-30
 * Time: 9:28
 */

namespace app\api\validate\contract;

use app\api\validate\CommDefineRule;
class ContractFilter extends CommDefineRule
{

    protected $rule = [
        'sort_field' => 'in:bill_no,start_date,end_date',
        'sort_type' => 'in:asc,desc',
        'page' => 'isPostiveInteger',
        'size' =>'isPostiveInteger',
        'status' => 'in:1,2,3,4,5,6'
    ];

}