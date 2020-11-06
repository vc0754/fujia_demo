<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/2/28
 * Time: 15:22
 */

namespace app\api\controller;


use app\api\model\LinFile;


abstract class BaseController
{

    protected  function  getFileImagePath($id)
    {

        $headImg = LinFile::get($id);
        if ($headImg) {
            $headPhotoUrl = $headImg->path;
        } else {
            $headPhotoUrl = '';
        }

        return $headPhotoUrl;
    }
}