<?php


namespace app\wechatpunchin\controller;


use app\wechatpunchin\model\AlladministratorsModel;
use library\Controller;
use think\Request;

class Alladministrators extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllAdministrators
     */
    protected $table = 'WechatsamllAdministrators';

    /**
     * 进入电影管理员首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '电影管理员列表';
        $query = $this->_query($this->table)->like('name,cinemaname');
        $query->dateBetween('create_at')->order('id desc')->page();
    }

    /**
     * @auth true
     * 添加课程
     */
    public function add()
    {
        $this->title = '添加影院管理员';
        $this->_form($this->table, 'form');
    }

    /**
     * @auth true
     * 保存讲师预约
     */
    public function save(Request $request)
    {
        $data = $request->param();
        $db = new AlladministratorsModel();
        $res = $db->_update($data);
        return ['code'=>1, 'msg'=>'操作成功'];
    }

    /**
     * @auth true
     * 编辑管理员信息
     */
    public function edit()
    {
        $this->title = '编辑管理员信息';
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