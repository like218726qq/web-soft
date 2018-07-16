<!--#include file="conn.asp"--> 
<%
	id=request("id")
	if id<>"" and checknum(id) then
		sql="select * from tol_co where id="&id&""
	else
		sql="select top 1 * from tol_co where lm=2 order by px desc,id desc"
	end if
	set rs=server.CreateObject("adodb.recordset")
	
	rs.open sql,conn,1,1
	if not rs.eof then
		id=rs("id")
		title=rs("title")
		z_body=rs("z_body")
	end if
	rs.close
	set rs=nothing
	k=2
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=site_title%></title> 
<meta name="keywords" content="<%=site_key%>" />
<meta name="description" content="<%=site_des%>"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>

<body>
	<!--#include file="top.asp"-->
	<div class="main">
    <!--#include file="banner.asp"-->
        <div class="clear"></div>
        <div class="list">
        	<!--#include file="left_about.asp"-->
        	<div class="listR">
            	<div class="listRt"><%=title%></div>
            	<div class="Abcon" style="padding-top:5px;line-height:200%;">
                   <%=z_body%>           
                </div>           
            </div>
        	<div class="clear"></div>
        </div>   
 	</div>      
    <div class="clear"></div>
	<!--#include file="foot.asp"-->
</body>
</html>
