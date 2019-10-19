<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:70:"C:\cyq\toupiao\public/../application/index\view\index\playerinfo1.html";i:1569741059;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>投票记录</title>
		<link rel="stylesheet" href="/toupiao/public/static/css/index.css" />
		<link rel="stylesheet" href="/toupiao/public/static/css/font-awesome.css" />
		<script type="text/javascript" src="/toupiao/public/static/js/font.js" ></script>
		<script type="text/javascript" src="/toupiao/public/static/js/jquery.min.js" ></script>
		<script type="text/javascript" src="/toupiao/public/static/js/playerinfo.js"></script>
		<meta name="viewport" content="user-scalable=no" />
		<script type="text/javascript" src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
		<style type="text/css">
			.mask1{
	width: 100%;
	height:100%;
	background-color: rgba(0,0,0,.3);
	position: absolute;
	left: 0;
	top: 0;
	display: none;
}
.mask1 .mask_in1{
	width: 4.44rem;
	height: 5.44rem;
	background-color: white;
	position: absolute;
	top: 0;left: 0;right: 0;bottom: 0;
	margin: auto;
	border-radius: .05rem;
	text-align: center;
	display: none;
	
}
.mask1 .mask_in1 img{
	width: 3.70rem;
	height: 3.70rem;
	margin-top: .30rem;
	
}

