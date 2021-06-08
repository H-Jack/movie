<?php


namespace app\api\model;


class WechatMovieactor extends Base
{
    protected $table = 'wechatsamll_movieactor';

    public function index($data)
    {
        $movieid = $data['movieid'];
        $movieactor = \Db::table('wechatsamll_movieactor')->where('movieid',$movieid)->order("create_time")->select(); //该电影的所有演员
        $message = \Db::table('wechatsamll_message')->where('movieid',$movieid)->order("create_time" ,"desc")->select(); //该电影的所有评论
        return [$movieactor,$message];
    }
}