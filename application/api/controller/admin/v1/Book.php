<?php
/**
 * Created by PhpStorm.
 * User: 沁塵
 * Date: 2019/4/20
 * Time: 19:57
 */

namespace app\api\controller\admin\v1;


use app\api\dto\kingdee\Receivable;
use app\api\dto\kingdee\ReceivableBill;
use app\api\dto\kingdee\ReceivableDetails;
use app\api\model\Bill;
use app\api\model\BillDetail;
use app\api\model\Book as BookModel;

use app\api\model\ChargeType;
use app\api\model\HousingMeter;
use app\api\model\Meter as MeterModel;
use app\api\model\PaymentRecord;
use app\api\model\PaymentRecordDetail;
use app\api\model\PowerMeter;
use app\api\model\RepairApplication;
use app\api\model\TimingBill;
use app\api\model\WaterMeter;
use app\api\model\WechatFans;
use app\api\service\PayService;
use app\lib\enum\AppAuthEnum;
use app\lib\enum\ApplicationEnum;
use app\lib\enum\WxmpTemplate;
use app\lib\mqtt\MyMqtt;

use app\lib\notice\driver\WxmpNotice;
use app\lib\pay\wxmini\CcbWxPay;
use app\lib\pay\wxmini\ThirdWxPay;
use app\lib\rabbit\MyRabbitMQ;
use app\lib\rabbit\RabbitMQ;
use app\lib\redis\Redis;
use think\Db;
use think\Exception;
use think\facade\Hook;
use app\api\model\Machine;
use think\helper\Time;
use think\Request;
use Zeroibc\DingDingRobot;


/**
 * 测试案例
 * Class Book
 * @package app\api\controller\cms
 */
class Book
{
    /**
     * 查询指定bid的图书
     * @param $bid
     * @param('bid','图书ID','require|number')
     * @return mixed
     */
    public function getBook($bid)
    {

            $param = input('param.');
    }

    /**
     * 查询所有图书d
     * @return mixed
     */
    public function getBooks()
    {

    }

    public function test($int){
        $lst =[];
        if ($int <= 0){
            return $lst;
        }else{
            $dec = log($int) / log(2);
            $intMax = (int)$dec;
            $intMaxNum = (int)pow(2, $intMax);
            array_push($lst,$intMaxNum);
            $int = $int - $intMaxNum;
            return $this->test($int, $lst);

        }

    }

    public function testMeter(){


    }



    /**
     * 搜索图书
     */
    public function search()
    {

    }

    /**
     * 新建图书
     * @param Request $request
     * @return \think\response\Json
     */
    public function create(Request $request)
    {
        $params = $request->post();
        BookModel::create($params);
        return show(201, '', '新建图书成功');
    }

    /**
     * 编辑图书
     * @param Request $request
     * @return \think\response\Json
     */
    public function update(Request $request)
    {
        $params = $request->put();
        $bookModel = new BookModel();
        $bookModel->save($params, ['id' => $params['id']]);
        return show(201, '', '更新图书成功');
    }

    /**
     * @param $bid
     * @return \think\response\Json
     */
    public function delete($bid)
    {
        BookModel::destroy($bid);
        Hook::listen('logger', '删除了id为' . $bid . '的图书');
        return show(201, '', '删除图书成功');
    }
}