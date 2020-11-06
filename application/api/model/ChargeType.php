<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/21
 * Time: 14:38
 */

namespace app\api\model;


class ChargeType extends MyBaseModel
{
    protected $table = 't_charge_type';


    public static function getChargeTypeEnum(){
        return self::column('name','fid');
    }

}