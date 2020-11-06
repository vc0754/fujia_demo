<?php

namespace app\api\model;


class PaymentRecord extends MyBaseModel
{
    protected $table = 't_payment_record';

    public function detail()
    {
        return $this->hasMany('PaymentRecordDetail','payment_record_id','id');
    }

    public function customer(){
        return $this->hasOne('Customer','fid','customer_fid');
    }


}