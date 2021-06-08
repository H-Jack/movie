<?php


namespace app\wechatpunchin\model;


use think\Model;

class AlladministratorsModel extends Model
{
    protected $table = 'wechatsamll_administrators';


    public function _update($data)
    {
        return $this->save($data);
    }
}