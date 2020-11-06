<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-08-29
 * Time: 15:25
 */

namespace app\lib\component;


trait Singleton
{
    private static $instance;

    static function getInstance(...$args)
    {
        if(!isset(self::$instance)){
            self::$instance = new static(...$args);
        }
        return self::$instance;
    }
}