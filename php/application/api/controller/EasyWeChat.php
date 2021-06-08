<?php


namespace app\api\controller;
use EasyWeChat\Factory;

class EasyWeChat
{
    protected static function index()
    {
        $config = [
            'app_id' => 'wx7fc6d03c47afbbe2',
            'secret' => '02fc4038f0ffe0d88f917252cceadb6b',

            // 下面为可选项
            // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
            'response_type' => 'array',

            'log' => [
                'level' => 'debug',
                'file' => __DIR__.'/wechat.log',
            ],
        ];

        $app = Factory::miniProgram($config);
        return $app;
    }

    public static function login_wechat($code)
    {
        $app = self::index();
        $list = $app->auth->session($code);
        return $list;
    }
}