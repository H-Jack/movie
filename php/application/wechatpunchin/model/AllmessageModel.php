<?php


namespace app\wechatpunchin\model;


use app\api\model\Base;

class AllmessageModel extends Base
{
    protected $table = 'wechatsamll_message';

    public function index()
    {
        $system_user_id = Cache('system_user_id');      //当前管理者登录id（system_user）
        $administratorsphone = \Db::table('system_user')->where('id',$system_user_id)->value('phone'); //管理者手机号码
        $administratorsid = \Db::table('wechatsamll_administrators')->where('phone',$administratorsphone)->value('id'); //管理者id
        return array($administratorsid,$system_user_id);
    }


    public function _update($data)
    {
        $this->save($data);
//        $movieid = \Db::table('wechatsamll_movie')->where('name',$data['moviename'])->value('id');
//        $system_user_id = Cache('system_user_id');      //当前管理者登录id（system_user）
//        $administratorsphone = \Db::table('system_user')->where('id',$system_user_id)->value('phone'); //管理者手机号码
//        $administratorsid = \Db::table('wechatsamll_administrators')->where('phone',$administratorsphone)->value('id'); //管理者id
//        $administratorsname = \Db::table('wechatsamll_administrators')->where('phone',$administratorsphone)->value('name'); //管理者名
//        if($administratorsphone == ""){
//            return 0;
//        }
//        $teacherarr = ["movieid" => $movieid, "administrators" => $administratorsname, "administratorsid" => $administratorsid];
//        $data = array_merge($data,$teacherarr);
//        return $this->save($data);
    }
}