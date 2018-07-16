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
		sql="select top 1 id_lm,title_lm from info_lm where fid=2 order by px desc,id_lm desc"
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
	k=4
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
        	<!--#include file="left_news.asp"-->
        	<div class="listR">
            	<div class="listRt"><%if title_lm="" then%>
				新闻资讯
				<%else%>
				<%=title_lm%>
                <%end if%></div>
            	<div class="Rcon">
                	<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,wtime from info_co where lm in(1,2) and pass='yes' "&sq&" order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=15
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="3%" align="center"><img src="images/arrow.gif" width="5" height="5" /></td>
  <td width="70%" style="height:26px; line-height:26px;">
  <a href="disnews.asp?id=<%=rs("id")%>" title="<%=rs("title")%>"><font style="color:<%=rs("color_font")%>;"><%=getstr(rs("title"),46)%></font></a></td>
  <td width="21%" align="right"><%=formatdate(rs("wtime"))%></td>
  <td width="3%">&nbsp;</td>
</tr>
<tr>
  <td colspan="4" style="background:url(images/underline.gif) 0px 0px repeat-x; height:1px;"></td>
  </tr>
</table>
<%
	    a=a+1
		rs.movenext
		wend
	end if
	rs.close
	set rs=nothing
%>
<div style="margin-top:8px;"> <%if pagenum<>"" then call listpage(pra) end if%></div>              
                </div>           
            </div>
        	<div class="clear"></div>
        </div>   
 	</div>      
    <div class="clear"></div>
	<!--#include file="foot.asp"-->
</body>
</html>
