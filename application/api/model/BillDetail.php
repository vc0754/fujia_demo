<?php

namespace app\api\model;

use app\api\model\Bill;

class BillDetail extends MyBaseModel
{
    protected $table = 't_bill_detail';


    public function chargeType(){
        return $this->belongsTo('ChargeType','charge_items_fid','fid')->field('fid,name');
    }

    public static function onAfterInsert($billDetail){
        $bill = Bill::where('fid',$billDetail->bill_fid)->find();
        $bill->setInc('total',$billDetail->amount);
        $bill->setInc('unpaid_balance',$billDetail->amount);
        return true;
    }
    
}