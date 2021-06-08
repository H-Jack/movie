<?php

namespace app\wechatpunchin\controller;

use app\wechatpunchin\model\AllteacherModer;
use library\Controller;

class Allteacher extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllTeachersyno
     */
    protected $table = 'WechatsamllTeachersyno';

    /**
     * 进入老师管理首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '老师管理列表';
        $query = $this->_query($this->table)->like('teachername,phone');
        $query->dateBetween('create_at')->order('id desc')->page();
    }

    /**
     * @auth true
     * 添加老师
     */
    public function add()
    {
        $this->title = '添加教师';
        $this->_form($this->table, 'form');
    }

    /**
     * @auth true
     * 保存老师信息
     */
    public function save(Request $request)
    {
        $data = $request->param();
        $db = new AllteacherModer();
        $res = $db->_update($data);
        if($res){
            return ['code'=>1, 'msg'=>'操作成功'];
        }else{
            return ['code'=>0, 'msg'=>'操作失败'];
        }
    }

    /**
     * @auth true
     * 编辑老师
     */
    public function edit()
    {
        $this->title = '编辑教师';
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