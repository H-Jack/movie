<?php


namespace app\wechatpunchin\controller;


use app\wechatpunchin\model\AllmovieactorModel;
use app\wechatpunchin\model\AllmovieModel;
use app\wechatpunchin\model\AllsinginModel;
use library\Controller;
use think\Request;

class Allsingin extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllSingin
     */
    protected $table = 'WechatsamllSingin';

    /**
     * 进入播放场次首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '播放场次列表';
        $model = new AllmovieModel();
        $administratorsid = $model->index();
        $query = $this->_query($this->table)->like('name,administrators');
        if($administratorsid[1] == "10000"){   //如果是超级管理员则查看所有数据
            $query->dateBetween('create_at')->order('id desc')->page();
        }else{
            $query->dateBetween('create_at')->where('administratorsid',$administratorsid[0])->order('id desc')->page();
        }
    }

    /**
     * @auth true
     * 编辑播放场次
     */
    public function edit()
    {
        $this->title = '编辑播放场次';
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
     * 添加播放场次
     */
    public function add()
    {
        $this->title = '添加播放场次';
        $model = new AllmovieModel();
        $administratorsid = $model->index();
        $model = new AllmovieactorModel();
        $movie = $model->getmoviename();
        $this->assign('moviename',$movie);    //将变量输出到view图层
        if($administratorsid[1] == "10000"){   //如果是超级管理员则查看所有数据
            return ['code'=>0, 'msg'=>'请登录管理员添加！'];
        }else{
            $this->_form($this->table, 'form');
        }
    }

    /**
     * @auth true
     * 保存播放场次
     */
    public function save(Request $request)
    {
        $data = $request->param();
        $db = new AllsinginModel();
        $res = $db->_update($data);
        return ['code'=>1, 'msg'=>'操作成功'];
    }
}