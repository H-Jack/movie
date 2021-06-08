<?php
namespace app\api\controller\v1;

use think\Request;
use app\api\controller\EasyWeChat;
use app\api\model\WechatUser;
use app\api\service\Jwtcustom;
use Firebase\JWT\JWT;
class Login
{
    public function login(Request $request)
    {
        //微信获取code和个人信息
        $data = $request->param();
        $data2 = json_decode($data['data2']);
        $data = json_decode($data['data']);
        
        //通过code获取openid
        $wechatlist = EasyWeChat::login_wechat(current($data));

        //通过openid数据库查询判断是否为新用户，为新用户将openid等信息插入数据库并返回给token
        $wechatuser = new WechatUser;
        $list = $wechatuser->selectuser($wechatlist['openid'],$data2);
        $id =\Db::table('wechat_user')->where('openid',$wechatlist['openid'])->value('id');
        if(is_string($list)){
            $tokenList = Jwtcustom::getoken($list);
        }else{
            $tokenList = Jwtcustom::getoken($list);
        }

        return json(['msg'=>'ok','tokenList'=>$tokenList,'id'=>$id],200);
    }


    public function webregistered(Request $request){
        $data = $request->param();
        $webuser = new WechatUser();
        $list = $webuser->webuserregistered($data);
        return $list;
    }


    public function weblogin(Request $request){
        $data = $request->param();
        $webuser = new WechatUser();
        $list = $webuser->webuserlogin($data);
        return $list;
    }
}