<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/22
 * Time: 15:40
 */

namespace app\api\dto\account;


use app\api\dto\Mapper;

class Operator extends Mapper
{
    //终端类型：1 微信小程序 2 客户端
    public $terminal_type;
    //操作员ID：微信存member.id 客户端存user.id
    public $operator_id;
    //客户端号
    public $client_no;
    //操作员名称
    public $operator_name = '';

    public function __construct($array)
    {
        parent::__construct($array);
    }

}