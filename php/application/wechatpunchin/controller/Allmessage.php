<?php


namespace app\wechatpunchin\controller;


use app\wechatpunchin\model\AllmessageModel;
use library\Controller;
use think\Request;

class Allmessage extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllMessage
     */
    protected $table = 'WechatsamllMessage';

    /**
     * 进入电影影评首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '电影影评列表';
        $model = new AllmessageModel();
        $administratorsid = $model->index();
        $query = $this->_query($this->table)->like('name,moviename');
        if($administratorsid[1] == "10000"){   //如果是超级管理员则查看所有数据
            $query->dateBetween('create_at')->order('id desc')->page();
        }else{
            $query->dateBetween('create_at')->where('administratorsid',$administratorsid[0])->order('id desc')->page();
        }
    }


    /**
     * @auth true
     * 编辑影评
     */
    public function edit()
    {
        $this->title = '编辑影评';
        $this->_form($this->table, 'edit');
    }

    /**
     * @auth true
     * 保存电影
     */
    public function save(Request $request)
    {
        $data = $request->param();
        $db = new AllmessageModel();
        $res = $db->_update($data);
        return ['code'=>1, 'msg'=>'操作成功'];
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