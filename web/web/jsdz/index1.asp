<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
</head>

<body>
<!--首页新闻-->
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select top 8 id,title,color_font,wtime from info_co where lm=1 and pass='yes' order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof 
%>

        <a href="news_show.asp?id=<%=rs("id")%>"><font style="color:<%=rs("color_font")%>;"><%=rs("title")%></font></a>
        <%=formatdate(rs("wtime"))%>

<%
	rs.movenext
	wend
	rs.close
	set rs=nothing 
%>
<!--首页产品-->
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select top 8 id,title,img_sl from pro_co where lm=1 and pass='yes'  order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>

        <a href="product_show.asp?id=<%=rs("id")%>"><%=rs("img_sl")%></a>
        <a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a>

<%
	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
</body>
</html>
