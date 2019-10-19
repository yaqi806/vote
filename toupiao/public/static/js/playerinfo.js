//轮播图
$(function(){
	var $a=0;
	$(".banner .banner_ol li").click(function(){
		$(this).addClass("one_li").siblings().removeClass("one_li");
		$a=$(this).index();
		$(".banner .banner_ul li").eq($a).fadeIn(2500).siblings().hide();
	})
	function lunbo(){
		$a++;
		if($a>2){
			$a=0;
		}
		$(".banner .banner_ol li").eq($a).addClass("one_li").siblings().removeClass("one_li");
		$(".banner .banner_ul li").eq($a).fadeIn(2500).siblings().hide();
	}
	var timer=setInterval(lunbo,2500);
	
	$(".banner").mouseover(function(){
		clearInterval(timer);
	}).mouseout(function(){
		timer=setInterval(lunbo,2500)
	})
})

$(".loading").click(function(){
	$(".loading_box").slideDown();
	$(".loading").hide()
	$(".tiaoZhuan").show()
})
