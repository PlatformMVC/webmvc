<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
html,body,div,ul,li,a{
                    margin:0;   
                    padding:0;  
                    list-style:none;
}
a, a:hover{
 color:#000;
 border:0;
 text-decoration:none;
}
    #warp,#head,#main,#foot
{
    width: 962px;
}
/*设置居中*/
#warp{
    margin: 0 auto;
}
#head{
            height:132px;
            position:relative;
}
.logo{
        position:absolute;
        top:17px;
}
.head_pic{
            position:absolute;
            top:17px;
            left:420px;
}
.sc{
            position:absolute;
            right:5px;
            top:12px;
}
.sc a{
            padding-left:20px;
            color:#666;
}
.nav{
        width:960px;
        height:42px;
        line-height:42px;
        position:absolute;
        bottom:0px;
        background:url(img/nav_bj.jpg) no-repeat center;
}
.nav ul{
            float:left;
            padding:0 10px;
}
.nav li{
            float:left;
            background:url(img/li_bj.jpg) no-repeat right center;
            padding-right:40px;
            padding-left:20px;
            text-align:center;
            display:inline;
}
.nav li a{
                font-size:14px;
                font-family:Microsoft YaHei !important;
                white-space:nowrap;
}
.nav li a:hover{
                    color:#FBECB7;
}
</style>
<title></title>
</head>
<body>
    <div id="warp">
        <div id="head">
            <div class="logo"><img src="resource/images/vine.jpg" /></div>
            <div class="head_pic"><img src="resource/images/th.gif" /></div>
            <div class="sc">
                <a href=""><img src="resource/images/add.gif" /></a>
                <a href=""><img src="resource/images/add.gif" /></a>
                <a href=""><img src="resource/images/add.gif" /></a>
            </div>
            <div class="nav">
                <ul>
                    <li><a href="">首页</a></li>
                    <li><a href="">关于我们</a></li>
                    <li><a href="">团队文化</a></li>
                    <li><a href="">公司动态</a></li>
                    <li><a href="">资讯参考</a></li>
                    <li><a href="">业务中心</a></li>
                    <li><a href="">合作银行</a></li>
                    <li><a href="">联系我们</a></li>
                </ul>
            </div>
        </div>
        <div id="main"></div>
        <div id="foot"></div>
    </div>
</body>
</html>