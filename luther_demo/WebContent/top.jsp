<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="resource/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<style type="text/css">
.header {
	width: 100%;
	margin: 0 auto;
	background: url(resource/images/top_bg.jpg) repeat-x left top;
}

.header_top {
	width: 1002px;
	margin: 0 auto;
	position: relative;
	height: 96px;
}

.clear {
	clear: both;
}

.logo {
	float:left;
	width:393px;
	height:96px;
}

.addFavor {
	
}
</style>
<title>jQuery左右按钮滑动图片切换相册代码-【科e互联】</title>
<meta name="keywords" content="jQuery相册,js相册代码,jquery相册特效,图片特效,js相册" />
<link rel="stylesheet" type="text/css" href="resource/css/shou.css" />
</head>
<body>
   <!-- 头部 -->
   <div id="top" class="header">
        <!-- 顶层 -->
   		<div id="header_top" class="header_top">
   		    <div id="logo">
   		        <img src="resource/images/vine.jpg" class="logo"/>
   		    </div>
   		    <div id="addFavoriate" class="addFavor"></div>
   		    <div class="clear"></div>
   		</div>
   		
   		<!-- 菜单 -->
   		<div id="top_menu">
   		</div>
   		
   		<div class="clear"></div>
   </div>

	<div class="fwtop_banner">
		<div class="siteBanner" id="siteBanner">
			<div class="hd">
				<ul>
					<li class="">1</li>
					<li class="on">2</li>
					<li class="">3</li>
				</ul>
			</div>
			<div class="bd" id="bd">
				<ul style="position: relative; width: 1002px; height: 230px;">
					<li
						style="position: absolute; width: 1002px; left: 0px; top: 0px; display: none;"><img
						style="width: 1002px; height: 230px;"
						src="resource/images/h1.jpg" alt="" title=""></li>
					<li
						style="position: absolute; width: 1002px; left: 0px; top: 0px; display: list-item;"><img
						style="width: 1002px; height: 230px;"
						src="resource/images/h2.jpg" alt="" title=""></li>
					<li
						style="position: absolute; width: 1002px; left: 0px; top: 0px; display: none;"><img
						style="width: 1002px; height: 230px;"
						src="resource/images/h3.jpg" alt="" title=""></li>
				</ul>
			</div>
			<a class="prev" href="javascript:void(0)"></a> <a class="next"
				href="javascript:void(0)"></a>
		</div>
		<script type="text/javascript">
			var ary = location.href.split("&");
			jQuery("#siteBanner").slide({
				mainCell : "#bd ul",
				effect : "fold",
				autoPlay : "true",
				trigger : "mouseover",
				easing : "swing",
				delayTime : "1000",
				mouseOverStop : "true",
				pnLoop : "true"
			});
		</script>

	</div>
</body>
</html>