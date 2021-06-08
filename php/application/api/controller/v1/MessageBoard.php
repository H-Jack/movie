<?php


namespace app\api\controller\v1;
use app\api\model\MessageModel;
use app\api\model\WechatUser;
use think\Request;


class MessageBoard
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $db = new MessageModel();
        $list = $db->order("create_time" ,"desc")->limit(30) -> select();  //创建时间倒序select出数据
        return json(['code'=>1, 'msg'=>'ok', 'data'=>$list], 200);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        $data = $request->param();  //获取发布信息
        $wechatmessageboard = new MessageModel();
        $wechatuser = new WechatUser();
        $username = $wechatuser->where('id', $data['userid'])->field('username')->find(); //查询该用户的用户名
        $logo = $wechatuser->where('id', $data['userid'])->field('logo')->find(); //查询该用户的头像
        $lists = json_decode($data['datas'],true);     //对 JSON 格式的字符串进行解码
        $wechatmessageboard->insert(['uid' => $data['userid'],'username' => $username["username"],'logo'=> $logo["logo"],'content' => $lists['content'], 'create_time' => $lists['time']]);
    }
}