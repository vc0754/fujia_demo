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
        $t = TimingBill::select();
        foreach ($t as $v){
            if($v->list_bill_type == 1){
                $v->meter_take_time = date('Y-m-d H:i:s',(strtotime($v->create_time) - 28800));
                $v->save();
            }
        }
exit;
//        $res = app('pay',['pay'=> new ThirdWxPay(),'applicationId'=>ApplicationEnum::DINNING])->queryRefund('202010191810412008854282');
//
//        var_dump($res);exit;
//        die;
//        exit;
//        $redis = new Redis();
//        $redis->sadd('dinning',"20101516225154728001");


        $pds = PaymentRecordDetail::all();
        foreach ($pds as $v){
            if($v->bill_fid){
                $bill = Bill::where('fid',$v->bill_fid)->find();
                $details = BillDetail::where('bill_fid',$v->bill_fid)->select();
                $detailsData = [];
                foreach ($details as $k => $detail){
                    $detailsData[$k]['fid'] = $detail->fid;
                    $detailsData[$k]['charge_fid'] = $detail->charge_items_fid;
                    $detailsData[$k]['charge_name'] = ChargeType::where('fid',$detail->charge_items_fid)->value('name');
                    $detailsData[$k]['paid_balance'] = $detail->amount;
                    $detailsData[$k]['unpaid_balance'] = bcsub($detail->amount,$detail->paid_balance,2);
                    $detailsData[$k]['total_amount'] = $detail->amount;
                    $detailsData[$k]['create_time'] = $detail->create_time;
                    $detailsData[$k]['remark'] = $detail->remark;
                }
                $billJsonArr = [
                    'housing_fid' => $bill->housing_fid,
                    'housing_name' => \app\api\model\Housing::where('fid',$bill->housing_fid)->value('name'),
                    'type' => $bill->type,
                    'details_data' => $detailsData
                ];

                $v->detail_data = json_encode($billJsonArr);
                $v->save();

            }
        }
        echo '成功';
        die;
        var_dump(123123123);die;
        $topic = 'application/6/device/00010105ff0002e6/rx';
        $dataStr = '{"applicationID":"6","applicationName":"THLL_Triphase","deviceName":"3AW-3_CC32LR_0002e6","devEUI":"00010105ff0002e6","rxInfo":[{"gatewayID":"b827ebfffe86027e","name":"tianhuan_86027e","time":"2020-10-08T01:44:24.389524Z","rssi":-87,"loRaSNR":10,"location":{"latitude":23.42554,"longitude":116.58498,"altitude":16}}],"txInfo":{"frequency":472700000,"dr":5},"adr":true,"fCnt":8333,"fPort":8,"data":"AgUAAf8A3ck="}';
        $data1Str = '
{"applicationID":"4","applicationName":"THLL_Uniphase","deviceName":"2AW-4_CC32LR_0002ed","devEUI":"00010105ff0002ed","rxInfo":[{"gatewayID":"b827ebfffe89790e","name":"tianhuan_89790e","time":"2020-10-08T09:09:22.973126Z","rssi":-83,"loRaSNR":9,"location":{"latitude":23.4247,"longitude":116.58359,"altitude":3}}],"txInfo":{"frequency":471700000,"dr":5},"adr":true,"fCnt":22454,"fPort":8,"data":"BQMqXEQCSgAAG7QAAP/p//82CAAAAgATiAF3AAAAAAAAAAAAAAAAAAAAAAAAMQs="}';
        $data = json_decode($dataStr,true);
        $data1 = json_decode($data1Str,true);
        $bytes = bin2hex(base64_decode($data1['data']));
        var_dump($bytes);
//        $meterRead = hexdec('ddc9')/10;
//        var_dump($meterRead);
//        $str = '';
//        foreach($bytes as $ch) {
//            var_dump($ch);
//            die;
//            $str .= chr($ch);
//        }
//        var_dump($str);
        die;


//        $meters = MeterModel::where('meter_code','like','A%')->limit(10)->order('meter_code')->select();
//        foreach ($meters as  $meter){
//            app('device')->meterControl($meter->id);
//            sleep(2);
//        }
        exit;
//        for($i=1;$i<=171;$i++){
//            $newStr= sprintf('A-%03s', $i);
//
//            $housing_id = \app\api\model\Housing::where('number','=',$newStr)->value('id');
//
//            $temp = sprintf('A-%03s-P',$i);
//
//            $meter_id = \app\api\model\Meter::where('meter_code','=',$temp)->value('id');
//
//
//            if(!empty($housing_id) && !empty($meter_id)){
//                HousingMeter::create(['housing_id'=>$housing_id,'meter_id'=>$meter_id]);
//            }
//
//        }




