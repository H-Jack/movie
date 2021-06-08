<?php


namespace app\api\service;
//require_once './vendor/firebase/php-jwt/src/JWT.php';
use \Firebase\JWT\JWT;

class Jwtcustom
{
    public static function getoken($id,$s=0)
    {
        $time = time();  // 当前时间

        $payload = array(
            'iat' => $time,
            'nbf' => $time,
            //'exp' => time()+7200,  //过期时间2h
            'userinfos' => [
                'uid' => $id
            ]
        );
        $access_token = $payload;
        $access_token['scopes'] = 'role_access';  // token标识，请求接口的token
        $access_token['exp'] = $time + (86400 * 3);  // access_token过期时间,这里设置x个小时
        $access_token['to'] = '1';

        $refresh_token = $payload;
        $refresh_token['scopes'] = 'role_refresh';  // token标识，刷新access_token
        $refresh_token['exp'] = $time + (86400 * 7);  // access_token过期时间,这里设置30天

        //返回生成access_token用于接口
        //返回生成refresh_token用于刷新接口
        $tokenList = [
            'access_token' => JWT::encode($access_token,config('wechat.key')),
            'refresh_token' => JWT::encode($refresh_token,config('wechat.key')),
            'token_type' => 'bearer'  // token_type：表示令牌类型，该值大小写不敏感，这里用bearer
        ];

        $tokenLists = [
            'access_token' => JWT::encode($access_token,config('wechat.key')),
            'token_type' => 'bearer'  // token_type：表示令牌类型，该值大小写不敏感，这里用bearer
        ];
        if($s==0){
            return json_encode($tokenList);
        }else{
            return json_encode($tokenLists);
        }
    }
}