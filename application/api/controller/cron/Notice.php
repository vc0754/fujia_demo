<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/27
 * Time: 19:18
 */

namespace app\api\controller\cron;

use app\api\dto\notice\ContractExpireCount;
use app\api\dto\notice\ContractNotice;
use app\api\model\Contract as ContractModel;
use app\api\model\Customer as CustomerModel;
use app\api\model\Housing as HousingModel;
use app\api\model\Member as MemberModel;
use app\lib\enum\ContractStatus;
use think\helper\Time;

/**
 * 定时通知控制器s
 * Class Notice
 * @package app\api\controller\cron
 */
class Notice
{
    /**
     * 商户账户余额信息通知
     */
    public function accountBalanceNotice()
    {

    }

    /**
     * 设备心跳异常通知
     */
    public function deviceHeartExNotice()
    {

    }

    /**
     * 合同到期提醒通知检测
     */
    public function contractNotice()
    {
        $contracts = ContractModel::where('status', ContractStatus::EXECUTING)->select();
        list($start, $end) = Time::today();
        if ($contracts->isEmpty()) {
            return '';
        }
        $eCount = 0;
        $nCount = 0;
        foreach ($contracts as $contract) {
            $timeSpans = 30 * 24 * 3600;

            if ($contract->end_date - $timeSpans <= $start) {
                $dto['days_left'] = (int)(($contract->end_date - $start) / (24 * 3600));
                if ($dto['days_left'] >= 0) {
                    $nCount++;
                } else {
                    $eCount++;
                }
                $dto['expire_date'] = $contract->end_date;
                $dto['contract_no'] = $contract->bill_no;
                $dto['housing_name'] = HousingModel::where('fid', $contract->housing_fid)->value('name');
                $customer = CustomerModel::where('fid', $contract->customer_fid)->find();
                $dto['mobile'] = $customer->mobile_phone;
                $dto['customer_name'] = $customer->name;
                $members = MemberModel::getMembersByMobile($customer->mobile_phone);
                foreach ($members as $member) {
                    if ($member->mp_openid) {
                        $dto['mp_openid'] = $member->mp_openid;
                        $contractDto = new ContractNotice($dto);
                        //通知客户
                        app('notice_queue')->contractExpireNotice($contractDto);
                    }
                }
            }
        }
        $managers = MemberModel::where('is_manager', 1)->select();
        //通知管理
        foreach ($managers as $manager) {
            if($manager->mp_openid){
                $cDto['mp_openid'] = $manager->mp_openid;
                $cDto['near_count'] = $nCount;
                $cDto['expired_count'] = $eCount;
                $contractExpireCounts = new ContractExpireCount($cDto);
                app('notice_queue')->contractExpireCountNotice($contractExpireCounts);
            }
        }


        return show(201, '', 'contract exp notice success');
    }

}