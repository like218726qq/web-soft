<!--#include file="../html.conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	<h4 class="cust"><b>华洪商城</b> <span>Shop</span></h4>
    <div class="title">
    	<span class="hongtit"><b>华洪商城<br /></b><strong>Shop</strong></span>
        <ul class="submenua">
        	<%
			set rs = server.createobject("adodb.recordset")
			id=request.QueryString("id")
		  sql="select * from pro_lm where fid=0 order by px desc,id_lm desc"
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			while not rs.eof
			%>
             <li>·<a href="shop.asp?fid=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
			<%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
			%>
        </ul>
       
    </div>
</div>
<div class="contright">
	<h4 class="contrtit"><b>华洪商城<br /></b> <span>Shop</span></h4>
    <ul class="pic">
    <%ffid=request.QueryString("fid")
	if ffid="143" then
	%>
    <!--#include file="../html.pro.asp"-->
    <%else%>
    <!--#include file="../html.pro2.asp"-->
    <%end if%>
    	
    </ul>
    <!--#include file="../html.page_num.asp"-->
</div>
</div>
</div>
<!--#include file="../index.end.asp"-->
</body>
</html>