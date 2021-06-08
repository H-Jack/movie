<?php


namespace app\api\model;


class CourseOrder extends Base
{
    protected $table = 'wechatsamll_courseorder';

    public function _update($data,$userid,$username,$courseid)
    {
        $teacherarr = ["userid" => $userid, "username" => $username,"courseid"=>$courseid];
        $data = array_merge($data,$teacherarr);
        return $this->save($data);
    }

}