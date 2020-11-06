<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/2/29
 * Time: 15:38
 */

namespace app\api\service;

use app\api\model\LinFile;


abstract class  BaseService
{

    protected  function  getFileImagePath($id){

            $headImg = LinFile::get($id);
            if($headImg){
                $headPhotoUrl = $headImg->path;
            }else{
                $headPhotoUrl = '';
            }

        return $headPhotoUrl;
    }
}