//        $rabbitmq = new MyRabbitMQ();
//        //$rabbitmq->initQueue('/saas','saas',true)->publish('ss');
//        $rabbitmq->initExchange('')->initQueue('','',true)->publish('aa');
//
//        $res = Db::name('t_article')->select();
//        return $res;

//        $m = new Machine();
//        for ($i=30;$i<=100;$i++){
//            $newStr1[]['machine_no'] = sprintf('%03s', $i);
//        }
//        $m->saveAll($newStr1);
//        for ($j=193;$j<=230;$j++){
//            $newStr2[]['machine_no'] = sprintf('%03s', $j);
//        }
//        $m->saveAll($newStr2);
//        exit;

//        $customer_fid = '406';
//        $datetime = time();
//        for($i=0;$i<=100000;$i++){
//
//            if($i % 100 == 0){
//                $datetime += 86400;
//            }
//            $insert = [
//                'payment_no' => config('billPrefix.payment_bill') . makePaySn($customer_fid),
//                'bill_source' => 2,
//                'terminal_type' => 1,
//                'operator_id' => 100014,
//                'customer_fid'=>$customer_fid,
//                'total_amount'=> 100,
//                'online_wechat'=>100,
//                'year_months' => date('Ym',$datetime),
//                'charge_time' => date('Y-m-d H:i:s',$datetime),
//                'create_time' => date('Y-m-d H:i:s',$datetime)
//            ];
//
//            $pr = new PaymentRecord();
//            $pr->save($insert);
//
//            $insertDetail = [
//                'payment_record_id' => $pr->id,
//                'item_name' =>'水电余额充值',
//                'create_time' => date('Y-m-d H:i:s',$datetime)
//            ];
//            $prd = new PaymentRecordDetail();
//            $prd->save($insertDetail);
//        }


//        $content = "告警:方法-pushLossAndChangeCard 推送到金蝶时发生错误，请查看";
//        $robot = new DingDingRobot(config('ding_robot.web_hook'));
//        $content =  ['content'=> $content];
//        $robot->setTextType()->setContent($content)->send();
        die;
//        $data = "{\"notice_name\":\"\u7f34\u8d39\u901a\u77e5\",\"mp_openid\":\"ozmtO0YtV7hOknT1FO1Ac6_XAQZ8\",\"customer_name\":\"zl\",\"later_time\":0}";
//        $data = json_decode($data,true);
//        $postArr = config('wxmp_template.template_1');
//        $postArr['touser'] = "ozmtO0YtV7hOknT1FO1Ac6_XAQZ8";
//        $tempID = WxmpTemplate::PENDING_PAYMENT;
//        $postArr['template_id'] = $tempID;
//        $postArr['data']['first']['value'] = "缴费通知";
//        $postArr['data']['keyword1']['value'] = "小小你您好";
//        $postArr['data']['keyword2']['value'] = '您租用的房源有新的账单请及时缴费';
//        $postArr['data']['keyword3']['value'] = '详情金额请进入小程序查看谢谢';
////        if (array_key_exists('remark', $data)) {
////            $postArr['data']['remark']['value'] = $data['remark'];
////        }
////        dump($data);
//        $n = new WxmpNotice();
//        dump($n->send($postArr));

//        $wechatFans = new WechatFans();
//        $wechatFans->openid = 'opena151a5d1fadfjoiadjfoijoi';
//        $wechatFans->subscribe_date = 1591122121;
//        $wechatFans->save();
//
//        return response()->data('123123123')->contentType('text/html');
//        $arr = ['2'=>2,335];
//        file_put_contents('1.txt',json_encode($arr));
//        dump(cache('sss'));die;
//
//       // phpinfo();die;
//        $b = '0001|002|50|065417cac26011ea94c31c1bb528fd62';
//        //dump($b);
//
//        $x = pack('A*',$b);
//        dump($x);
//        die;
        $rabbitmq = new RabbitMQ();
        $rabbitmq->publish('04c31c1bb528fd62');

//        $user = Token::getCurrentUser();
//        $b = new BalanceAlarm();
//        $b->balance = 10;
//        $b->member_id = '779eda4ab52811ea878e000c296a88fe';
//        $b->customer_name = '帅哥';
//        $b->quota = 20;
//        app('notice_queue')->balanceAlarmNotify($b);

//        $param  = [
//            ["name"=>"#TH-A08","dev_eui"=>"00010105ff0001f5"],
//            ["name"=>"#TH-A07","dev_eui"=>"00010105ff0001f5"],
//        ];
//        dump(array_column($param,'dev_eui'));

//        $dtu = new Dtu();
//        $dtu->saveAll($param);

//        $id = '34a5bba8b82211ea8c0a00e0707ca7dd';
//        $did = '34a630d8b82211eaa3cf00e0707ca7dd';
//        $paymentRecord =  PaymentRecordDetail::get($did);
//        dump($paymentRecord);die;

        //时序数据查询案例
