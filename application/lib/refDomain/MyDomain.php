<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-06-16
 * Time: 15:45
 */

namespace app\lib\refDomain;


use app\lib\exception\common\DomainException;

class MyDomain
{
    private $modelPath = 'app\\api\\model\\';

    protected function checkModelExist($modelName){
        if(class_exists($this->modelPath.$modelName)){
            return true;
        }
        return false;
    }

    public function initModel($modelName,$param = [],$needInstance = true){
        if(!$this->checkModelExist($modelName)){
            throw new DomainException();
        }
        $className = $this->modelPath.$modelName;
        return $needInstance ? (new \ReflectionClass($className))->newInstanceArgs($param) : $className;
    }

}