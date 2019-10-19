<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:69:"C:\cyq\toupiao\public/../application/index\view\vote_list\index1.html";i:1569728369;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>获奖列表</title>
		<script src="/toupiao/public/static/js/font.js"></script>
		<meta name="viewport" content="user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="/toupiao/public/static/css/list.css"/>
	</head>
	<body>
		<?php if(is_array($winers) || $winers instanceof \think\Collection || $winers instanceof \think\Paginator): if( count($winers)==0 ) : echo "<center style='font-size: 5em;margin-top: 5em;color: #c0c0c0;'>暂时没人获奖</center>" ;else: foreach($winers as $key=>$vo): ?>
		<div class="box">
			<p class="p1">第<?php echo $vo['w_pici']; ?>阶段</p>
			<img src="<?php echo $vo['p_photo']; ?>"/>
			<div class="box_xm">
				<p class="fl">姓名：<?php echo $vo['p_name']; ?></p>
				<p class="fr">编号：<?php echo $vo['p_num']; ?></p>
			</div>
		</div>
		<div class="piao">
			<div class="piao_in">
				<p class="fl">现有票数 <span><?php echo $vo['p_tnum']; ?></span></p>
				<p class="fr">获奖票数<span><?php echo $vo['w_num']; ?></span></p>
			</div>
		</div>
		<div class="shi_jian">
			<p>获奖时间：<?php echo date("Y-m-d H:i:s",$vo['w_ctime']); ?></p>
		</div>
		<?php endforeach; endif; else: echo "<center style='font-size: 5em;margin-top: 5em;color: #c0c0c0;'>暂时没人获奖</center>" ;endif; ?>
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
