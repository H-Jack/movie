<?php
namespace app\wechatpunchin\model;

use think\Model;

class AllteacherModer extends Model
{
    protected $table = 'wechatsamll_teachersyno';
    public function _update($data)
    {
        if(isset($data['id'])){
            return $this->save($data,['id'=>$data['id']]);
        }else{
            return $this->save($data);
        }
    }
}