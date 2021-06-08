<?php

namespace app\wechatpunchin\controller;

use library\Controller;

class Allmessageboard extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatMessageboard
     */
    protected $table = 'WechatMessageboard';

    /**
     * 进入留言板首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '留言板列表';
        $query = $this->_query($this->table);
        $query->dateBetween('create_at')->order('id desc')->page();
    }

    /**
     * @auth true
     * 编辑留言板
     */
    public function edit()
    {
        $this->title = '编辑留言板';
        $this->_form($this->table, 'edit');
    }

    /**
     * @auth true
     * 删除
     */
    public function remove()
    {
        $this->applyCsrfToken();
        $this->_delete($this->table);
    }
}