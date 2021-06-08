<?php

namespace app\wechatpunchin\controller;

use library\Controller;

class Alluser extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatBlog
     */
    protected $table = 'WechatUser';

    /**
     * 进入用户首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '用户信息列表';
        $query = $this->_query($this->table)->like('username');
        $query->dateBetween('create_at')->order('id desc')->page();
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