//       $res = app('t_db')->query("select last(*) from thwy.t_00010105ff0001f5_1");
//       return json_decode($res,true);

//        $uuid1 = Uuid::uuid1();
//        echo $uuid1->toString();
//        $params = ['customer_fid'=>'1001','total_amount'=>100];
//        $paymentRM = new PaymentRecordMaster;
//        $paymentRM->save($params);
//          Console::call('subscribe_mqtt');


//        $data = '{"applicationID":"208","applicationName":"THWY","deviceName":"LoRa_CKXYZHQ","devEUI":"00010105ff0001f5","rxInfo":[{"gatewayID":"b827ebfffe3c4d0a","name":"WAN1","rssi":-78,"loRaSNR":10.2,"location":{"latitude":0,"longitude":0,"altitude":0}}],"txInfo":{"frequency":472700000,"dr":5},"adr":true,"fCnt":76,"fPort":8,"data":"AQMEARUAAOoL"}';
//        $data = json_decode($data,true);
//        $bytes = bin2hex(base64_decode($data['data']));
//        dump($bytes);
//        $meterRead = hexdec('0115')/10;
//        dump($meterRead);
//        $str = '';
//        foreach($bytes as $ch) {
//            $str .= chr($ch);
//        }


//        dump($str);
        die;

                $topic = 'machine';
                $msg = '{"command":"0001","pos_no":"0002","payment_id":"f3971da0c35c11ea9f1a00e0707ca7dd"}';
                echo date('Y-m-d H:i:s') . ' SEND [' . $topic . '] ' . $msg . PHP_EOL;
                 $clientID = 'pub_zero';
                // qos ＝ 0：仅发一次，不管是否能收到
                // qos ＝ 1：没返回一直发，可能有重复接收
                // qos ＝ 2：保证必须收到，并且不重复
                $mqtt = new MyMqtt($clientID);
                $mqtt->publish($topic, $msg, 2);
                $mqtt->close();

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
exit;
        //region
        $data = [
            //1号配电箱
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"1","col":"1"}','meter_name'=>'东街D-13电表',	'meter_code'=>'D-13-P','sn_no'=>	'19410301','meter_addr'=>	'01','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"1","col":"2"}','meter_name'=>'东街D-14电表',	'meter_code'=>'D-14-P','sn_no'=>	'19410539','meter_addr'=>	'02','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"1","col":"3"}','meter_name'=>'东街D-15电表',	'meter_code'=>'D-15-P','sn_no'=>	'19410537','meter_addr'=>	'03','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"1","col":"4"}','meter_name'=>'东街D-16电表',	'meter_code'=>'D-16-P','sn_no'=>	'19410541','meter_addr'=>	'04','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"1","col":"5"}','meter_name'=>'东街D-17电表',	'meter_code'=>'D-17-P','sn_no'=>	'19410543','meter_addr'=>	'05','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"2","col":"1"}','meter_name'=>'东街D-18电表',	'meter_code'=>'D-18-P','sn_no'=>	'19410396','meter_addr'=>	'06','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"2","col":"2"}','meter_name'=>'东街D-19电表',	'meter_code'=>'D-19-P','sn_no'=>	'19410397','meter_addr'=>	'07','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"2","col":"3"}','meter_name'=>'东街D-20电表',	'meter_code'=>'D-20-P','sn_no'=>	'19410394','meter_addr'=>	'08','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"2","col":"4"}','meter_name'=>'东街D-21电表',	'meter_code'=>'D-21-P','sn_no'=>	'19410398','meter_addr'=>	'09','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"2","col":"5"}','meter_name'=>'东街D-22电表',	'meter_code'=>'D-22-P','sn_no'=>	'19410395','meter_addr'=>	'10','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"3","col":"1"}','meter_name'=>'东街D-23电表',	'meter_code'=>'D-23-P','sn_no'=>	'19410392','meter_addr'=>	'11','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-1","row":"3","col":"2"}','meter_name'=>'东街D-24电表',	'meter_code'=>'D-24-P','sn_no'=>	'19410393','meter_addr'=>	'12','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],

            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"1","col":"1"}','meter_name'=>'东街D-25电表',	'meter_code'=>'D-25-P','sn_no'=>	'19410402','meter_addr'=>	'01','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"1","col":"2"}','meter_name'=>'东街D-26电表',	'meter_code'=>'D-26-P','sn_no'=>	'19390416','meter_addr'=>	'02','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"1","col":"3"}','meter_name'=>'东街D-27电表',	'meter_code'=>'D-27-P','sn_no'=>	'19410283','meter_addr'=>	'03','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"1","col":"4"}','meter_name'=>'东街D-28电表',	'meter_code'=>'D-28-P','sn_no'=>	'19410400','meter_addr'=>	'04','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"1","col":"5"}','meter_name'=>'东街D-29电表',	'meter_code'=>'D-29-P','sn_no'=>	'19390404','meter_addr'=>	'05','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"2","col":"1"}','meter_name'=>'东街D-30电表',	'meter_code'=>'D-30-P','sn_no'=>	'19410401','meter_addr'=>	'06','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"2","col":"2"}','meter_name'=>'东街D-31电表',	'meter_code'=>'D-31-P','sn_no'=>	'19390415','meter_addr'=>	'07','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"2","col":"3"}','meter_name'=>'东街D-33电表',	'meter_code'=>'D-33-P','sn_no'=>	'19410282','meter_addr'=>	'08','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"2","col":"4"}','meter_name'=>'东街D-34电表',	'meter_code'=>'D-34-P','sn_no'=>	'19410403','meter_addr'=>	'09','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"2","col":"5"}','meter_name'=>'东街D-35电表',	'meter_code'=>'D-35-P','sn_no'=>	'19410281','meter_addr'=>	'10','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"3","col":"1"}','meter_name'=>'东街D-36电表',	'meter_code'=>'D-36-P','sn_no'=>	'19410280','meter_addr'=>	'11','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-2","row":"3","col":"2"}','meter_name'=>'东街D-32电表',	'meter_code'=>'D-32-P','sn_no'=>	'19390331','meter_addr'=>	'12','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],

            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"1","col":"1"}','meter_name'=>'东街D-01电表',	'meter_code'=>'D-01-P','sn_no'=>	'19410599','meter_addr'=>	'01','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"1","col":"2"}','meter_name'=>'东街D-02电表',	'meter_code'=>'D-02-P','sn_no'=>	'19410491','meter_addr'=>	'02','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"1","col":"3"}','meter_name'=>'东街D-03电表',	'meter_code'=>'D-03-P','sn_no'=>	'19410595','meter_addr'=>	'03','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"1","col":"4"}','meter_name'=>'东街D-04电表',	'meter_code'=>'D-04-P','sn_no'=>	'19410450','meter_addr'=>	'04','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"1","col":"5"}','meter_name'=>'东街D-05电表',	'meter_code'=>'D-05-P','sn_no'=>	'19390462','meter_addr'=>	'05','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"2","col":"1"}','meter_name'=>'东街D-06电表',	'meter_code'=>'D-06-P','sn_no'=>	'19410451','meter_addr'=>	'06','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"2","col":"2"}','meter_name'=>'东街D-07电表',	'meter_code'=>'D-07-P','sn_no'=>	'19410490','meter_addr'=>	'07','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"2","col":"3"}','meter_name'=>'东街D-08电表',	'meter_code'=>'D-08-P','sn_no'=>	'19410593','meter_addr'=>	'08','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"2","col":"4"}','meter_name'=>'东街D-09电表',	'meter_code'=>'D-09-P','sn_no'=>	'19410596','meter_addr'=>	'09','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"2","col":"5"}','meter_name'=>'东街D-10电表',	'meter_code'=>'D-10-P','sn_no'=>	'19410488','meter_addr'=>	'10','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"3","col":"1"}','meter_name'=>'东街D-11电表',	'meter_code'=>'D-11-P','sn_no'=>	'19410542','meter_addr'=>	'11','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],
            ['dev_eui'=>'','meter_type'=>1,'pid'=>'ee9c9e24d30b11ea86490197d5f68937','level'=>2,'installed_info'=>'{"area":"\u4e1c","box":"1-3","row":"3","col":"2"}','meter_name'=>'东街D-12电表',	'meter_code'=>'D-12-P','sn_no'=>	'19410536','meter_addr'=>	'12','price_type_id'=>'51b0d44ccfd011eab74d15238ff7390e'],


        ];


        //endregion
        $meterModel = new MeterModel();

        $meterModel->saveAll($data);
        foreach($data as $key=>$item){

            if($item['meter_code'] == ''){
                continue;
            }

            $temp = substr($item['meter_code'],0,4);
            $id = PowerMeter::where('number','=',$temp)->value('id');
            if(!empty($id)){
                MeterModel::where('meter_code','=',$item['meter_code'])->update(['union_meter_id'=>$id]);
            }
            echo $temp."\n".$id."\r";
        }


        $tag = substr($data[0]['meter_code'],0,1);

        for($i=1;$i<=36;$i++){

            $newStr= sprintf($tag.'-%02s', $i);

            $housing_id = \app\api\model\Housing::where('number','=',$newStr)->value('id');

            $temp = sprintf($tag.'-%02s-P',$i);
            $meter_id = \app\api\model\Meter::where('meter_code','=',$temp)->value('id');

            if(!empty($housing_id) && !empty($meter_id)){
                HousingMeter::create(['housing_id'=>$housing_id,'meter_id'=>$meter_id]);
            }

        }

        echo '完成';
        exit;

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