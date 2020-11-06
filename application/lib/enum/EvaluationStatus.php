<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/10/26
 * Time: 11:18
 */

namespace app\lib\enum;


class EvaluationStatus
{
    //待评价
    const WAIT = 0;

    //满意
    const GOOD = 1;

    //不满意
    const NOT = 2;
}