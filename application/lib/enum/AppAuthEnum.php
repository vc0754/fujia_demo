<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/4/6
 * Time: 10:37
 */

namespace app\lib\enum;

/**
 * 小程序角色
 *  1、2、4、8、16、32
*/
class AppAuthEnum
{
    const Customer = 1; //客户

    const Manager = 2;  //市场管理

    const Maintainer = 4; //维修人员
}