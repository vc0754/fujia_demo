<?php
namespace app\api\controller\admin\v1;

use app\lib\exception\common\ParameterException;
use think\Request;
use app\api\model\Feedback as FeedbackModel;


/**
 * Class Feedback
 * @package app\api\controller\cms
 */
class Feedback
{

    /**
     * 查询列表
     * @auth('投诉列表','投诉反馈')
     * @param Request $request
     * @param integer $page
     * @param integer $size
     * @return \think\response\Json
     */
    public function getList(Request $request, $page = 1,$size = 15){

        $params = $request->get();

        $filter = [];

        //状态
        if(isset($params['status']) && $params['status'] != ''){
            $filter[] =  ['status', '=', intval($params['status'])];
        }
        //反馈类型
        if(isset($params['feedback_type']) && $params['feedback_type'] != ''){
            $filter[] =  ['feedback_type', '=', intval($params['feedback_type'])];
        }

        $startDate = input('start_date','');
        $endDate = input('end_date','');

        if($startDate != '' && $endDate == ''){
            // 大于等于某个时间
            $filter[] = ['create_time', '>= time' , $startDate];
        }

        if($startDate == '' && $endDate != ''){
            // 小于等于某个时间
            $filter[] = ['create_time', '<= time' , $startDate];
        }

        if($startDate != '' && $endDate != ''){
            // 时间区间查询
            $filter[] =  ['create_time', 'between time', [$startDate, $endDate]];
        }


        $result = FeedbackModel::getPageList($filter,$page,$size);

        return show(200,$result,'操作成功');
    }

    /**
     * 确认信息已读
     * @param('id','反馈信息ID','require')
     * @param $id
     * @return mixed
     * @throws ParameterException
     */
    public function completeFeedback($id){

        $params['id'] = $id;

        FeedbackModel::complete($params);

        return show(201,'','update feedback success');
    }



}