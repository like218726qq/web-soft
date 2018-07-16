<!--#include file="conn.asp"--> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong0%></title>
<meta content="<%=zhong1%>" http-equiv="keywords" />
<meta content="<%=zhong2%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
</head>
<body>
<!--#include file="top_1backup.asp"--> 
<div class="bannerback">
<!--开始-->
 <%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 1 * from info_co where lm=31 order by px desc,id desc"
                 rs.open sql,conn,1,1
                 while not rs.eof
               %>
                    	<img src="../<%=rs("img_sl")%>" alt="" />
               <%
                  rs.movenext
                  wend
                  rs.close
                  set rs=nothing
               %>
<!--结束-->
</div>
<!--end box-1-->

<div class="divpro_de_top">
<p><strong>站点地图</strong></p>
</div>
<div class="clear"></div>
<div class="divpro_de_detail">
<table border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td style=" width:900px; height:10px;">&nbsp;</td></tr>
<tr><td style=" width:900px; height:30px; padding-left:30px; " align="left"><a href="index.asp"><strong>首页</strong></a></td></tr>
<tr><td style=" width:900px; height:30px;" align="left"></td></tr>
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="culture.asp"><strong>公司简介</strong></a></td></tr>
<tr><td style=" width:900px; padding:20px;" align="left">
<table border="0" cellpadding="0" cellspacing="0">
<tr>

<td style=" width:150px; height:30px;" align="center">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center">
<a href="abou_t.asp">关于我们</a>
</td></tr>
</table>

</td>
<td style=" width:150px; height:30px;" align="center">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center">
<a href="team.asp">团队协作</a>
</td></tr>
</table>

</td>
<td style=" width:150px; height:30px;" align="center">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center">
<a href="culture.asp">企业文化</a>
</td></tr>
</table>

</td>
</tr>
</table>
</td></tr>
<tr><td style=" width:900px; height:30px;" align="left"></td></tr>
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="product.asp"><strong>产品中心</strong></a></td></tr>
<!--Company-->
<tr><td style=" width:900px; padding:20px;" align="left">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from pro_lm where fid=0 order by px desc,id_lm desc"
				rs.open sql,conn,1,1
				if not rs.eof then
					
					a=1
					while not rs.eof
			  %>
<td style=" width:150px; height:30px;" align="<% if a mod 2=1 then response.write"center" else response.Write"center" end if %>">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center">
<a href="categry_view.asp?dlm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a>
</td></tr>
</table>

</td>
<% if a mod 5=0 then response.write"</tr><tr>" end if %>
			 <%
                    a=a+1
                    rs.movenext
                    wend
                end if	
                rs.close
                set rs=nothing
             %>
</tr>
</table>
</td></tr>
<!--Company-->
<tr><td style=" width:900px; height:30px;" align="left"></td></tr>
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="news.asp"><strong>新闻中心</strong></a></td></tr>
<!--new-->
<tr><td style=" width:900px; padding:20px;" align="left">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from info_lm where fid=6 order by px desc,id_lm desc"
				rs.open sql,conn,1,1
				if not rs.eof then
					
					a=1
					while not rs.eof
			  %>
<td style=" width:150px; height:30px;" align="<% if a mod 2=1 then response.write"center" else response.Write"center" end if %>">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center">
<a href="news.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a>
</td></tr>
</table>

</td>
<% if a mod 5=0 then response.write"</tr><tr>" end if %>
			 <%
                    a=a+1
                    rs.movenext
                    wend
                end if	
                rs.close
                set rs=nothing
             %>
</tr>
</table>
</td></tr>
<!--new-->
<tr><td style=" width:900px; height:30px;" align="left"></td></tr>
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="download.asp"><strong>下载中心</strong></a></td></tr>
<!--DOWNLOAD-->
<tr><td style=" width:900px; padding:20px;" align="left">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from info_lm where fid=17 order by px desc,id_lm desc"
				rs.open sql,conn,1,1
				if not rs.eof then
					
					a=1
					while not rs.eof
			  %>
<td style=" width:150px; height:30px;" align="<% if a mod 2=1 then response.write"center" else response.Write"center" end if %>">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center">
<a href="download.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a>
</td></tr>
</table>

</td>
<% if a mod 5=0 then response.write"</tr><tr>" end if %>
			 <%
                    a=a+1
                    rs.movenext
                    wend
                end if	
                rs.close
                set rs=nothing
             %>
</tr>
</table>
</td></tr>
<!--DOWNLOAD-->
<tr><td style=" width:900px; height:30px;" align="left"></td></tr>
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="contact.asp"><strong>联系我们</strong></a></td></tr>
<!--CONTACT-->
<tr><td style=" width:900px; padding:20px;" align="left">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<td style=" width:150px; height:30px;" align="center">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center"><a href="contact.asp?id=4">联系我们</a></td></tr>
</table>
</td><td style=" width:150px; height:30px;" align="center">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center"><a href="site.asp">站点地图</a></td></tr>
</table>
</td>
<td style=" width:150px; height:30px;" align="center">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center"><a href="contact.asp?id=6">人才招聘</a></td></tr>
</table>
</td>
</tr>
</table>
</td></tr>
<!--CONTACT-->
</table>
</div>

<!--end box-2-->
<!--#include file="foot.asp"--> 
</body>
</html>
