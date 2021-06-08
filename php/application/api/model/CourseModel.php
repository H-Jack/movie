<?php


namespace app\api\model;


class CourseModel extends Base
{
    protected $table = 'wechatsamll_courseselection';

    public function listt($courseid)
    {
        $courselist = \Db::table('wechatsamll_courseselection')->where('id',$courseid)->field('id',true)->find();
        return $courselist;
    }
}