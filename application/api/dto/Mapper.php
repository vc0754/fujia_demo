<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-12
 * Time: 14:17
 */

namespace app\api\dto;


class Mapper
{
    public function __construct($array)
    {
        $myProperty = get_class_vars(get_called_class());
        $keys = array_keys($myProperty);
        foreach ($array as $key=> $value){
            if(in_array($key,$keys)){
                $this->$key = $value;
            }
        }

    }
}