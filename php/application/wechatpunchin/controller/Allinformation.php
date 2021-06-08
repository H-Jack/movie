<?php


namespace app\wechatpunchin\controller;


use app\wechatpunchin\model\AllinformationModel;
use library\Controller;
use think\Request;


class Allinformation extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllInformation
     */
    protected $table = 'WechatsamllInformation';

    /**
     * 进入新闻资讯页面
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '新闻资讯';
        $query = $this->_query($this->table);
        $query->dateBetween('create_at')->order('id desc')->page();
    }

    /**
     * @auth true
     * 编辑新闻资讯
     */
    public function edit()
    {
        $this->title = '编辑新闻资讯';
        $this->_form($this->table, 'edit');
    }

    /**
     * @auth true
     * 添加新闻资讯
     */
    public function add()
    {
        $this->title = '添加新闻资讯';
        $this->_form($this->table, 'form');
    }

    /**
     * @auth true
     * 保存新闻资讯
     */
    public function save(Request $request)
    {
        $data = $request->param();
        $db = new AllinformationModel();
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