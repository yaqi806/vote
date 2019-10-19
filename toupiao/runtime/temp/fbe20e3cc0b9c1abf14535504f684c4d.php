<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:67:"C:\cyq\toupiao\public/../application/index\view\ranking\index1.html";i:1569728363;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>排行</title>
		<script src="/toupiao/public/static/js/font.js"></script>
		<meta name="viewport" content="user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="/toupiao/public/static/css/ranking.css"/>
	</head>
	<body>
		<div class="top">	
		</div>
		<div class="ranking">
			<ul>
				<?php if(is_array($rankarr) || $rankarr instanceof \think\Collection || $rankarr instanceof \think\Paginator): if( count($rankarr)==0 ) : echo "<center style='font-size: 5em;margin-top: 5em;color: #c0c0c0;'>暂无排名</center>" ;else: foreach($rankarr as $key=>$vo): ?>
					<li>
						<div class="ranking_bg">
							<img src="<?php echo $vo['p_photo']; ?>"/>
							<div class="ran_con">
								<p>编号：<?php echo $vo['p_num']; ?></p>
								<p>姓名：<?php echo $vo['p_name']; ?></p>
								<p>票数：<?php echo $vo['p_tnum']; ?></p>
							</div>
						</div>
						<?php if($key == 0): ?>
							<i class="xbt"></i>
						<?php else: ?>
							<i class="ran_ming"><?php echo $key+1; ?></i>
						<?php endif; ?>
					</li>
				<?php endforeach; endif; else: echo "<center style='font-size: 5em;margin-top: 5em;color: #c0c0c0;'>暂无排名</center>" ;endif; ?>
			</ul>
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
	</body>
</html>
