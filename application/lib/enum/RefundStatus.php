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
class RefundStatus
{
    /**
     * 未处理
     */
    const Untreated = 0;

   /**
     * 处理中
     */
    const Handling = 1;
    /**
     * 成功
     */
    const Success = 2;
    /**
     * 失败
     */
    const Failed = 3;
}