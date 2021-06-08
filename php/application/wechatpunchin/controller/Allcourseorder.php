<?php

namespace app\wechatpunchin\controller;

use library\Controller;

class Allcourseorder extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllCourseorder
     */
    protected $table = 'WechatsamllCourseorder';

    /**
     * 进入已选课程首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '已选课程列表';
        $query = $this->_query($this->table)->like('username,coursename,teachername');
        $query->dateBetween('create_at')->order('id desc')->page();
    }

    /**
     * @auth true
     * 编辑已选课程
     */
    public function edit()
    {
        $this->title = '编辑已选课程';
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