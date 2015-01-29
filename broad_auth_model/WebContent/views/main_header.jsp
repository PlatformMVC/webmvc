<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="base_include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>菜单权限控制基础模块</title>
	<link rel="stylesheet" href="<%=basePath%>resource/css/style.css" type="text/css" media="all" />
	<script type="text/javascript" src="<%=basePath%>resource/js/DateFormat.js"></script>
	<script type='text/javascript' src="<%=basePath%>resource/js/jquery-1.8.2.min.js"></script>
</head>
<script type="text/javascript">
	var authoritys = ${authoritys};
	var path = '<%=basePath%>';
	$(document).ready(function(){
		//标题		
		loadToolbar();
		//真正的菜单
		loadMenus(authoritys);
	});
	
	function loadToolbar(){
		var titleStr = ' 您好，今天是' + getSystemcnLongDate();
		$("#top-navigation").html(titleStr);
	}
	
	function loadMenus(authoritys){
		//初始化菜单
		var categoryView =  $("#menusUl");
		$("#menusUl >li").remove();
		
		//遍历拼接到menusUl
		var str = "";
		for(var i = 0;i<authoritys.length;i++){
			var authority = authoritys[i];
			str+=formatMenu(authority,i==0);
		}
		categoryView.append(str);
	}
	
	//<li><a href="#" class="active"><span>Dashboard</span></a></li>
	function formatMenu(authority,isSelected){
		var id = authority.id;
		var str = "<li><a id='"+id+"' href='javascript:changeMenu("+id+",\""+authority.url+"\")'";
		if(isSelected){
			str += " class='active'";
			//设置操作区域的菜单
			window.parent.document.getElementById("container").
				src=path+authority.url;
		}
		str+="><span>"+authority.name+"</span></a></li>";
		return str;
	}
	
	function changeMenu(id,url){
		//设置操作区域的菜单
		window.parent.document.getElementById("container").
			src=path+url;
		//移除原选中样式
		$("#menusUl >li >a").removeClass();
		//重置选中菜单的样式
		$("#"+id).addClass("active");
	}
	
</script>
<body>
<!-- Header -->
<div id="header">
	<div class="shell">
		<!-- Logo + Top Nav -->
		<div id="top">
			<h1>博汇权限控制基础模块</h1>
			<div id="top-navigation">
			</div>
		</div>
		<!-- End Logo + Top Nav -->
		
		<!-- Main Nav -->
		<div id="navigation">
			<ul id="menusUl">
			</ul>
		</div>
		<!-- End Main Nav -->
	</div>
</div>
<!-- End Header -->
</body>
</html>