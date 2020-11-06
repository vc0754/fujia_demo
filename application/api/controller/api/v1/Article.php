<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-30
 * Time: 15:36
 */

namespace app\api\controller\api\v1;

use app\api\model\ArtCategory as ArtCategoryModel;
use app\api\model\Article as ArticleModel;
use think\Request;

class Article
{
    /*
     * 获取文章分类
     * @return \think\response\Json
    */
    public function getCategory(Request $request)
    {
        //默认获取排序前三条。有limit参数则根据实际数量获取
        $limit = input('get.limit',3);
        $result = ArtCategoryModel::where("status","=",1)->order(["sort"=>"desc","create_time"=>"desc"])->limit($limit)->select();
        return show('200',$result);
    }

    /*
     * 获取文章列表
     */
    public function getListByCategoryID($category_id,$page=1,$size=10)
    {
        $filter[] = ["status","=",1];
        $filter[] = ["category_id","=",$category_id];
        $result = ArticleModel::with("bigThumb,thumb")
            ->where($filter)
            ->order((["recommend"=>"desc","hits"=>"desc","create_time"=>"desc"]))
            ->hidden(['content'])
            ->paginate($size,false,['page'=>$page]);
        return show('200',$result);
    }

    /*
    * 获取一条文章信息
    */
    public function getArticleByID($id)
    {
        $result = ArticleModel::with("bigThumb,thumb")->get($id);
        ArticleModel::where('id', $id)->setInc('hits');
        return show('200',$result);
    }

}