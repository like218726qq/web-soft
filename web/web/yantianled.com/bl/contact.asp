<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<%
	id=2
	if id="" or not checknum(id) then
		call msg("Parameter error","")
	end if
		sql="select * from tol_co where id="&id&""
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if rs.eof then
		call msg("The information does not exist or has been deleted","")
	else
		id=rs("id")
		title=rs("title_bl")
		z_body=rs("z_body_bl")
	end if
	rs.close
	set rs=nothing
%>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="header">
	<div id="logo"><div class="lan"><a href="../en/index.asp">English</a>　|　<a href="#">Idioma español</a></div></div>
    <div id="nav">
   <ul id="nav_ul">
        <li><a href="index.asp" class="b1"></a></li>
        <li><a href="about.asp" class="b2"></a></li>
        <li><a href="products.asp" class="b3"></a></li>
        <li><a href="message.asp" class="b4"></a></li>
         <li><a href="service.asp?id=3" class="b5"></a></li>
        <li><a href="contact.asp?id=2" class="b6 c6"></a></li>
   </ul>
    </div>
</div>
<div class="clear"></div>
<div id="main">
		<!--#include file="banner.asp"-->
    <div id="indProList">
    	<p class="indProTitle1">Categorías de productos</p>
        <div class="indPlist">
        	<p class="indPimg"><a href="products.asp"><img src="images/ind_23.jpg" /></a></p>
            <ul class="indPlist1">
            	  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_bl from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="products.asp?lm=<%=rs("id_lm")%>">• <%=rs("title_lm_bl")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
            </ul>
            <p class="indPimg"><a href="products.asp"><img src="images/cp-_32.jpg" width="187" height="126" /></a></p>
        </div>
    </div>
    <div id="indRight">
      <div id="indPro">
        	<p class="nindProTitle">　　<%=title%></p>
            <div style="padding:15px; line-height:180%; padding-top:25px;_height:400px;min-height:400px;">

    <%=z_body%>

</div>
       <div class="clear"></div>
<div class="page" style="text-align:right;"><a href="javascript:history.Espalda();">[Espalda]</a></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--#include file="foot.asp"-->
</body>
</html>
