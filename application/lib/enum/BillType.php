<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/9
 * Time: 11:33
 */

namespace app\lib\enum;


class BillType
{
    //应收单据
    const RECEIVABLES = 1;

    //应退单据
    const REFUNDABLE = 2;

    //减免单据
    const RELIEFORDER = 3;
}