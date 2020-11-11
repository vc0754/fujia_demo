<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-30
 * Time: 16:47
 */

namespace app\lib\enum;


class ContractStatus
{
    //执行中
    const EXECUTING = 1;
    //已终止
    const FINISHED = 2;
    //作废取消
    const VOID_CANCEL = 3;

}