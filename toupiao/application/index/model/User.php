<?php
namespace app\index\model;
use think\Model;
class User extends Model
{
    public function addUser(){
        $userinfo = session("userinfo");
        $res = db('user2') ->where('u_openid',$userinfo['openid'])->find();
        $userinfo['nickname'] = $this ->filterEmoji($userinfo['nickname']);
        if(!$res){
            $data = [
                'u_nickname' =>$userinfo['nickname'],
                'u_photo' =>$userinfo['headimgurl'],
                'u_openid' =>$userinfo['openid'],
                'u_playtime' =>time(),
            ];
            db('user2')->insert($data);
        }
    }
    function filterEmoji($str){
         $str = preg_replace_callback(
           '/./u',
           function (array $match) {
            return strlen($match[0]) >= 4 ? '' : $match[0];
           },
           $str);
         
          return $str;
         }

}