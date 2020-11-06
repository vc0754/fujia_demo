<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-23
 * Time: 16:59
 */

namespace app\api\model;


use Ramsey\Uuid\Uuid;

/**
 * 业务模型继承该基类模型自动生成uuid
 * Class MyBaseModel
 * @package app\api\model
 */
class MyBaseModel extends BaseModel
{
    public static function init()
    {
        static::event('before_insert', function ($model) {
            $uuid = Uuid::uuid1();
            $model[$model->pk] = $uuid->getHex()->toString();
            if(method_exists(static::class,'onBeforeInsert')){
                call_user_func_array ([static::class,'onBeforeInsert'],[$model]);
            }
            
        });

        static::event('after_insert', function ($model) {
            if(method_exists(static::class,'onAfterInsert')){
                call_user_func_array ([static::class,'onAfterInsert'],[$model]);
            }
        });

        static::event('after_update', function ($model) {
            if(method_exists(static::class,'onAfterUpdate')){
                call_user_func_array ([static::class,'onAfterUpdate'],[$model]);
            }
        });
    }
}