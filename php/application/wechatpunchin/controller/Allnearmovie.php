<?php


namespace app\wechatpunchin\controller;


use app\wechatpunchin\model\AllmovieModel;
use app\wechatpunchin\model\AllnearmovieModel;
use library\Controller;
use think\facade\Env;
use think\Request;
use PHPExcel;
use PHPExcel_IOFactory;

class Allnearmovie extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllNearmovie
     */
    protected $table = 'WechatsamllNearmovie';

    /**
     * 进入预售电影添加首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '电影管理列表';
        $query = $this->_query($this->table)->like('name,administrators');
        $query->dateBetween('create_at')->order('id desc')->page();
    }

    /**
     * @auth true
     * 编辑电影
     */
    public function edit()
    {
        $this->title = '编辑电影';
        $model = new AllnearmovieModel();
        $time = $model->gettime();
        $this->assign('date',$time);    //将变量输出到view图层
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

    /**
     * @auth true
     * 添加电影
     */
    public function add()
    {
        $this->title = '添加电影';
        $this->_form($this->table, 'form');
    }

    /**
     * @auth true
     * 保存电影
     */
    public function save(Request $request)
    {
        $data = $request->param();
        $db = new AllnearmovieModel();
        $res = $db->_update($data);
        return ['code'=>1, 'msg'=>'操作成功'];
    }

}




























