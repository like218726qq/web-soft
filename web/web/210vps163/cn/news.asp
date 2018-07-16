<!--#include file="conn.asp"--> 
<%
	lm=request("lm")
	if lm<>"" then
		if not checknum(lm) then
			call msg("参数错误","")
		else
			lm=clng(lm)
			sql="select id_lm,title_lm from info_lm where id_lm="&lm&""
			set rs=server.CreateObject("adodb.recordset")
			rs.open sql,conn,1,1
			if not rs.eof then
				lm=rs("id_lm")
				title_lm=rs("title_lm")
			end if
			rs.close
			set rs=nothing
			dao=" &gt; "&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
	else
		sql="select top 1 id_lm,title_lm from info_lm where fid=6 order by px desc,id_lm desc"
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn,1,1
		if not rs.eof then
			lm=rs("id_lm")
			title_lm=rs("title_lm")
			dao=" &gt; "&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
		rs.close
		set rs=nothing
	end if
%>
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
                 sql="select top 1 * from info_co where lm=29 order by px desc,id desc"
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
<div class="box-2">
  <div class="main">
    <div class="pro-left-bar">
	<table border="0" cellpadding="0" cellspacing="0">
     <tr><td style=" width:288px; height:424px; background:url(images/news_left.jpg) left top no-repeat; " valign="top">
	
	
     <table border="0" cellpadding="0" cellspacing="0">
     <tr><td style=" width:288px; height:26px;">&nbsp;</td></tr>
     <tr><td style=" width:288px; padding-bottom:30px; " valign="top">
     <div class="pro-Main-list">
 <br/> <ul class="n-list">
       <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=6 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
      
             <li><a href="news.asp?lm=<%=rs("id_lm")%>" class="p1"><%=rs("title_lm")%></a></li><br/>
 <%  rs.movenext
    wend
	rs.close
	set rs=nothing
%>
            </ul>
   
      <div class="clear"></div></div>
     </td></tr>
     <tr><td style=" width:288px; height:6px;"></td></tr>
     </table>
	 </td></tr>
	  <tr><td style=" width:288px; height:6px;"><img src="images/ny1_23.jpg" alt="" /></td></tr>
	 </table>
	 <!--end proDwon-->
    </div>
    <!--end pro-left-bar-->
    <div class="pro-right-bar">
   	  <div class="proT"><p>新闻中心 <%=dao%></p></div>
      <div class="proM">
       <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style=" width:700px; height:345px; padding:10px;" align="center" valign="top">
      <!--开始-->
      <table border="0" cellpadding="0" align="center" cellspacing="0">
   <tr><td colspan="3" style=" height:30px;" align="center">
   <!--news-->
       <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_co where pass='yes' "&sq&" order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=4
		rs.pagesize=pagenum
		counter=rs.recordcount
		pagezong=rs.pagecount
		pageno=trim(request.querystring("page"))
		if pageno="" or not isnumeric(pageno) then 
			pageno=1
		end if
		if pageno<1 then
			pageno=1
		end if
		if pageno-pagezong>0 then 
			pageno=pagezong
		end if
		rs.absolutepage=pageno
		a=1
		while not rs.eof and a<=pagenum
%>
    <table border="0" cellpadding="0" align="center" cellspacing="0">
	<tr><td style=" width:110px; height:90px;"><a href="news_show.asp?id=<%=rs("id")%>">
	<%if rs("img_sl")<>"" then%>
	<img src="../<%=rs("img_sl")%>" alt="" />
	<%end if%>
	</a></td>
	<td style=" width:500px; height:90px;">
	 <!--newscon-->
	  <table border="0" cellpadding="0" align="center" cellspacing="0">
	<tr><td style=" width:490px; height:20px; padding-left:10px;" align="left"><span style=" width:140px;"><%=formatdate(rs("wtime"))%></span></td></tr>
	<tr><td style=" width:482px; height:38px; padding:6px;  font-size:12px;"  align="left"><span style=" width:450px; font-size:12px;"><a href="news_show.asp?id=<%=rs("id")%>"><font style="color:<%=rs("color_font")%>;"><%=getstr(rs("title"),50)%></font></a></span><br/>
	<%=cutStr(rs("z_body"),90)%>......<a href="news_show.asp?id=<%=rs("id")%>">更多详情</a>
	</td></tr>
	</table>

	 <!--newscon-->	</td>
	</tr>
	<tr><td style=" height:20px" colspan="2">&nbsp;</td></tr>
	</table>	
	<%
	    a=a+1
		rs.movenext
		wend
	end if
	rs.close
	set rs=nothing
%>
   <!--news-->
   </td></tr>
      <tr><td colspan="3" style=" height:30px;" align="center"><%if pagenum<>"" then call listpage(pra) end if%></td></tr>
      </table>
      <!--结束-->
      </td></tr>
      </table>
      </div>
      <div class="proB"><img src="images/ny_28.jpg" /></div>
    </div>
  </div>
  <!--end main-->
  <div class="clear"></div>
</div>
<!--end box-2-->
<!--#include file="foot.asp"--> 
</body>
</html>
