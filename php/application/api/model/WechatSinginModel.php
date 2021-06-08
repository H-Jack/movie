<?php


namespace app\api\model;


class WechatSinginModel extends Base
{
    protected $table = 'wechatsamll_singin';

    public function index($data)
    {
        $movieactor = \Db::table('wechatsamll_singin')->Distinct(true)->where('administratorsid',$data['administratorsid'])->field('movieid')->select(); //该管理员的所有电影
        $movielist=[];
        // $a = $movieactor[2]['movieid'];
        $movie = \Db::table('wechatsamll_singin')->where('movieid',$movieactor[2]['movieid'])->where('administratorsid',$data['administratorsid'])->select();
        foreach($movieactor as $val){
            $movieactor = \Db::table('wechatsamll_movie')->where('id',$val['movieid'])->select(); //该管理员的所有电影
            if($movieactor===[]){
                $movieactor = \Db::table('wechatsamll_nearmovie')->where('id',$val['movieid'])->select(); //该管理员的所有电影
            }
            Array_push($movielist, $movieactor);
        }
        return [$movielist,$movie];
    }

    public function getsingin($data)
    {
        $movie = \Db::table('wechatsamll_singin')->where('movieid',$data['movieid'])->where('administratorsid',$data['administratorsid'])->select();
        return $movie;
    }
}