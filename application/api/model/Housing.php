<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-07
 * Time: 14:49
 */

namespace app\api\model;


class Housing extends MyBaseModel
{
    protected $table = 't_housing';

    public function contract(){
        return $this->hasOne('Contract','housing_fid','fid')->with("customer")->where('status','in',[2,3,4]);
    }

    public static function getList($filter,$page = 1, $size = 15){
        return self::with('contract')->where($filter)->order('fid','asc')->paginate($size,false,['page'=>$page]);
    }

    public static function getHousingTotalCounts($filter){
        $output = [
            'total_count' => 0,
            'rented_count' => 0,
            'unrented_count' => 0
        ];
        $output['total_count'] =  self::where($filter)->count();
        $output['rented_count'] = self::where($filter)->where('state',1)->count();
        $output['unrented_count'] = self::where($filter)->where('state',2)->count();
        return $output;
    }
}