<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:64:"C:\cyq\toupiao\public/../application/index\view\index\sign1.html";i:1569745583;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="/toupiao/public/static/js/font.js"></script>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1" />
		<link rel="stylesheet" type="text/css" href="/toupiao/public/static/css/apply.css"/>
	</head>
	<body>
		<div class="banner">
			<img src="/toupiao/public/static/img/haibao.jpg"/>
		</div>

		<div class="content">
			<p>
				<span class="title">姓名：</span><input type="text" placeholder="请输入您的姓名" id="na" name="name" />
			</p>
			<p>
				<span class="title">参赛照片：</span>
				<label for="file_in">选择文件</label>
				<input type="file" accept="image/*" class="file_in" id="file_in" multiple name="file" />
			</p>
			<p class="pic">
				<span class="title"></span>
				<span class="picNr"></span>
			</p>
			<p>
				<span class="title">专业：</span>
				<select name="zid" class="major">
					<option value="1">PHP研发</option>
					<option value="2">UI设计</option>
					<option value="3">WEB前端</option>
					<option value="4">AI人工智能</option>
					<option value="5">英才学院</option>
					<option value="6">基础应用学院</option>
					<option value="7">实训中心</option>
				  </select>
			</p>
			<br>
			<p>
				<span class="title" >班级：</span>
				<span id="bj">
				<select name="cid" class="classid">
					<?php if(is_array($class) || $class instanceof \think\Collection || $class instanceof \think\Paginator): if( count($class)==0 ) : echo "" ;else: foreach($class as $key=>$vo): ?>
						<option value="<?php echo $vo['c_id']; ?>"><?php echo $vo['c_name']; ?></option>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				  </select>
				</span>
			</p>
		</div>

		<button class="tj">提交</button>

		<div class="mask">
			<div class="mask_in">
				<img src="/toupiao/public/static/img/succe.png"/>
				<p class="p1">提交信息成功</p>
				<p class="p2">后期信息可在公众号安全生产菜单中产看</p>
				<a class="zdl" href="javascript:;">知道了</a>
				<p class="cha">×</p>
			</div>
		</div>
		<div class="mask1">
			<div class="mask_in1">
				<img src="/toupiao/public/static/img/error.png"/>
				<p class="p1">该微信已注册</p>
				<p class="p2">后期信息可在公众号安全生产菜单中产看</p>
				<a class="zdl" href="javascript:;">知道了</a>
				<p class="cha">×</p>
			</div>
		</div>
		<script type="text/javascript" src="/toupiao/public/static/js/jquery.min.js"></script>
		<script type="text/javascript">
		$(function(){
			$(".zdl").click(function(){
				$(".mask .mask_in").fadeOut(1000);
				$(".mask").slideUp(1800);
				$(".mask1 .mask_in1").fadeOut(1000);
				$(".mask1").slideUp(1800);
			})
			$(".cha").click(function(){
				$(".mask .mask_in").fadeOut(1000);
				$(".mask").slideUp(1800);
				$(".mask1 .mask_in1").fadeOut(1000);
				$(".mask1").slideUp(1800);
			})
			$(".major").change(function(){
				var mid = $(".major").val()
				$.ajax({
					url:"<?php echo url('getClass'); ?>",
					method:'get',
					data:{'mid':mid},
					dataType:'json',
					success:function(content){
						res_ = eval('(' + content + ')');
						var str = ''
						str +="<select name='cid' class='classid'>"
							$.each(res_,function(k,v){
								str+="<option value="+v.c_id+">"+v.c_name+"</option>"
							})
						str +="</select>"
						$('#bj').html(str)
					}
				})
			})
			
		})
	</script>
		<script type="text/javascript" src="/toupiao/public/static/js/apply.js"></script>
	</body>
</html>
