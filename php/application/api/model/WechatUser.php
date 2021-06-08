<?php
namespace app\api\model;

class WechatUser extends Base
{
    protected $table = 'wechat_user';

    //判断新用户，插入用户数据
    public function selectuser($openid,$userinfo)
    {
        $list = $this->where('openid',$openid)->find();
        if($list)
            return $list;

        $uid = $this->allowField(true)->insertGetId([
            'openid' => $openid,
            'username' => $userinfo[1],
            'logo'      => $userinfo[0],
            'password'  => '123456'
        ]);
    }

    public function webuserregistered($data){
        $username = $this->where('username',$data['username'])->value('username');
        if($username){
            return json("该用户已注册!");
        }
        $this->insert([
                'username' => $data['username'],
                'password' => $data["password"]
            ]
        );
        return json("注册成功！");
    }

    public function webuserlogin($data){
        $username = $this->where('username',$data['username'])->value('username');
        if(!$username){
            return json("该用户未注册!");
        }
        $password = $this->where('username',$data['username'])->where('password',$data['password'])->value('password');
        if($password == null){
            return json("密码错误!");
        }
        return json("登录成功！");
    }

    public function editpas($data)
    {
        $password = $this->where('username',$data['username'])->value('password');
        if($data['oldpassword'] == $password){
            $this->where('username',$data['username'])->update(['password'=>$data['newpassword']]);
            return true;
        }else{
            return false;
        }
    }

    public function _update($data,$id)
    {
        if(isset($id)){
            return $this->save($data,['id'=>$id]);
        }else{
            return $this->save($data);
        }
    }
}