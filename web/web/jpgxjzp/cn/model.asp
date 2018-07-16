<!--#include file="../html.conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%tol_co(11)%>
<!--#include file="../html.title.asp"-->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<script type="text/javascript" src="js/flash.js"></script>
</head>

<body>
<!--#include file="../index.top.asp"-->
<!--#include file="../index.menu.asp"-->
<div class="cont">
<div class="contact">
<div class="contleft">
	<h4 class="cust"><b>连锁模式</b> <span>Chain Model</span></h4>
    <div class="title">
    <!--#include file="../index.left.asp"-->
    </div>
</div>
<div class="contright">
	<h4 class="contrtit"><b>连锁模式<br /></b> <span>Chain Model</span></h4>
    <ul class="pic">
    	<div style="padding:20px; line-height:150%; font-size:13px;">
        <%if id=47 then%>
        <%=zbody(13)%>
        <%elseif id="46" then%>
        <!--#include file="../html.msg.asp"-->
        <%else%>
		<%=z_body%>
        <%end if%>
        </div>
    </ul>
</div>
</div>
</div>
<!--#include file="../index.end.asp"-->
</body>
</html>