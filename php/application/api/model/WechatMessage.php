<?php


namespace app\api\model;


class WechatMessage extends Base
{
    protected $table = 'wechatsamll_message';


    public function add($data){
        $userid = \Db::table('wechat_user')->where('username',$data['username'])->value('id');
        $list = $this->insert([
            'userid'=> $userid,
            'username' => $data["username"],
            'logo' => "http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg",
            'content'=> $data['content'],
            'movieid'=>$data['movieid']
        ]);
        return $list;
    }
}