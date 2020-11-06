<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/1/8
 * Time: 14:09
 */

namespace app\api\contract;

/**
 * 支付契約
 * Interface PayContract
 * @package app\api\contract
 */
interface PayContract
{
    //方法可扩展，做把应用支付配置到数据库，通过应用ID查询他是否支持该中支付模式
    public function setApplication($applicationId);

    public function makeWxPreOrder($orderID,$orderSN,$orderPrice,$orderBody,$openID);

    public function barcodePay($dynamicID,$orderSN,$orderPrice,$onlineOrder);

    public function queryOrder($dynamicID,$orderID,$onlineOrder);

    public function makeRefundOrder($orderID, $orderSN, $refundMoney, $reason = null, $openID = null);

    public function queryRefund($thirdOrderId);
}