<?php


namespace app\api\validate;


use think\Validate;

class BaseValidate extends Validate
{
    public function goCheck()
    {
        //获取http传入的参数
        //对这些参数做校验
        $request = Request::instance();
        $parms = $request->param();

        $result = $this->batch()->check($parms);
        if(!$result)
        {
            $e = new ParameterException([
                'msg' => $this->error,
            ]);
            throw $e;
        }
        else
        {
            return true;
        }
    }

    protected function isNotEmpty($value,$rule='',$data='',$field='')
    {
        if (empty($value))
        {
            return false;
        } else
        {
            return true;
        }
    }
}