<?php


namespace app\wechatpunchin\controller;


use app\wechatpunchin\model\AllmovieModel;
use library\Controller;
use think\facade\Env;
use think\Request;
use PHPExcel;
use PHPExcel_IOFactory;

class Allmovie extends Controller
{
    /**
     * 绑定当前数据表
     * @var string WechatsamllMovie
     */
    protected $table = 'WechatsamllMovie';

    /**
     * 进入电影添加首页
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->title = '电影管理列表';
        $query = $this->_query($this->table)->like('name,administrators');
        $query->dateBetween('create_at')->order('buynumber desc')->page();
    }

    /**
     * @auth true
     * 编辑电影
     */
    public function edit()
    {
        $this->title = '编辑电影';
        $model = new AllmovieModel();
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
//        $this->title = '添加电影';
//        $model = new AllmovieModel();
//        $administratorsid = $model->index();
//        $time = $model->gettime();
//        $this->assign('date',$time);    //将变量输出到view图层
//        if($administratorsid[1] == "10000"){   //如果是超级管理员则查看所有数据
//            return ['code'=>0, 'msg'=>'请登录管理员账号添加！'];
//        }else{
//            $this->_form($this->table, 'form');
//        }
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
        $db = new AllmovieModel();
        $res = $db->_update($data);
        return ['code'=>1, 'msg'=>'操作成功'];
    }


    //导入
    public function upload()
    {
        $file = request()->file('file');
        $obj_phpexcel = new PHPExcel();
        $dir = "../public/upload";
            $info = $file->validate([
                'size'=>314564,
                'ext'=>'xls,xlsx,csv'
            ]) ->rule('uniqid') ->move($dir);
                $filename = $dir.'\\'.$info->getSaveName();
                $fileType = PHPExcel_IOFactory::identify($filename);
                $reader = PHPExcel_IOFactory::createReader($fileType);
        $objReader = PHPExcel_IOFactory::createReader($fileType);
        $inputdata = $_FILES;
        $objData = $objReader->load($filename);
        $excel_array = $objData->getSheet(0)->toArray();
      //  unset($excel_array[0]);
        $num = 0;
        $insertData = [];
        foreach ($excel_array as $key => $value) {
            $insertData[$num]['name'] = $value[0];
            $insertData[$num]['logo'] = $value[1];
            $insertData[$num]['type'] = $value[2];
            $num++;
        }
        $model = new AllmovieModel();
        $res = $model->saveAll($insertData);
        if($res){
            return json(['code'=>1, 'msg'=>'导入成功！']);
        }else{
            return json(['code'=>0, 'msg'=>'导入失败！']);
        }
    }



    //导出
    public function export($fileName='电影列表',$headArr = ['id','name','logo','type','introduction','country','lead','score'])
    {
        $fileName .= "_".date("Ymd_His",time()) .".xlsx";
        $objPHPExcel = new PHPExcel();
        //设置文档属性
        $objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
                                     ->setLastModifiedBy("Maarten Balliauw")
                                     ->setTitle("office 2007 XLSX Test Document")
                                     ->setSubject("office 2007 XLSX Test Document")
                                     ->setDescription("Test document for office 2007 XLSX,generated using OHO classes.")
                                     ->setKeywords("office 2007 openxml php")
                                     ->setCategory("Test result file");
        //设置头信息
        $objPHPExcel->setActiveSheetIndex(0);
        $key = ord('A');
        foreach ($headArr as $v){
            $colum = chr($key);
            $objPHPExcel->getActiveSheet()->setCellValue($colum.'1',$v);
            $key += 1;
        }
        //获取管理员全部信息
        $model = new AllmovieModel();
        $db = $model::all();
        $data = $db->toArray();
        $colum = 2;
        foreach ($data as $key => $rows){   //行写入
            $span = ord("A");
            foreach ($data[$key] as $keyName => $value){    //列写入
                $objPHPExcel->getActiveSheet()->setCellValue(chr($span) . $colum, $value);
                $span++;
            }
            $colum++;
        }
        $objPHPExcel->setActiveSheetIndex(0);   //设置活动单指数到第一个表，所以Excel打开这是第一个表
        $dir = "../public/upload";
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save(str_replace('.php','.xls',Env::get('runtime_path').$fileName));
        return json(['code'=>1, 'msg'=>'导出成功,请去目录'.Env::get('runtime_path').'查看！文件：'.$fileName]);
    }

}




























