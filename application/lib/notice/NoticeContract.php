<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/30
 * Time: 11:20
 */

namespace app\lib\notice;


interface NoticeContract
{
    public  function  send($template);
}