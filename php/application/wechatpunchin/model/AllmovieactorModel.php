<?php


namespace app\wechatpunchin\model;


use app\api\model\Base;

class AllmovieactorModel extends Base
{
    protected $table = 'wechatsamll_movieactor';


    public function _update($data)
    {
        $movieid = \Db::table('wechatsamll_movie')->where('name',$data['moviename'])->value('id');
        if($movieid===null){
            $movieid = \Db::table('wechatsamll_nearmovie')->where('name',$data['moviename'])->value('id');
        }
        $teacherarr = ["movieid" => $movieid];
        $data = array_merge($data,$teacherarr);
        return $this->save($data);
    }

    public function getmoviename()
    {
        $system_user_id = Cache('system_user_id');      //当前管理者登录id（system_user）
        $administratorsphone = \Db::table('system_user')->where('id',$system_user_id)->value('phone'); //管理者手机号码
        $administratorsid = \Db::table('wechatsamll_administrators')->where('phone',$administratorsphone)->value('id'); //管理者id
        $data = \Db::table('wechatsamll_movie')->field('name')->select();
        $nearmovieac = \Db::table('wechatsamll_nearmovie')->field('name')->select();
        $device_number_list=[];
        foreach($data as $val){
            $list = $val;
            Array_push($device_number_list, $list["name"]);
        }
        foreach($nearmovieac as $val){
            $list = $val;
            Array_push($device_number_list, $list["name"]);
        }
        return $device_number_list;
    }

}