<!--#include file="conn.asp"--> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=ying0%></title>
<meta content="<%=ying1%>" http-equiv="keywords" />
<meta content="<%=ying2%>" http-equiv="description" />
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
<p><strong>Site Map</strong></p>
</div>
<div class="clear"></div>
<div class="divpro_de_detail">
<table border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td style=" width:900px; height:10px;">&nbsp;</td></tr>
<tr><td style=" width:900px; height:30px; padding-left:30px; " align="left"><a href="index.asp"><strong>HOME</strong></a></td></tr>
<tr><td style=" width:900px; height:30px;" align="left"></td></tr>
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="culture.asp"><strong>COMPANY</strong></a></td></tr>
<tr><td style=" width:900px; padding:20px;" align="left">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from info_co where lm=15 order by px desc,id desc"
				rs.open sql,conn,1,1
				if not rs.eof then
					
					a=1
					while not rs.eof
			  %>
<td style=" width:150px; height:30px;" align="<% if a mod 2=1 then response.write"center" else response.Write"center" end if %>">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center">
<a href="culture.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
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
<tr><td style=" width:900px; height:30px;" align="left"></td></tr>
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="product.asp"><strong>PRODUCTS</strong></a></td></tr>
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
<a href="categry_view.asp?dlm=<%=rs("id_lm")%>"><%=rs("title_lm_en")%></a>
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
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="news.asp"><strong>NEWS</strong></a></td></tr>
<!--new-->
<tr><td style=" width:900px; padding:20px;" align="left">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from info_lm where fid=16 order by px desc,id_lm desc"
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
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="download.asp"><strong>DOWNLOAD</strong></a></td></tr>
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
<tr><td style=" width:900px; height:30px; padding-left:30px; border-bottom:2px #666 solid;" align="left"><a href="contact.asp"><strong>CONTACT US</strong></a></td></tr>
<!--CONTACT-->
<tr><td style=" width:900px; padding:20px;" align="left">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<td style=" width:150px; height:30px;" align="center">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center"><a href="contact.asp?id=10">Contact us</a></td></tr>
</table>
</td><td style=" width:150px; height:30px;" align="center">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center"><a href="site.asp">Site Map</a></td></tr>
</table>
</td>
<td style=" width:150px; height:30px;" align="center">

<table border="0" cellpadding="0"  align="center"cellspacing="0">
<tr><td style=" width:140px; height:30px;" align="center"><a href="contact.asp?id=12">jobs</a></td></tr>
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
