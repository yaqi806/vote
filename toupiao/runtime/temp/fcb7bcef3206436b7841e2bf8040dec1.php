<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:65:"C:\cyq\toupiao\public/../application/index\view\index\index1.html";i:1569806719;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>首页</title>
		<meta name="viewport" content="user-scalable=no" />
		<link rel="stylesheet" href="/toupiao/public/static/css/index.css" />
		<link rel="stylesheet" href="/toupiao/public/static/css/font-awesome.css" />
		<script type="text/javascript" src="/toupiao/public/static/js/font.js" ></script>
		<script type="text/javascript" src="/toupiao/public/static/js/jquery.min.js" ></script>

	</head>
	<body>
		<!--top-->
		<div class="top">
			<p class="top_search right"></p>
		</div>
		<!--banner-->
		<a href="http://www.make-edu.cn"><div class="banner2">
			<ul class="banner_ul2">
				<li class="one_img"><img src="/toupiao/public/static/img/banner1.png"/></li>
				<li><img src="/toupiao/public/static/img/banner2.png"/></li>
				<li><img src="/toupiao/public/static/img/banner3.png"/></li>
			</ul>
			<ol class="banner_ol">
				<li class="one_li"></li>
				<li></li>
				<li></li>
			</ol>
		</div></a>
		<p class="tiaoZhuan">
			<img src="/toupiao/public/static/img/tp.png" />
			<a href="<?php echo url('sign'); ?>">点击报名</a>
		</p>
		<!--累计投票、访问人次-->
		<div class="count">
			<div class="count_box left">
				<p>累计投票</p>
				<p><?php echo $countVotes['countVotes']; ?></p>
			</div>
			<div class="count_box right">
				<p>访问人数</p>
				<p><?php echo $countVotes['countlook']; ?></p>
			</div>
		</div>
		<div class="sousuo" style="background: #f3f3f3;display:flex;">
			<div class="sousuo_in">
				<input type="text" placeholder="请输入选手姓名" class="xsname" />
			</div>
			<button class="but"><img src="/toupiao/public/static/img/sousuo.png"/></button>
		</div>
		<!--活动时间-->
		<div class="active_time">
			<p class="left">活动时间：&nbsp;2019-10-1 至 2019-10-7</p>
			<p class="right"><a href="<?php echo url('Rule/index'); ?>">活动规则</a></p>
		</div>
		<!--参赛选手-->
		<div class="player">
			<ul class="player_ul">
				<?php if(is_array($players) || $players instanceof \think\Collection || $players instanceof \think\Paginator): if( count($players)==0 ) : echo "" ;else: foreach($players as $key=>$vo): if(($key <=3)): ?> 
						<li class="player_li">
							<a href="<?php echo url('playerinfo',array('id'=>$vo['p_id'])); ?>">
								<div class="player_img"><img src="<?php echo $vo['p_photo']; ?>"/></div>
								<div class="player_name">
									<div class="player1"><span>姓名：</span><span>&nbsp;<?php echo $vo['p_name']; ?></span></div>
									<div class="player2"><span>票数：</span><span>&nbsp;<?php echo $vo['p_tnum']; ?></span></div>
									<div class="player3"><span>编号：</span><span>&nbsp;<?php echo $vo['p_num']; ?></span></div>
								</div>
							</a>
						</li>
					<?php endif; endforeach; endif; else: echo "" ;endif; ?>
			</ul>
			<div class="loading_box">
				<ul class="player_ul1">
				<?php if(is_array($players) || $players instanceof \think\Collection || $players instanceof \think\Paginator): if( count($players)==0 ) : echo "" ;else: foreach($players as $key=>$vo): if(($key >3)): ?> 
						<li class="player_li">
							<a href="<?php echo url('playerinfo',array('id'=>$vo['p_id'])); ?>">
								<div class="player_img"><img src="<?php echo $vo['p_photo']; ?>"/></div>
								<div class="player_name">
									<div class="player1"><span>姓名：</span><span>&nbsp;<?php echo $vo['p_name']; ?></span></div>
									<div class="player2"><span>票数：</span><span>&nbsp;<?php echo $vo['p_tnum']; ?></span></div>
									<div class="player3"><span>编号：</span><span>&nbsp;<?php echo $vo['p_num']; ?></span></div>
								</div>
							</a>
						</li>
					<?php endif; endforeach; endif; else: echo "" ;endif; ?>
				</ul>
			</div>
			<p class="loading">加载更多</p>
			
			
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
		
		<script src="/toupiao/public/static/js/index.js"></script>
	</body>
</html>
<script type="text/javascript">
	$('.but').click(function(){
		var name = $('.xsname').val()
		$.ajax({
			url:"<?php echo url('search'); ?>",
			type:'get',
			data:{'name':name},
			success:function(res){
				res = eval('(' + res + ')');
				str = ''
				for(var i=0;i<res.length;i++){
					str+= '<li class="player_li"><a href=/toupiao/public/index.php/index/index/playerinfo/id/'+res[i].p_id+'><div class="player_img"><img src="'+res[i].p_photo+'"/></div><div class="player_name"><div class="player1"><span>姓名：</span><span>&nbsp;'+res[i].p_name+'</span></div><div class="player2"><span>票数：</span><span>&nbsp;'+res[i].p_tnum+'</span></div><div class="player3"><span>编号：</span><span>&nbsp;'+res[i].p_num+'</span></div></div></a></li>'
				}
				$(".player_ul").html(str)
				$(".loading").hide();
				$(".player_ul1").hide();
			}
		})
	})

</script>
