<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/shou.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/picChange-style.css " />
<script src="<%=basePath%>resource/js/jquery.js" type="text/javascript"></script>
<script src="<%=basePath%>resource/js/jqueryPhoto.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Luther Home Welcome you</title>
<meta name="keywords" content="Luther" />
</head>
<body style="height: 100%;">
	<%@ include file="header.jsp" %>
	<div class="main">
	    <div class="left">
	      <div class="mod18"> <span id="prev" class="btn prev"></span> <span id="next" class="btn next"></span> <span id="prevTop" class="btn prev"></span> <span id="nextTop" class="btn next"></span>
	        <div id="picBox" class="picBox">
	          <ul class="cf">
	            <li> <a href="http://www.internetke.com" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/2.jpg" alt=""/></a> <span>紫色复古风席卷欧美，你赶上潮流了吗</span> </li>
	            <li> <a href="http://www.internetke.com" title="" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/3.jpg" alt=""/></a> <span>黑色与红色的诱惑，你更爱哪一种</span> </li>
	            <li> <a href="http://www.internetke.com" title="" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/4.jpg" alt=""/></a> <span>是睡衣，是贴心，是性感</span> </li>
	            <li> <a href="http://www.internetke.com" title="" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/5.jpg" alt=""/></a> <span>碎花连衣裙穿出你的风格</span> </li>
	            <li> <a href="http://www.internetke.com" title="" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/6.jpg" alt=""/></a> <span>性感内衣，让你美丽俏佳人</span> </li>
	            <li> <a href="http://www.internetke.com" title="" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/7.jpg" alt=""/></a> <span>男人的衣柜，穿出你的style，可以不帅，可以不酷，但必须有品味</span> </li>
	            <li> <a href="http://www.internetke.com" title="" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/8.jpg" alt=""/></a> <span>夏日的海滩，阳光的诱惑</span> </li>
	            <li> <a href="http://www.internetke.com" title="" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/9.jpg" alt=""/></a> <span>每个人都有自己的毛绒玩具，是怀念，是寄托</span> </li>
	            <li> <a href="http://www.internetke.com" title="" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/10.jpg" alt=""/></a> <span>沙滩，型男，凉爽酷劲十足</span> </li>
	            <li> <a href="http://www.internetke.com" title="" target="_blank"><img style="width:526px;height:377px;" src="<%=basePath%>resource/images/11.jpg" alt=""/></a> <span>当中国风十足的长裙遇上性感内衣</span> </li>
	          </ul>
	        </div>
	        <div id="listBox" class="listBox">
	          <ul style="width: 1792px; left: -512px;" class="cf">
	            <li class=""><i class="arr2"></i><img src="<%=basePath%>resource/images/2.jpg" alt=""/></li>
	            <li class=""><i class="arr2"></i><img src="<%=basePath%>resource/images/3.jpg" alt=""/></li>
	            <li class=""><i class="arr2"></i><img src="<%=basePath%>resource/images/4.jpg" alt=""/></li>
	            <li class=""><i class="arr2"></i><img src="<%=basePath%>resource/images/5.jpg" alt=""/></li>
	            <li class=""><i class="arr2"></i><img src="<%=basePath%>resource/images/6.jpg" alt=""/></li>
	            <li class="on"><i class="arr2"></i><img src="<%=basePath%>resource/images/7.jpg" alt=""/></li>
	            <li class=""><i class="arr2"></i><img src="<%=basePath%>resource/images/8.jpg" alt=""/></li>
	            <li class=""><i class="arr2"></i><img src="<%=basePath%>resource/images/9.jpg" alt=""/></li>
	            <li class=""><i class="arr2"></i><img src="<%=basePath%>resource/images/10.jpg" alt=""/></li>
	            <li class=""><i class="arr2"></i><img src="<%=basePath%>resource/images/11.jpg" alt=""/></li>
	          </ul>
	        </div>
	        <div class="clear"></div>
	      </div>
	      <div class="clear"></div>
	    </div>
	    <div class="clear"></div>
	</div>
	<%@ include file="footer.jsp" %>
	<script src="<%=basePath%>resource/js/picChange-0.1.js" type="text/javascript"></script>
	<script type="text/javascript">
	    autoPlay();
	</script>
</body>
</html>