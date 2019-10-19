<?php
namespace app\index\model;
use think\Model;
class Player extends Model
{
    public function getallPlayers()
    {
        $result = $this ->alias('p') 
                        ->join('mk_class c','c.c_id = p.p_classid','LEFT')
                        ->join('mk_major m','m.m_id = p.p_maid','LEFT') 
                        ->where('p.p_isshow','1')->order("p.p_tnum DESC") ->select();
        return $result;
    }
    public function countVotes()
    {
    	$result['countVotes'] = db('player') ->sum('p_tnum');
        $result['countlook']= db('looklogs') ->sum('lo_num');
    	return $result;
    }
    public function getMclass()
    {
        $mid = isset($_GET['mid'])?$_GET['mid']:1;
        $result = db('class') 
                ->alias('c')
                ->join('mk_major m','c.c_pid = m.m_id','LEFT')
                ->where('m.m_id',$mid) 
                ->select();
        return $result;
    }
    public function add()
    {
        $openid = session('userinfo')['openid'];
        //判断当前用户有没有注册
        $data = db('player')->where('p_openid',"$openid")->find();
        if(!$data){
            $photo = session('userinfo')['headimgurl'];
            $lastnum = db('player')->order('p_num desc')->limit(1) ->find();
            $lastnum = $lastnum['p_id']+1;
            $data = input();
            $data['name'] = urldecode($data['name']);
            $data['name'] =iconv("GBK","UTF-8",$data['name']); //编码转换
            $file = request()->file('upload');
            for($i=0;$i<count($file);$i++){
                $info[$i] = $file[$i]->move(ROOT_PATH.'public'.DS.'upload'); 
                $filename[$i] = $info[$i]->getSaveName();
            }
            $datainfo = [
                'p_name' =>$data['name'],
                'p_num' =>"00".$lastnum,
                'p_tnum' =>0,
                'p_classid' =>$data['classid'],
                'p_maid' =>$data['major'],
                'p_photo' =>$photo,
                'p_isshow' =>0,
                'p_openid' =>$openid,
            ];

            $res = db('player') ->insert($datainfo);
            $zpid = db('player')->getLastInsID();
            for($j=0;$j<count($filename);$j++){
                $photodata[$j+1] = [
                    'z_pid' => $zpid,
                    'z_src' =>$filename[$j]
                ];                
            }


            $res2 = db('photo') ->insertAll($photodata);
            $logdata = [
                'lo_pid' =>$zpid,
                'lo_num' =>0
            ];
            $res3 = db('looklogs')->insert($logdata);
            if($res){
                return 200;
            }else{
                return 500;
            }
        }else{
            return 403;
        }
        
        
    }
    public function getOneplayer(){
        $id = input('id');
        $data = db('player')->where('p_id',$id)->find();
        $res = db('looklogs') ->where('lo_pid',$id) ->find();
        $data['lo_num'] = $res['lo_num']+1;
        $num['lo_num'] = $res['lo_num']+1;
        $res = db('looklogs') ->where('lo_pid',$id) ->update($num);
        return $data;
    }
    //已关注的投票
    public function addVote(){
        //先看是否是当前用户
         $openid = session('userinfo')['openid'];
        //判断当前用户有没有注册
         $data = db('user2')->where('u_openid',"$openid")->find();
         if(!$data){
            //没有注册是刷票行为
            return 404;
         }else{
                    //验证时间是哪个阶段
             $t0 = strtotime("2019-10-1 00:00:00");
            $t4 = strtotime("2019-10-7 23:59:59");
            $time = time();
            if($time <=$t0){
               return  110;
            }elseif($time>=$t4){
                return 120;
            }
            //看看今天有没有进行投票
            $todayStart= strtotime(date('Y-m-d 00:00:00', time()));
            $data2 = db('plog') -> where("l_uopenid='$openid' and l_ptime>$todayStart") ->find();
            if($data2){
               //今天已经投了
                $t1 = strtotime("2019-10-2 23:59:59");
                $t2 = strtotime("2019-10-3 23:59:59");
                $t3 = strtotime("2019-10-5 23:59:59");
                $t4 = strtotime("2019-10-7 23:59:59");
                $time = time();
                //查询获得票数
                //判断用户有没有登录
                if($time<=$t3){
                    $arr = db('winer') ->where('w_pici',3)->find();
                    if(!$arr){
                        //还没有获奖的查询查询有没有超过50票的有则添加到数据库
                       $result = db('player')->where('p_tnum','>=',600)->find(); 
                        if($result){
                            //如果有超过50票的则将此人信息添加到数据表、
                            $data = [
                                'w_pid' =>$result['p_id'],
                                'w_pici' =>3,
                                'w_ctime' =>time(),
                                'w_num' =>600
                            ];
                            $res = db('winer') ->insert($data);
                        }
                    }           
                } 
               return 203; 
            }else{
                $t1 = strtotime("2019-10-2 23:59:59");
                $t2 = strtotime("2019-10-3 23:59:59");
                $t3 = strtotime("2019-10-5 23:59:59");
                $t4 = strtotime("2019-10-7 23:59:59");
                $time = time();
                //查询获得票数
                //判断用户有没有登录
                if($time<=$t1){
                    $arr = db('winer') ->where('w_pici',1)->find();
                    if(!$arr){
                        //还没有获奖的查询查询有没有超过50票的有则添加到数据库
                       $result = db('player')->where('p_tnum','>=',49)->find(); 
                        if($result){
                            //如果有超过50票的则将此人信息添加到数据表、
                            $data = [
                                'w_pid' =>$result['p_id'],
                                'w_pici' =>1,
                                'w_ctime' =>time(),
                                'w_num' =>50
                            ];
                            $res = db('winer') ->insert($data);
                        }
                    }   
                }elseif($time<=$t2){
                    $arr = db('winer') ->where('w_pici',2)->find();
                    if(!$arr){
                        //还没有获奖的查询查询有没有超过200票的有则添加到数据库
                       $result = db('player')->where('p_tnum','>=',199)->find(); 
                        if($result){
                            //如果有超过50票的则将此人信息添加到数据表、
                            $data = [
                                'w_pid' =>$result['p_id'],
                                'w_pici' =>2,
                                'w_ctime' =>time(),
                                'w_num' =>200
                            ];
                            $res = db('winer') ->insert($data);
                        }
                    }   
                }elseif($time<=$t3){
                    $arr = db('winer') ->where('w_pici',3)->find();
                    if(!$arr){
                        //还没有获奖的查询查询有没有超过50票的有则添加到数据库
                       $result = db('player')->where('p_tnum','>=',599)->find(); 
                        if($result){
                            //如果有超过50票的则将此人信息添加到数据表、
                            $data = [
                                'w_pid' =>$result['p_id'],
                                'w_pici' =>3,
                                'w_ctime' =>time(),
                                'w_num' =>600
                            ];
                            $res = db('winer') ->insert($data);
                        }
                    }           
                } 


                $pid = input('pid');
                $indata = [
                    'l_uopenid' =>$openid,
                    'l_pid' =>$pid,
                    'l_ptime' =>time()
                ];
                $res = db('plog') ->insert($indata);
                $res2 = db('player') ->where('p_id',$pid) ->find();
                $num['p_tnum'] = $res2['p_tnum']+1;
                $res3 = db('player') ->where('p_id',$pid) ->update($num);
                if($res){
                    return 200;
                }else{
                    return 500;
                }
            }

         }
    }
    public function getAllVote(){
        $id = input('id');
        $res2 = db('plog')
        ->alias('p')
        ->join('mk_user2 u','u.u_openid=p.l_uopenid')
        ->where('p.l_pid',$id) ->select();
        return $res2;
    }
    public function getThatPlayer(){
        $name = input('name');
        $res = db('player') ->where('p_name','like',"%$name%")->where('p_isshow',1) ->select();
        return $res;
    }
    public function Ranking(){
        $res = db('player') ->where('p_isshow',1)->order('p_tnum desc')->limit(20) ->select();
        return $res;
    }
    public function getWiners(){
        $res = db('winer')
                ->alias('w')
                ->join('mk_player p','w.w_pid = p.p_id','LEFT')
                ->join('mk_class c','c.c_id = p.p_classid','LEFT')
                ->join('mk_major m','m.m_id = p.p_maid','LEFT') 
                ->select();
        return $res;
    }
    public function getallPlayerPhoto(){
        $id = input('id');
        $res = db('photo') ->where('z_pid',$id) ->select();
        return $res;
    }

}