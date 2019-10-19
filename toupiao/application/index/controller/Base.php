<?php
namespace app\index\controller;
use think\Controller;
class Base extends Controller
{
	protected $appid = 'wx2e7e368c32721820';
	private $appsecret = '5071fe42173e974225e81c94a5dac34d';
     public function _initialize(){
/*        $t0 = strtotime("2019-10-1 00:00:00");
        $t4 = strtotime("2019-10-7 23:59:59");
        $time = time();
        if($time <=$t0){
           echo "<center style='font-size: 5em;margin-top: 5em;color: #f1f1f1;'>活动尚未开始</center>";die;
        }elseif($time>=$t4){
           echo "<center style='font-size: 5em;margin-top: 5em;color: #f1f1f1;'>活动已经结束</center>";die;
        }*/
        //根据时间段进行查询看看有没有获奖的
        //判断用户有没有登录
        $userinfo = session("userinfo");
        if(!is_array($userinfo)){

            $_SESSION['src'][]= 'http://'.$_SERVER['SERVER_NAME'].':'.$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
            //没有登录则去登录
            $this ->getWxMemInfo();
        }
    }
        /**
         *@护码神兽
         *@author:老狗
         *获取微信个人信息
         */
    function getWxMemInfo(){
    	$code = input('code');
        if(!$code){
            $this->getOpenId();
        }else{
            $url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$this ->appid."&secret=".$this ->appsecret."&code=".$code."&grant_type=authorization_code";
            $result = $this->httpsRequest($url);
            $info = json_decode($result, true);
            $userdata = $this ->getuserinfo($info['openid'],$info['access_token']);
        } 
        session("userinfo", $userdata);
        $src=$_SESSION['src'][0];
        $this ->redirect($src);
    }
        /**
         *@护码神兽
         *@author:老狗
         *获取code
         */
    function getOpenId(){
        $oauth_url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$this ->appid."&redirect_uri=http%3a%2f%2fchenyq.make-edu.cn%2ftoupiao%2fpublic%2findex.php%2findex%2fBase%2fgetWxMemInfo&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
        $this ->redirect($oauth_url);
    }
        /**
         *@护码神兽
         *@author:老狗
         *获取用户信息
         */
    public function getuserinfo($openId,$access_token){
        $user_url = "https://api.weixin.qq.com/sns/userinfo?access_token=$access_token&openid=$openId&lang=zh_CN";
        $tmpRes = $this->httpsRequest($user_url);
        $userinfo = json_decode($tmpRes, true);
        return $userinfo;
    }
        /**
         *@护码神兽
         *@author:老狗
         *获取access_token
         */
     public function getAccessToken1() {
        //access_token 应该全局存储与更新，以下代码以写入到文件中做示例
            $jdUrl = dirname(__FILE__);
            $root_url = str_replace("\\","/",$jdUrl);

            $data = json_decode(file_get_contents($root_url."/access_token.json"));
            /*dump($data);die;*/
            if ($data->expire_time < time()) {
                $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$this ->appid."&secret=".$this ->appsecret;
                $res = json_decode($this->httpsRequest($url));
                $access_token = $res->access_token;
                if ($access_token) {
                    $data->expire_time = time() + 3600;
                    $data->access_token = $access_token;
                    $fp = fopen($root_url."/access_token.json", "w");
                    fwrite($fp, json_encode($data));
                    fclose($fp);
                }
            } else {
                $access_token = $data->access_token;
            }
            return $access_token;
        }

        /**
         *@护码神兽
         *@author:老狗
         *curl请求
         */
    private  function getAccessToken() {
        $data = $this->getFile($this->accessTokenFile);    
        if(time() - $data['time'] > 0){
            $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$this->appID}&secret={$this->appsecret}";
            $re = $this->httpsRequest($url);
            $access_token = $re['access_token'];        
            if(isset($access_token)){
                $data['access_token']  = $access_token;
                $data['time'] = time() + 7200;
                $this->setFile($this->accessTokenFile,json_encode($data));
            }
        }else{
            $access_token = $data['access_token'];
        }   
        return $access_token;
    }
     public function httpsRequest($url,$data = null){
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_TIMEOUT, 500);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
            if (!empty($data)){
                curl_setopt($curl, CURLOPT_POST, 1);
                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            }
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
            $output = curl_exec($curl);
            curl_close($curl);
            return $output;
        }
}
