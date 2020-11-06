<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-08-11
 * Time: 10:38
 */

namespace app\api\dto\notice;


use app\api\dto\Mapper;

/**
 * 合同预到期统计
 * Class ContractExpireCounts
 * @package app\api\dto\notice
 */
class ContractExpireCount extends Mapper
{
    //公众号ID
    public $mp_openid;
    //快到期数
    public $near_count;
    //过期数
    public $expired_count;
}