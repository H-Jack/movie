<?php


namespace app\wechatpunchin\controller;


use library\Controller;

class Allorder extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllOrder
     */
    protected $table = 'WechatsamllOrder';

    /**
     * 进入订单首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '订单列表';
        $system_user_id = Cache('system_user_id');      //当前管理者登录id（system_user）
        $administratorsphone = \Db::table('system_user')->where('id',$system_user_id)->value('phone'); //管理者手机号码
        $administratorsid = \Db::table('wechatsamll_administrators')->where('phone',$administratorsphone)->value('id'); //管理者id
        $cinemaname = \Db::table('wechatsamll_administrators')->where('id',$administratorsid)->value('cinemaname'); //管理者所管理电影的名字
        $query = $this->_query($this->table)->like('username,coursename,teachername');
        if($system_user_id == "10000"){   //如果是超级管理员则查看所有数据
            $query->dateBetween('create_at')->order('id desc')->page();
        }else{
            $query->dateBetween('create_at')->where('cinemaname',$cinemaname)->order('id desc')->page();
        }
    }

    /**
     * @auth true
     * 编辑订单
     */
    public function edit()
    {
        $this->title = '编辑订单';
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