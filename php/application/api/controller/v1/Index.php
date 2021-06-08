<?php


namespace app\api\controller\v1;


use app\api\model\CourseOrder;
use app\api\model\WechatAddress;
use app\api\model\WechatMessage;
use app\api\model\WechatMovie;
use app\api\model\WechatOrder;
use app\api\model\WechatMovieactor;
use app\api\model\WechatSinginModel;
use app\api\model\WechatTeacher;
use app\api\model\WechatUser;
use think\Request;
use think\db\Where;

class Index
{

    //web接口
    public function movieactormessage(Request $request)         //接收电影id，发送对应电影详情、电影评论、电影演员
    {
        $data = $request->param();  //获取用户编辑数据
        $WechatMovie = new WechatMovie();
        $WechatMovielist = $WechatMovie->moviename($data);
        return json(['data'=>$WechatMovielist]);
    }

    public function addmessage(Request $request)        //web端电影影评
    {
        $data = $request->param();
        $message = new WechatMessage();
        $list = $message->add($data);
        return json("评价成功");
    }

    public function weborderadd(Request $request)      //web添加订单接口
    {
        $data = $request->param();
        $model = new WechatOrder();
        $list = $model->add($data);
        return json("添加订单成功");
    }

    public function weborder(Request $request)      //web订单接口
    {
        $data = $request->param();
        $movieactor = \Db::table('wechatsamll_order')->where('username',$data['username'])->order('id desc')->select(); //该用户所有订单
        return json(['data'=>$movieactor]);
    }

    public function editpassword(Request $request)         //web修改密码
    {
        $data = $request->param();
        $db = new WechatUser();
        $data = $db->editpas($data);
        return json(['password'=>$data]);
    }

    public function webdeleteorder(Request $request)        //web取消订单
    {
        $data = $request->param();
        $db = new WechatOrder();
        $data = $db->webdeleteor($data);
        return json(['data'=>$data]);
    }







    //小程序接口
    public function movie()         //获取电影
    {
        $db = new WechatMovie();
        $list = $db -> select();
        $nearmovie = \Db::table('wechatsamll_nearmovie')->select();
        return json(['data'=>$list,'nearmovie'=>$nearmovie]);
    }

    public function allmovie(Request $request)  //通过传入管理员id，输出所管理的所有电影
    {
        $data = $request->param();  //获取用户数据
        $db = new WechatSinginModel();
        $list = $db->index($data);
        return json(['data'=>$list]);
    }

    public function allsingin(Request $request)    //通过传入电影id 管理员id, 输出所有场次
    {
        $data = $request->param();  //获取用户数据
        $db = new WechatSinginModel();
        $list = $db->getsingin($data);
        return json(['data'=>$list]);
    }


    public function movieactor(Request $request)    //获取相对应演员、评论
    {
        $data = $request->param();  //获取用户数据
        $model = new WechatMovieactor($data);
        $list = $model->index($data);
        return json(['data'=>$list]);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function message(Request $request)   //电影评论
    {
        $data = $request->param();  //获取发布信息
        $wechatmessageboard = new WechatMessage();
        $wechatuser = new WechatUser();
        $wechatmovie = new WechatMovie();
        $username = $wechatuser->where('id', $data['userid'])->field('username')->find(); //查询该用户的用户名
        $logo = $wechatuser->where('id', $data['userid'])->field('logo')->find(); //查询该用户的头像
        $lists = json_decode($data['datas'],true);     //对 JSON 格式的字符串进行解码
        $wechatmessageboard->insert(['userid' => $data['userid'],'username' => $username["username"],'logo'=> $logo["logo"],'movieid'=> $data['movieid'],'content' => $lists['content'], 'create_time' => $lists['time']]);
    }

    public function address()
    {
        $db = new WechatAddress();
        $list = $db -> select();
        return json(['data'=>$list]);
    }

    public function orderadd(Request $request)      //保存订单
    {
        $data = $request->param();
        $model = new WechatOrder();
        \Db::table('wechatsamll_movie')->where('id',$data["movieid"])->setInc('buynumber');
        $model->insert([
            'userid' => $data['userid'],
            'username' => $data["username"],
            'cinemaname' => $data["cinemaname"],
            'cinemaaddress' => $data["cinemaaddress"],
            'movieid' => $data["movieid"],
            'moviename' => $data["moviename"],
            'Sessions' => $data["sessions"],
            'room' => $data['room'],
            'money' => $data['money'],
            'ordernumber' => $data['ordernumber'],
            'time' => $data['time'],
            'logo'=>$data['logo'],
            'seat'=>$data['seat']
            ]
        );
    }

    public function order(Request $request)
    {
        $data = $request->param();  //获取发布信息
        $movieactor = \Db::table('wechatsamll_order')->where('userid',$data['userid'])->order('id desc')->select(); //该用户所有订单
        return json(['data'=>$movieactor]);
    }


    public function search(Request $request)
    {
        $data = $request->param();  //获取搜索内容
        $myword2 = trim($data['searchvalue']);  //过滤空格

        //当提交空白数据时
        if(empty($myword2)){
            //创建数组
            $arr = array(
                "empty" => "搜索不到数据..."
            );
            //将数组转换成json
            $data = json_encode($arr);
            return json(['data' => false,'movie'=>false]);
        }else{
            //过滤表单特殊字符
            $replace = array('!','@','#','$','%','^','&','*','(',')','+','-','=','{','}','[',']',':',';','"',',','<','.','>','.','/','?','|');
            $myword3 = str_replace($replace, '', $myword2);

            //查询数据库
            $movie = \Db::table('wechatsamll_movie')->where('name','like','%'.$myword3.'%')->select();
            $administrators = \Db::table('wechatsamll_administrators')->where('cinemaname','like','%'.$myword3.'%')->select();
            if($administrators||$movie){
                return json(['data' => $administrators,'movie'=>$movie]);
            }else{
                return json(['data' => false,'movie'=>false]);
            }
        }
    }

    public function deleteorder(Request $request)
    {
        $data = $request->param();
        $db = new WechatOrder();
        $data = $db->deleteor($data);
        return json(['data'=>$data]);
    }


    public function classification(Request $request)
    {
        $data = $request->param();  //获取搜索内容
        //查询数据库
        $movie = \Db::table('wechatsamll_movie')->where('type','like','%'.$data['searchvalue'].'%')->order('score desc')->select();
        return json(['movie'=>$movie]);
    }

    public function information()
    {
        $information = \Db::table('wechatsamll_information')->select(); //该用户所有订单
        return json(['information'=>$information]);
    }

}