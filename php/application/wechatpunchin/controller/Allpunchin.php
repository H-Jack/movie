<?php


namespace app\wechatpunchin\controller;



use library\Controller;

class Allpunchin extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllPunchin
     */
    protected $table = 'WechatsamllPunchin';

    /**
     * 进入打卡记录管理首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '打卡记录';
        $query = $this->_query($this->table)->like('username');
        $query->dateBetween('create_at')->order('id desc')->page();
    }
}