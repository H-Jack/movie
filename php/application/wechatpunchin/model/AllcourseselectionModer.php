<?php
namespace app\wechatpunchin\model;

use think\Model;
use think\Cache;

class AllcourseselectionModer extends Model
{
    protected $table = 'wechatsamll_courseselection';

    public function index()
    {
        $system_user_id = Cache('system_user_id');      //当前讲师登录id（system_user）
        $teacherphone = \Db::table('system_user')->where('id',$system_user_id)->value('phone'); //老师手机号码
        $teacherid = \Db::table('wechatsamll_teachersyno')->where('phone',$teacherphone)->value('id'); //老师表id
        return array($teacherid,$system_user_id);
    }


    public function _update($data)
    {
        $system_user_id = Cache('system_user_id');      //当前讲师登录id（system_user）
        $teacherphone = \Db::table('system_user')->where('id',$system_user_id)->value('phone'); //老师手机号码
        $teacherid = \Db::table('wechatsamll_teachersyno')->where('phone',$teacherphone)->value('id'); //老师表id
        $teachername = \Db::table('wechatsamll_teachersyno')->where('phone',$teacherphone)->value('teachername'); //老师名
        if($teacherphone == ""){
            return 0;
        }
        $teacherarr = ["teachername" => $teachername, "teacherid" => $teacherid];
        $data = array_merge($data,$teacherarr);
        return $this->save($data);
    }
}