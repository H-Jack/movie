<?php


namespace app\wechatpunchin\model;


use app\api\model\Base;

class AllsinginModel extends Base
{
    protected $table = 'wechatsamll_singin';

    public function _update($data)
    {
        $system_user_id = Cache('system_user_id');      //当前管理者登录id（system_user）
        $administratorsphone = \Db::table('system_user')->where('id',$system_user_id)->value('phone'); //管理者手机号码
        $administratorsid = \Db::table('wechatsamll_administrators')->where('phone',$administratorsphone)->value('id'); //管理者id
        $administratorsname = \Db::table('wechatsamll_administrators')->where('phone',$administratorsphone)->value('name'); //管理者名
        $movieid = \Db::table('wechatsamll_movie')->where('name',$data['moviename'])->value('id'); //电影id
        if($movieid===null){
            $movieid = \Db::table('wechatsamll_nearmovie')->where('name',$data['moviename'])->value('id');
        }
        if($administratorsphone == ""){
            return 0;
        }
        $teacherarr = ["administrators" => $administratorsname, "administratorsid" => $administratorsid,'movieid' => $movieid];
        $data = array_merge($data,$teacherarr);
        return $this->save($data);
    }
}