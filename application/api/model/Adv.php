<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/21
 * Time: 21:03
 */

namespace app\api\model;


use app\lib\exception\common\ParameterException;

class Adv extends MyBaseModel
{
    protected $table = 't_adv';

    public function file(){
        return $this->hasOne('LinFile','id','file_id');
    }

    public function coverFile(){
        return $this->hasOne('LinFile','id','cover_file_id');
    }

    public static function getList($params,$pagination = true,$page = 1 ,$size = 15){
        if($pagination){
            $result = self::with('file,coverFile')->where($params)->order('sort','desc')->paginate($size,false,['page'=>$page]);
        }else{
            $result = self::with('file,coverFile')->where($params)->order('sort','desc')->select();
        }

        return $result;
    }

    public static function editAdv($params){
        $advModel = self::get($params['id']);
        if (!$advModel) {
            throw new ParameterException();
        }
        return $advModel->save($params);
    }





}