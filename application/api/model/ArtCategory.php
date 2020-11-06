<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-30
 * Time: 15:41
 */

namespace app\api\model;


class ArtCategory extends MyBaseModel
{
    protected $table = 't_art_category';

    public function thumb(){
        return $this->belongsto('LinFile','thumb_file_id','id');
    }
}