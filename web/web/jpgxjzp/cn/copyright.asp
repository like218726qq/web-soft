<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="../html.conn.asp"-->
<%tol_co(11)%>
<!--#include file="../html.title.asp"-->
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<!--头部-->
<!--#include file="../index.top.asp"-->
<!--导航-->
<!--#include file="../index.menu.asp"-->
<!--main-->
<div class="mainBg">
	<!--banner-->
    <!--#include file="../index.slide_sub.asp"-->
    <div class="ny_main wrap">
    <div style="height:30px; line-height:30px; border-bottom:1px solid #dcdcdc;">&nbsp;&nbsp;当前位置：<a href="index.asp">首页</a> >> <a href="copyright.asp">法律声明</a> >> <%=title%></div>
    <table style="width:90%; margin:0 auto;">
    <tr>
    <td style="line-height:32px; font-size:15px; font-weight:bold; color:#5A8C13; vertical-align:top; width:150px;">
     <div>法律声明</div>
     <i><%call tol_co_nav(11,"copyright.asp")%></i>
    </td>
    <td>
    <link type="text/css" rel="stylesheet" href="slide_04/css/scroll.css" />
<script src="slide_04/scripts/scroll.js"></script>
    <div class="a dumascroll b" 
style="width:100%; height:300px; padding:15px;line-height:200%; overflow:hidden;text-indent:2em;">
	<%=z_body%>
    </div> 
    </td>
    </tr>
    </table>
    	     
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>
<!--footer-->
<!--#include file="../index.end.asp"-->
</body>
</html>