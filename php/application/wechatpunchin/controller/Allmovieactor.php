<?php


namespace app\wechatpunchin\controller;


use app\wechatpunchin\model\AllmovieactorModel;
use app\wechatpunchin\model\AllmovieModel;
use library\Controller;
use think\Request;

class Allmovieactor extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllMovieactor
     */
    protected $table = 'WechatsamllMovieactor';

    /**
     * 进入演员添加首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '电影演员列表';
        $query = $this->_query($this->table)->like('name,moviename');
        $query->dateBetween('create_at')->order('id desc')->page();
    }

    /**
     * @auth true
     * 编辑演员
     */
    public function edit()
    {
        $this->title = '编辑演员';
        $model = new AllmovieactorModel();
        $movie = $model->getmoviename();
        $this->assign('moviename',$movie);    //将变量输出到view图层
        $this->_form($this->table, 'edit');
    }


    /**
     * @auth true
     * 添加演员
     */
    public function add()
    {
//        $this->title = '添加演员';
//        $model = new AllmovieModel();
//        $administratorsid = $model->index();
//        $model = new AllmovieactorModel();
//        $movie = $model->getmoviename();
//        $this->assign('moviename',$movie);    //将变量输出到view图层
//        if($administratorsid[1] == "10000"){   //如果是超级管理员则查看所有数据
//            return ['code'=>0, 'msg'=>'请登录管理员添加！'];
//        }else{
//            $this->_form($this->table, 'form');
//        }
        $this->title = '添加演员';
        $model = new AllmovieactorModel();
        $movie = $model->getmoviename();
        $this->assign('moviename',$movie);    //将变量输出到view图层
        $this->_form($this->table, 'form');
    }

    /**
     * @auth true
     * 保存演员
     */
    public function save(Request $request)
    {
        $data = $request->param();
        $db = new AllmovieactorModel();
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