<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-30
 * Time: 15:38
 */

namespace app\api\controller\admin\v1;


use app\lib\exception\common\HandleException;
use think\facade\Hook;
use think\Request;
use app\api\model\ArtCategory as ArtCategoryModel;
use app\api\model\Article as ArticleModel;
class ArtCategory
{
    /**
     * 查询指定文章详情
     * @param $cid
     * @param('cid','文章分类ID','require')
     * @return \think\response\Json
     * @auth('文章分类ID查询','文章管理')
     */
    public function getCategory($cid)
    {
        $result = ArtCategoryModel::with('thumb')->find($cid);
        if(!$result){
            $result = [];
        }
        return show('200',$result);
    }

    /**
     * @return \think\response\Json
     * @auth('文章分类列表','文章管理')
     */
    public function getCategories($page=1,$size=15)
    {
        $result = ArtCategoryModel::with('thumb')->order('sort desc')->order('create_time desc')->paginate($size,false,['page'=>$page]);;
        if($result->isEmpty()){
            $result = [];
        }
        return show('200',$result);
    }


    /**
     * @param Request $request
     * @return \think\response\Json
     * @auth('添加文章分类','文章管理')
     */
    public function create(Request $request)
    {
        $params = $request->post();
        $artCategory = new  ArtCategoryModel;
        $artCategory->save($params);
        return show(201, '', '新建文章分类成功');
    }

    /**
     * @param Request $request
     * @return \think\response\Json
     * @auth('编辑文章分类','文章管理')
     */
    public function update(Request $request)
    {
        $params = $request->put();
        $id = input('cid');
        $artCategory = new  ArtCategoryModel;
        $artCategory->allowField(true)->save($params,['id' => $id]);
        //接收传过来的参数
        return show(201, '', '更新文章分类成功');
    }

    /**
     * 删除文章分类
     * @auth('删除文章分类','文章管理')
     * @param $cid
     * @param('cid','文章分类ID','require')
     * @return \think\response\Json
     * @throws HandleException
     */
    public function delete($cid)
    {
        $count = ArticleModel::where('category_id',$cid)->count();
        if($count > 0){
            throw new HandleException([
               'msg' => '请先删除该文章分类下的文章'
            ]);
        }
        ArtCategoryModel::destroy($cid);
        Hook::listen('logger', '删除了id为' . $cid . '的文章分类');
        return show(201, '', '删除文章分类成功');
    }

}