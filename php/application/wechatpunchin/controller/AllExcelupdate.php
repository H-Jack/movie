<?php


namespace app\wechatpunchin\controller;


use think\Controller;
use PHPExcel;

class AllExcelupdate extends Controller
{
    public function upload()
    {
//        $file = request()->file('excel');

        //实例化类库
        $obj_phpexcel = new \PHPExcel();
        $objReader = \PHPExcel_IComparable::createReader('Excel5');

        //接收文件
        $inputdata = $_FILES;

        //获取并处理数据
        $objData = $objReader->load($inputdata['file']['tmp_name'],$encode = 'utf-8');
        $excel_array = $objData->getsheet(0)->toArray();
        unset($excel_array[0]);
    }
}