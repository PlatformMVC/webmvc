<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="./../base_include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Luther Home Welcome you</title>
<meta name="keywords" content="Luther" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/home.css" />
<script src="<%=basePath%>resource/js/jquery.js" type="text/javascript"></script>
<script src="<%=basePath%>resource/js/menu.js" type="text/javascript"></script>
<script type="text/javascript">
var menus = ${menus};
$(document).ready(function(e) {
	var html = formatMenus(menus);
	$("#menus").append(html);
	menuEvent();
});


</script>
</head>
<body style="height: 100%;">
	<div class="header-box">
		<div class="header-con">
			<a href="" title="装饰公司" id="web_logo"> 
			<img src="<%=basePath%>resource/images/vine.jpg" alt="" title="" 
				style="width:200px;height:100px;margin: 10px 0px 0px 5px;"></img>
			</a>

			<div class="nav-box">
				<ul id="menus">
				</ul>
			</div>
		</div>
	</div>
	<div id="banner-box">
	
	</div>
	
	<div id="footer-box">
	</div>
</body>
</html>