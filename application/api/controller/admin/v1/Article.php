<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-30
 * Time: 15:36
 */

namespace app\api\controller\admin\v1;
use app\api\model\Article as ArticleModel;
use think\facade\Hook;
use think\Request;

class Article
{
    /**
     * 查询指定文章详情
     * @param $aid
     * @param('aid','文章ID','require|number')
     * @return \think\response\Json
     * @auth('文章ID查询','文章管理')
     */
    public function getArticle($aid)
    {
        $result = ArticleModel::with('thumb,bigThumb')->find($aid);
        if(!$result){
            $result = [];
        }
        return show('200',$result);
    }

    /**
     *
     * @return \think\response\Json
     * @auth('文章列表','文章管理')
     */
    public function getArticles($page=1,$size=15)
    {
        $where = [];

        if(input('status') != ''){
            $where[] = ['status','=',input('status')];
        };
        if(input('category_id') != ''){
            $where[] = ['category_id','=',input('category_id')];
        }

        $result = ArticleModel::with('thumb,BigThumb')->where($where)->order('sort desc')->order('create_time desc')->paginate($size,false,['page'=>$page]);

        if($result->isEmpty()){
            $result = [];
        }
        return show('200',$result);
    }


    /**
     * @param Request $request
     * @return \think\response\Json
     * @validate('ArticleForm')
     * @auth('添加文章','文章管理')
     */
    public function create(Request $request)
    {
        $params = $request->post();
        $artArticle = new  ArticleModel;
        $artArticle->save($params);
        return show(201, '', '新建文章成功');
    }

    /**
     * @param Request $request
     * @return \think\response\Json
     * @validate('ArticleForm')
     * @auth('编辑文章','文章管理')
     */
    public function update(Request $request)
    {
        $params = $request->put();
        $id = input('aid');
        $artArticle = new  ArticleModel;
        $artArticle->allowField(true)->save($params,['id' => $id]);
        //接收传过来的参数
        return show(201, '', '更新文章成功');
    }

    /**
     * 删除文章
     * @auth('删除文章','文章管理')
     * @param $aid
     * @param('aid','文章ID','require')
     * @return \think\response\Json
     */
    public function delete($aid)
    {
        ArticleModel::destroy($aid);
        Hook::listen('logger', '删除了id为' . $aid . '的文章');
        return show(201, '', '删除文章成功');
    }

    /**
     * @auth('后台文章排序','文章管理')
     * @param Request $request
     * @return \think\response\Json
     */
    public function sort(Request $request){
        $params = $request->put();
        $id = input('aid');
        $article = new ArticleModel;
        $article->allowField(['sort'])->save($params,['id'=>$id]);
        return show(201,'','更新排序成功');
    }

}