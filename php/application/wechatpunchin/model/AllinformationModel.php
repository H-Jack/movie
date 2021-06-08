<?php


namespace app\wechatpunchin\model;


use app\api\model\Base;

class AllinformationModel extends Base
{
    protected $table = 'wechatsamll_information';


    public function _update($data)
    {
        return $this->save($data);
    }
}