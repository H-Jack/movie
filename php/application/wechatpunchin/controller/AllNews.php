<?php


namespace app\wechatpunchin\controller;


use app\wechatpunchin\model\AllinformationModel;
use app\wechatpunchin\model\AllnewsModel;
use library\Controller;
use think\Request;


class AllNews extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllNews
     */
    protected $table = 'WechatsamllNews';

    /**
     * 进入行业新闻页面
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '行业新闻';
        $query = $this->_query($this->table);
        $query->dateBetween('create_at')->order('id desc')->page();
    }

    /**
     * @auth true
     * 编辑行业新闻
     */
    public function edit()
    {
        $this->title = '编辑行业新闻';
        $this->_form($this->table, 'edit');
    }

    /**
     * @auth true
     * 添加行业新闻
     */
    public function add()
    {
        $this->title = '添加行业新闻';
        $this->_form($this->table, 'form');
    }

    /**
     * @auth true
     * 保存新闻资讯
     */
    public function save(Request $request)
    {
        $data = $request->param();
        $db = new AllnewsModel();
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