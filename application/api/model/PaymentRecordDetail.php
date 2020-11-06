<?php

namespace app\api\model;


class PaymentRecordDetail extends MyBaseModel
{
    protected $table = 't_payment_record_detail';

    public function paymentRecord(){
        return $this->belongsTo('PaymentRecord','payment_record_id','id');
    }

    public function bill(){
        return $this->belongsTo('Bill','bill_fid','fid');
    }
}