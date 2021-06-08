<?php

namespace app\wechatpunchin\controller;

use app\wechatpunchin\model\AllcourseselectionModer;
use library\Controller;
use think\Request;

class Allcourse extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllCourseselection
     */
    protected $table = 'WechatsamllCourseselection';

    /**
     * 进入所属课程首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '老师课程列表';
        $AllcourseorderModer = new AllcourseselectionModer();
        $teacherid = $AllcourseorderModer->index();
        $query = $this->_query($this->table)->like('teachername,coursename');
        if($teacherid[1] == "10000"){   //如果是超级管理员则查看所有数据
            $query->dateBetween('create_at')->order('id desc')->page();
        }else{
            $query->dateBetween('create_at')->where('teacherid',$teacherid[0])->order('id desc')->page();
        }
    }

    /**
     * @auth true
     * 添加课程
     */
    public function add()
    {
        $this->title = '添加课程';
        $AllcourseorderModer = new AllcourseselectionModer();
        $teacherid = $AllcourseorderModer->index();
        if($teacherid[0] == "10000") {   //如果是超级管理员则查看所有数据
            return ['code'=>0, 'msg'=>'请登录老师账号添加！'];
        }else{
            $this->_form($this->table, 'form');
        }
    }

    /**
     * @auth true
     * 保存讲师预约
     */
    public function save(Request $request)
    {
        $data = $request->param();
        $db = new AllcourseselectionModer();
        $res = $db->_update($data);
        if(!$res == 0){
            return ['code'=>1, 'msg'=>'操作成功'];
        }else{
            return ['code'=>0, 'msg'=>'请登录老师账号预约！'];
        }
    }

    /**
     * @auth true
     * 编辑课程
     */
    public function edit()
    {
        $this->title = '编辑课程';
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