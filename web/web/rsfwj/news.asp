<!--#include file="top.asp"-->
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
			dao=""&title_lm
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
			dao=""&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
		rs.close
		set rs=nothing
	end if
%>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11">&nbsp;</td>
    <td width="239" valign="top"><!--#include file="new_left.asp"-->
 

      <table width="239" height="24" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <!--#include file="left_con.asp"--></td>
    <td width="36" height="100">&nbsp;</td>
    <td valign="top"><table width="707" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="379" height="29"><strong><%if dao="" then%>新闻中心<%else%><%=dao%><%end if%></strong></td>
        <td width="328" align="right" class="weiz" style="padding-right:15px;">您当前位置：<a href="index.asp">首页</a> &gt;&gt; <a href="#"><%if dao="" then%>新闻中心<%else%><%=dao%><%end if%></a></td>
      </tr>
      <tr>
        <td colspan="2"><img src="images/products_tiao.jpg" width="707" height="1" /></td>
      </tr>
    </table>
      <table width="707" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
        <table width="707" border="0" cellspacing="0" cellpadding="0" class="new_tab">
 <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,wtime from info_co where pass='yes' "&sq&" order by px desc,id desc"
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
  
  <tr>
    <td width="20"><span style="color:#005d96">·</span></td>
    <td width="574"><a href="news_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
    <td width="113" align="right"><span style="color:#999;">[<%=formatdate(rs("wtime"))%>]</span></td>
  </tr>

<%
		a=a+1
		rs.movenext
		wend
	end if
	rs.close
	set rs=nothing
%>
</table>
<div class="page"><%if pagenum<>"" then call listpage(pra) end if%></div>

  </tr>
</table>

 <!--#include file="foot.asp"-->