<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/home.css" />
<script type="text/javascript" src="<%=basePath%>resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/menu.js"></script>
<script type="text/javascript">
	var basePath = "<%=basePath%>";
</script>