<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-30
 * Time: 15:41
 */

namespace app\api\model;


class Article extends MyBaseModel
{
    protected  $table = 't_article';

    public function bigThumb(){
        return $this->belongsto('LinFile','big_thumb_file_id','id');
    }

    public function thumb(){
        return $this->belongsto('LinFile','thumb_file_id','id');
    }

}