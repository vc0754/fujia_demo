<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-10-10
 * Time: 21:29
 */

namespace app\lib\enum;

/**
 * 退款状态
 * Class RefundStatus
 * @package app\lib\enum
 */
class RefundApplyStatus
{
    /**
     * 申请中
     */
    const APPLYING = 0;
    /**
     * 已同意
     */
    const AGREE = 1;
    /**
     * 拒绝
     */
    const  REFUSE = 2;

}