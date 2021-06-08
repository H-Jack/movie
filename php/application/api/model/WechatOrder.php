<?php


namespace app\api\model;


class WechatOrder extends Base
{
    protected $table = 'wechatsamll_order';


    public function add($data)
    {
        $userid = \Db::table('wechat_user')->where('username',$data['username'])->value('id');
        \Db::table('wechatsamll_movie')->where('id',$data["movieid"])->setInc('buynumber'); //每次购买数量+1
        $list = $this->insert([
            'userid' => $userid,
            'username' => $data["username"],
            'cinemaname' => $data["cinemaname"],
            'cinemaaddress' => $data["cinemaaddress"],
            'movieid' => $data["movieid"],
            'moviename' => $data["moviename"],
            'Sessions' => $data["sessions"],
            'room' => $data['room'],
            'money' => $data['money'],
            'ordernumber' => $data['ordernumber'],
            'time' => $data['time'],
            'logo'=>$data['logo'],
            'seat'=>$data['seat']
        ]);
        return $list;
    }

    public function deleteor($data)
    {
        $movieid = $this->where('userid',$data['userid'])->where('id',$data['orderid'])->value('movieid');      //电影id
        \Db::table('wechatsamll_movie')->where('id',$movieid)->setDec('buynumber'); //每次购买数量-1
        $this->where('userid',$data['userid'])->where('id',$data['orderid'])->delete();
        return true;
    }

    public function webdeleteor($data)
    {
        $movieid = $this->where('username',$data['username'])->where('id',$data['orderid'])->value('movieid');      //电影id
        \Db::table('wechatsamll_movie')->where('id',$movieid)->setDec('buynumber'); //每次购买数量-1
        $this->where('username',$data['username'])->where('id',$data['orderid'])->delete();
        return true;
    }
}