<?php
/*
* Created by DevilKing
* Date: 2019- 06-08
*Time: 16:26
*/

namespace app\api\controller\admin\v1;

use think\facade\Cache;
use think\facade\Request;
use app\lib\file\LocalUploader;
use app\lib\exception\file\FileException;

/**
 * Class File
 * @package app\api\controller\cms
 */
class File
{
    /**
     * @return mixed
     * @throws FileException
     * @throws \LinCmsTp\exception\FileException
     */
    public function postFile()
    {
        try {
            $request = Request::file();
        } catch (\Exception $e) {
            throw new FileException([
                'msg' => '字段中含有非法字符',
            ]);
        }

        $file = (new LocalUploader($request))->upload();
        return $file;
    }

    /**
     * 删除缓存
     * @auth('删除缓存','系统管理','hidden')
     * @return \think\response\Json
     */
    public function cacheClear(){
        Cache::clear();
        return show(201, '', '清空缓存成功!');
    }
}
