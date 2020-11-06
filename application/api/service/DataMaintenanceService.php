<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-15
 * Time: 17:11
 */

namespace app\api\service;


use app\lib\exception\common\DomainException;
use app\lib\exception\common\ParameterException;
use app\lib\refDomain\MyDomain;
use think\Db;
use think\Exception;

class DataMaintenanceService
{
    private $union_id = '';

    public function syncUpdate(array $models,string $type,array $data,bool $autoUnion = false,$union_field =''){
        if($autoUnion){
            if($type !== 'insert'){
                throw new ParameterException([
                    'msg' => '关联模型只允许insert方法'
                ]);
            }
            if(!$union_field){
                throw new ParameterException([
                    'msg' => '关联模型需指定子表关联字段'
                ]);
            }

            if(count($data[$models[0]]) > 1){
                throw new ParameterException([
                    'msg' => '关联模型主表需放在第一位且只能有一条数据'
                ]);
            }
            if(count($models) != 2){
                throw new ParameterException([
                    'msg' => '自动关联模型暂只支持传入两个模型'
                ]);
            }

        }

        $myDomain = new MyDomain();
        Db::startTrans();
        try{
            foreach ($models as $key => $model){
                $domain = $myDomain->initModel($model);
                if($type === 'insert'){
                    if(!$autoUnion){
                        $domain->saveAll($data[$model]);
                    }else{
                        if($key == 0){
                            $domain->save($data[$model][0]);
                            $this->union_id = $domain->id;
                        }else{
                            $flag = false;
                            foreach ($domain->getTableFields() as $field){
                                if($field === $union_field){
                                    $flag = true;
                                }
                            }
                            if(!$flag){
                                throw new ParameterException([
                                    'msg' => '数据表不存在该关联字段'
                                ]);
                            }
                            $data[$model] = array_map(function($v)use($union_field){
                                $v[$union_field] = $this->union_id;
                                return $v;
                            },$data[$model]);
                            $domain->saveAll($data[$model]);
                        }
                    }
                }else if($type === 'update'){
                    foreach ($data[$model] as $modelData){
                        $model =  $domain->where('fid',$modelData['fid'])->find();
                        if(!$model){
                            throw new DomainException([
                                'msg' => "找不到Fid为{$modelData['fid']}的记录",
                            ]);
                        }
                        $model->save($modelData,$model->id);
                    }
                }else{
                    $ids = [];
                    foreach ($data[$model] as $modelData){
                        $model =  $domain->where('fid',$modelData['fid'])->find();
                        if(!$model){
                            throw new DomainException([
                                'msg' => "找不到Fid为{$modelData['fid']}的记录",
                            ]);
                        }
                        array_push($ids,$model->id);
                    }
                    $domain->destroy($ids);
                }
            }
            Db::commit();
        }catch (Exception $e){
            Db::rollback();
                throw $e;
        }

    }



}