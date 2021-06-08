<?php


namespace app\api\model;


class WechatMovie extends Base
{
    protected $table = 'wechatsamll_movie';

    public function index($data)
    {
        $list = \Db::table('wechatsamll_movie')->where('administratorsid',$data['administratorsid'])->select();   //输出该管理员的所有电影
        return $list;
    }

    public function moviename($data)
    {
        $list = \Db::table('wechatsamll_movie')->where('id',$data['movieid'])->select();   //输出该管理员的所有电影
        $movieid = $data['movieid'];
        $movieactor = \Db::table('wechatsamll_movieactor')->where('movieid',$movieid)->order("create_time")->select(); //该电影的所有演员
        $message = \Db::table('wechatsamll_message')->where('movieid',$movieid)->order("create_time" ,"desc")->select(); //该电影的所有评论
        $nearmovie = \Db::table('wechatsamll_nearmovie')->where('id',$data['movieid'])->select(); //该管理员的所有电影
        return [$movieactor,$message,$nearmovie,$list];
    }
}