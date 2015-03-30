<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>网页下雪特效插件jquery.snow - 站长素材</title>
<script type="text/javascript" src="resource/js/jquery-1.8.2.min.js"></script>
</head>
<body style="">
<!--居中margin:0 auto 必须和position relative才能，如果是absolute的话，就不会居中了。-->
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
<p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
<!-- position:relative的作用可以保证container的子元素的起始位置是相对container开始的，而非显示器的左上角 -->
<div id="container" style="width:1002px;margin:0 auto;height:500px;overflow:hidden;position:relative;background:#3B3B3B;" ></div>
</div>
<script src="resource/js/scatter.js"></script>
</body>
</html>