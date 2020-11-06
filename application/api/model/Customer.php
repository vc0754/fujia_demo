<?php
namespace app\api\model;


class Customer extends MyBaseModel
{
    protected $table = 't_customer';


    public function contract()
    {
        return $this->hasMany('Contract','customer_fid','fid');
    }


    /**
     * 根据条件获取商户列表  $all默认1查询全部 0筛选有待支付的商户
     *
     * @param array $filter
     * @param integer $all
     * @param integer $page
     * @param integer $size
     * @return array
     */
    public static function getList($filter,$all = 1,$page = 1,$size = 15){
        if($all)
            $results = self::where($filter)->order('create_time','desc')->paginate($size,false,['page'=>$page]);
        else
            $results = self::where($filter)->where('fid','IN',function($query){
                $query->table('t_bill')->where('state',0)->field('customer_fid');
            })->order('create_time','desc')->paginate($size,false,['page'=>$page]);
        return $results;
    }

    /**
     * 根据条件获取商户列表  $all默认1查询全部 0筛选有待支付的商户
     *
     * @param string $customer_name
     * @param string $housing_name
     * @param integer $all
     * @param integer $page
     * @param integer $size
     * @return array
     */
    public static function getListByHousing($customer_name,$housing_name,$all = 1,$page = 1,$size = 15){
        $filter = [];
        if(trim($customer_name) != ''){
            $filter[] =  ['name|mobile_phone', 'like', '%'.$customer_name.'%'];
        }


/*        $list = ContractModel::withJoin(['customer','housing' => function($query)use($arrWhere){
            $query->where($arrWhere);
        }])->where($contractFilter)->order('status','asc')->paginate($size,false,['page'=>$page]);

$query->table('t_contract a')->join(array('left', 't_housing b on a.housing_fid=b.fid'))->where($filter_housing)->field('customer_fid');
*/
        if($all){
            if($housing_name){
                $results = self::where($filter)->where("fid","in",function ($query)use($housing_name){
                    $query->table('t_contract')->where("housing_fid","in",function($query_inner)use($housing_name){
                        $query_inner->table("t_housing")->where('name',"like",'%'.$housing_name.'%')->field('fid');
                    })->field('customer_fid');
                })->order('create_time','desc')->paginate($size,false,['page'=>$page]);
            }else{
                $results = self::where($filter)->order('create_time','desc')->paginate($size,false,['page'=>$page]);
            }
        }else{

            if($housing_name){
                $results = self::where($filter)->where(
                    'fid','IN',function($query)use($housing_name){
                        $query->table('t_bill')->where([['state',"=",0],['type',"<>",2]])->where(
                            'customer_fid','IN',
                            function ($queryTemp)use($housing_name){
                                $queryTemp->table('t_contract')->where("housing_fid","in",
                                    function($query_inner)use($housing_name){
                                        $query_inner->table("t_housing")->where('name',"like",'%'.$housing_name.'%')->field('fid');
                                    })->field('customer_fid');
                            })->field('customer_fid');
                })->order('create_time','desc')->paginate($size,false,['page'=>$page]);
            }else{
                $results = self::where($filter)->where('fid','IN',function($query){
                    $query->table('t_bill')->where([['state',"=",0],['type',"<>",2]])->field('customer_fid');
                })->order('create_time','desc')->paginate($size,false,['page'=>$page]);
            }



        }
        return $results;
    }


    /**
     * 根据商户fid获取商户信息（含当前拥有的房源信息）
     *
     * @param [type] $cid
     * @return object
     */
    public static function getInfoByFID($customer_fid,$contract_status = []){
        $contractWhere = [];
        if($contract_status){
            $contractWhere = $contract_status;
        }

        $results = self::with(
            ['contract' => function($query)use($contractWhere){
                $query->with('housing')->where($contractWhere);
            }
            ])->where('fid','=',$customer_fid)->find();
        return $results;
    }

    /**
     * 根据商户fid获取商户信息（含当前拥有的房源信息）
     *
     * @param [type] $cid
     * @return object
     */
    public static function getInfo($customer_id,$contract_status = []){
        $contractWhere = [];

        if($contract_status){
            $contractWhere = $contract_status;
        }
        $results = self::with(
            ['contract' => function($query)use($contractWhere){
                $query->with('housing')->where($contractWhere);
            }
            ])->where('id','=',$customer_id)->find();
        return $results;
    }


}