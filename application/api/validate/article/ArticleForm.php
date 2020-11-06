<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020-07-30
 * Time: 16:51
 */

namespace app\api\validate\article;


use app\api\validate\CommDefineRule;
class ArticleForm extends CommDefineRule
{

    protected $rule = [
        'category_id' => 'require',
        'title' => 'require',
        'status' => 'require|in:0,1',
        'recommend' => 'require|in:0,1',
        'sort' => 'number',
        'hit' => 'number'
    ];



}