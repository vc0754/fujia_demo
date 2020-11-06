<?php
/**
 * Created by PhpStorm.
 * User: 沁塵
 * Date: 2019/2/19
 * Time: 9:59
 */

namespace app\lib\appAuth;


use WangYu\Reflex;

class AuthMap
{
    /**
     * @param $class
     * @param $method
     * @return string
     * @throws \Exception
     */
    public function getMethodAuthName($class, $method)
    {
        $re = new Reflex($class);
        $re->setMethod($method);
        $authAnnotation = $re->get('auth');
        $authName = empty($authAnnotation) ? '' : $authAnnotation[0];
        return $authName;
    }
    /**
     * @param $class
     * @param $method
     * @return string
     * @throws \Exception
     */
    public function getMethodScopeName($class, $method)
    {
        $re = new Reflex($class);
        $re->setMethod($method);
        $scopeAnnotation = $re->get('scope');
        $scopeName = empty($scopeAnnotation) ? '' : $scopeAnnotation[0];

        return $scopeName;
    }
}