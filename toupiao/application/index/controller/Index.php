<?php
namespace app\index\controller;
use app\index\controller\Base;
use app\index\model\User;
use app\index\model\Player;
class Index extends Base
{
    public function index()
    {
        $_SESSION['src'] = null;
    	$userModel = new User();
    	$userModel ->addUser();
    	//所有报名选手
    	$playerModel = new Player();
    	$players = $playerModel ->getallPlayers();
        //累计投票
        $countVotes = $playerModel ->countVotes(); 
    	$this ->assign('players',$players);
        $this ->assign('countVotes',$countVotes);
        return view('index1');
    }
    //报名
    public function sign()
    {
        $playerModel = new Player();
        $class = $playerModel ->getMclass();
        $this ->assign('class',$class);
        return view('sign1');
    }
    //ajax获取专业
    public function getClass(){
        $playerModel = new Player();
        $class = $playerModel ->getMclass();
        return json_encode($class);
    }
    //上传参赛选手信息
    public function addPlayer(){
        $playerModel = new Player();
        $res = $playerModel ->add();
        return $res;
    }
    public function playerinfo(){
        $_SESSION['src'] = null;
        //分享秘钥
        $ticket = file_get_contents('./ticket.json');
        $ticket = json_decode($ticket,true);
        $time = $ticket['ctime'];
        $t = time()-$time;
        if($t>7100){
            $access_token = $this ->getAccessToken1();
            $url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token='.$access_token.'&type=jsapi';
            $data = $this ->httpsRequest($url);
            $data = json_decode($data,true);
            $ticket['ticket'] = $data['ticket'];
            $ticket['ctime']  = time();
            $ticketjson = json_encode($ticket);
            file_put_contents('./ticket.json', $ticketjson);            
        }
        $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        $url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

        $timestamp = time();
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $str = "";
        for ($i = 0; $i < 16; $i++) {
          $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        $string = "jsapi_ticket=".$ticket['ticket']."&noncestr=".$str."&timestamp=$timestamp&url=$url";
        $signature = sha1($string);
        $signPackage = array(
            "appId"     => $this->appid,
            "nonceStr"  => $str,
            "timestamp" => $timestamp,
            "url"       => $url,
            "signature" => $signature,
            "rawString" => $string
        );
        
        $playerModel = new Player();
        //查询当前选手的相册
        $playerPhoto = $playerModel ->getallPlayerPhoto();
         //浏览量加一
        $player = $playerModel ->getOneplayer();
        //获取投票所有人数据
        $allVote = $playerModel ->getAllVote();
        $this ->assign('playerPhoto',$playerPhoto);
        $this ->assign('allVote',$allVote);
        $this ->assign('player',$player);
        $this ->assign('signPackage',$signPackage);
        return view('playerinfo1');
    }
    //投票逻辑
    public function vote(){
        //先验证是否关注公众号
        $access_token = $this ->getAccessToken1();
        $openid = $openid = session('userinfo')['openid'];
        $url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$access_token."&openid=".$openid."&lang=zh_CN";
        $data = $this ->httpsRequest($url);
        $data = json_decode($data,true);
        if($data['subscribe']==0){
            //未关注公众号
            return 403;
        }else{
            //已关注公众号
            $playerModel = new Player();
            $res = $playerModel ->addVote();
            return $res;
        }
    }
    //搜索选手
    public function search(){
        $playerModel = new Player();
        $res = $playerModel ->getThatPlayer();
        return json_encode($res);
    }
}
