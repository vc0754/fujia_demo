<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/7/21
 * Time: 21:03
 */

namespace app\api\model;


use app\lib\exception\common\ParameterException;

class RefundLog extends MyBaseModel
{
    protected $table = 't_refund_log';

    /**
     * 分页获取数据
     * @param $filter
     * @param int $page
     * @param int $size
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public static function getList($filter,$page = 1,$size = 15){
        return self::where($filter)->order('create_time','desc')->paginate($size,false,['page'=>$page]);
    }

    /**
     * 获取退款申请
     * @param int $page
     * @param int $size0
     */
    public static function getApplications($page = 1,$size = 15){
        return self::where('status',0)->order('create_time','desc')->paginate($size,false,['page'=>$page]);
    }
}