.mask1 .mask_in1 a{
	width: 1.52rem;
	height: .47rem;
	border: .01rem solid #000000;
	display: inline-block;
	font-size: .24rem;
	text-align: center;
	line-height: .47rem;
	color: #000;
}
.mask1 .mask_in1 .cha{
	font-size: .5rem;
	position: absolute;
	top: 0;
	right: .2rem;
	cursor: pointer;
}

			        @-webkit-keyframes da {
		            0% {
		                -webkit-transform: translate3d(0, 0, 0);
		                transform: translate3d(0, 0, 0);
		            }
		            100% {
		                -webkit-transform: translate3d(0, -307px, 0);
		                transform: translate3d(0, -307px, 0);
		            }
		        }
		        @keyframes da {
		            0% {
		                -webkit-transform: translate3d(0, 0, 0);
		                transform: translate3d(0, 0, 0);
		            }
		            100% {
		                -webkit-transform: translate3d(0, -307px, 0);
		                transform: translate3d(0, -307px, 0);
		            }
		        }
        .dadiv{
            margin: .5rem auto;
            position: relative;
            height: 0.4rem;
            overflow: hidden;
        }
 
        .dadiv .da{
            -webkit-animation: 10s da linear infinite normal;
            animation: 10s da linear infinite normal;
            position: relative;
        }
        .vote_head img{
        	border-radius:50px
        }
        .maoboli{
        	  filter: url(blur.svg#blur); /* FireFox, Chrome, Opera */
    
	    -webkit-filter: blur(10px); /* Chrome, Opera */
	       -moz-filter: blur(10px);
	        -ms-filter: blur(10px);    
	            filter: blur(10px);
    
    filter: progid:DXImageTransform.Microsoft.Blur(PixelRadius=10, MakeShadow=false); /* IE6~IE9 */
        }
		</style>
	</head>
	<body>
		<!--投票纪录-->
		<!--投票-->
		<div class="vote_box">
			<div class="vote_img">
				<div class="vote_name">
					<div class="vote_head"><img src="<?php echo $player['p_photo']; ?>"/></div>
					<div class="vote_write">
						<p class="left"><span>姓名：</span><span><?php echo $player['p_name']; ?></span></p>
						<p class="right"><span>编号：</span><span><?php echo $player['p_num']; ?></span></p>
					</div>
				</div>
			</div>
			<div class="vote_num">
				<ul class="num_ul">
					<li>
						<p>编号</p>
						<p><?php echo $player['p_num']; ?></p>
					</li>
					<li>
						<p>票数</p>
						<p class="piaoshu"><?php echo $player['p_tnum']; ?></p>
					</li>
					<li>
						<p>浏览量</p>
						<p><?php echo $player['lo_num']; ?></p>
					</li>
				</ul>
			</div>
		</div>
		<input type="hidden" name="pid" value="<?php echo $player['p_id']; ?>" class="pid">
		<!--参赛人-->
		<div class="dadiv">
			<div class="da">
				<?php if(is_array($allVote) || $allVote instanceof \think\Collection || $allVote instanceof \think\Paginator): if( count($allVote)==0 ) : echo "" ;else: foreach($allVote as $key=>$vo): ?>
				<div class="person">
					<div class="person_top">
						<div class="person_left left">
							<div class="person_head left"><img src="<?php echo $vo['u_photo']; ?>"/></div>
							<div class="person_name left">
								<p><?php echo $vo['u_nickname']; ?></p>
							</div>
						</div>
						<div class="person_right right"><?php echo date("Y-m-d ",$vo['l_ptime']); ?></div>
					</div>
				</div>
				<?php endforeach; endif; else: echo "" ;endif; ?>

			</div>
		</div>
		<!-- 加个相册的轮播 -->
		<div class="banner">
			<ul class="banner_ul">
				<?php if(is_array($playerPhoto) || $playerPhoto instanceof \think\Collection || $playerPhoto instanceof \think\Paginator): if( count($playerPhoto)==0 ) : echo "" ;else: foreach($playerPhoto as $key=>$vo): if($key == 0): ?>
						<li class="one_img"><img src="/toupiao/public/upload/<?php echo $vo['z_src']; ?>"/></li>
					<?php else: ?>
						<li><img src="/toupiao/public/upload/<?php echo $vo['z_src']; ?>"/></li>
					<?php endif; endforeach; endif; else: echo "" ;endif; ?>
			</ul>
		</div>
		<div class="person_button">
			<a href="javascript:;" class="vote_btn">给他投票</a>
		</div>
		<div class="person_button2">
			<a href="javascript:;" class="vote_btn2"  onClick="_system._guide(true)">给他拉票</a>
		</div>
<div class="nav">
		   <ul>
			  	<li>
					<a href="<?php echo url('Index/index'); ?>">
						<img src="/toupiao/public/static/img/index.png"/>
						<p>首页</p>
					</a>
				</li>
				<li>
					<a href="<?php echo url('Ranking/index'); ?>">
						<img src="/toupiao/public/static/img/paihang.png"/>
						<p>排行</p>
					</a>
				</li>
				<li>
					<a href="<?php echo url('Rule/index'); ?>">
						<img src="/toupiao/public/static/img/guize.png"/>
						<p>活动规则</p>
					</a>
				</li>
				<li>
					<a href="<?php echo url('VoteList/index'); ?>">
						<img src="/toupiao/public/static/img/liebiao.png"/>
						<p>获奖列表</p>
					</a>
				</li>
		   </ul>
 		</div>
 		<div class="mask1">
			<div class="mask_in1">
				<img src="/toupiao/public/static/img/ewm.png"/>
				<a class="zdl" href="javascript:;">知道了</a>
				<p class="cha">×</p>
			</div>
		</div>


<div id="cover"></div>
<div id="guide"><img src="/toupiao/public/static/img/town_recommend_m/shareto.png" width="278" height="198"></div>  
	</body>
</html>
<script type="text/javascript">
	$(".vote_btn").click(function(){
		var pid = $('.pid').val()
		$.ajax({
			url:"<?php echo url('vote'); ?>",
			method:'get',
			data:{'pid':pid},
			success:function(res){
				if(res == 403){
					//弹出二维码
					$(".mask1").slideDown(1000);
					$(".mask1 .mask_in1").fadeIn(1800);
				}else if(res == 404){
					alert('严厉禁止刷票')
				}else if(res ==203){
					alert('今日已投票！请明日再来')
				}else if(res ==500){
					alert('投票失败；多次失败请联系管理员')
				}else if(res ==110){
					alert('投票通道尚未开启')
				}else if(res ==120){
					alert('活动已结束')
				}else{
					alert('投票成功')
					var num = parseInt($('.piaoshu').html())+1
					$('.piaoshu').html(num)
				}
			}
		})
	})
	$(".zdl").click(function(){
		$(".mask1 .mask_in1").fadeOut(1000);
		$(".mask1").slideUp(1800);
	})
	$(".cha").click(function(){
		$(".mask1 .mask_in1").fadeOut(1000);
		$(".mask1").slideUp(1800);
	})
	wx.config({
		debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		appId: "<?php echo $signPackage['appId']; ?>", // 必填，公众号的唯一标识
		timestamp:"<?php echo $signPackage['timestamp']; ?>", // 必填，生成签名的时间戳
		nonceStr: "<?php echo $signPackage['nonceStr']; ?>", // 必填，生成签名的随机串
		signature: "<?php echo $signPackage['signature']; ?>",// 必填，签名
		jsApiList: [
		'updateAppMessageShareData',
		'updateTimelineShareData'
		] // 必填，需要使用的JS接口列表
	});
	wx.ready(function () {   //需在用户可能点击分享按钮前就先调用
		wx.updateAppMessageShareData({ 
		    title: '河北码客教育最具影响力学员', // 分享标题
		    desc: '请选择我进行投票', // 分享描述
		    link: '<?php echo $signPackage['url']; ?>', // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
		    imgUrl: "<?php echo $player['p_photo']; ?>", // 分享图标
		    success: function () {
		      // 设置成功
		    }
		})
		wx.updateTimelineShareData({ 
		    title: '河北码客教育最具影响力学员', // 分享标题
		    link: '<?php echo $signPackage['url']; ?>', // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
		    imgUrl: "<?php echo $player['p_photo']; ?>", // 分享图标
		    success: function () {
		      // 设置成功
		    }
		})
	});
</script>
<script type="text/javascript">
	 var _system={

        $:function(id){return document.getElementById(id);},

   _client:function(){

      return {w:document.documentElement.scrollWidth,h:document.documentElement.scrollHeight,bw:document.documentElement.clientWidth,bh:document.documentElement.clientHeight};

   },

   _scroll:function(){

      return {x:document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft,y:document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop};

   },

   _cover:function(show){

      if(show){

     this.$("cover").style.display="block";

     this.$("cover").style.width=(this._client().bw>this._client().w?this._client().bw:this._client().w)+"px";

     this.$("cover").style.height=(this._client().bh>this._client().h?this._client().bh:this._client().h)+"px";

  }else{

     this.$("cover").style.display="none";

  }

   },

   _guide:function(click){

      this._cover(true);

      this.$("guide").style.display="block";

      this.$("guide").style.top=(_system._scroll().y+5)+"px";

      window.onresize=function(){_system._cover(true);_system.$("guide").style.top=(_system._scroll().y+5)+"px";};

  if(click){_system.$("cover").onclick=function(){

         _system._cover();

         _system.$("guide").style.display="none";

 _system.$("cover").onclick=null;

 window.onresize=null;

  };}

   },

   _zero:function(n){

      return n<0?0:n;

   }

}

</script>