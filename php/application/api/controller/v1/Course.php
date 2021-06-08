<?php


namespace app\api\controller\v1;


use app\api\model\CourseModel;
use app\api\model\CourseOrder;
use app\api\model\WechatUser;
use think\Request;

class Course
{
    public function index()
    {
        $db = new CourseModel();
        $list = $db -> select();  //创建时间倒序select出数据
        return json(['code'=>1, 'msg'=>'ok', 'data'=>$list], 200);
    }

    public function teachercourselist(Request $request)
    {
        $data = $request->param();  //获取用户编辑数据
        $db = new CourseModel();
        $list = $db->where('teacherid',$data['teacherid'])->select();
        return json(['code'=>1, 'msg'=>'ok', 'data'=>$list], 200);
    }

    public function courseorder(Request $request)
    {
        $data = $request->param();  //获取用户编辑数据
        $CourseModel = new CourseModel();
        $Courselist = $CourseModel->listt($data['courseid']);
        $WechatUser = new WechatUser();
        $username = $WechatUser->where('id',$data['userid'])->value('username');    //用户名
        $CourseOrder = new CourseOrder();
        $number = $CourseOrder->where('courseid',$data['courseid'])->where('userid',$data['userid'])->findOrEmpty()->toArray();
        if(count($number)>0){
            return json(['status'=>false], 200);
        }else{
            $CourseOrder->_update($Courselist,$data['userid'],$username,$data['courseid']);    //更新数据
            return json(['status'=>true], 200);
        }
    }

    public function order(Request $request)
    {
        $data = $request->param();  //获取用户编辑数据
        $order = new CourseOrder();
        $list = $order->where('userid',$data['userid'])->select();
        return json(['data'=>$list], 200);
    }
}