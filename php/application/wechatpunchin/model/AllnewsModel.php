<?php


namespace app\wechatpunchin\model;


use app\api\model\Base;

class AllnewsModel extends Base
{
    protected $table = 'wechatsamll_news';


    public function _update($data)
    {
        return $this->save($data);
    }
}