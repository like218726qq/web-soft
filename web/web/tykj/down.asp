<!--#include file="conn.asp"-->
<!--#include file="top.asp"-->

<table width="320" border="0" cellspacing="0" cellpadding="0" align="center" style="border:1px solid #CCC">
  <tr>
    <td width="95" valign="top" style="padding-left:5px;border:1px solid #CCC"><!--#include file="left.asp"--></td>
    <td valign="top" align="center"><table cellpadding="0" cellspacing="0" border="0" width="100%" style="font-size:13px;">
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,wtime,dow_sl from info_co where pass='yes' and lm=8 order by px desc,id desc"
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
		pageno=clng(pageno)
		rs.absolutepage=pageno
		a=1
		while not rs.eof and a<=pagenum
%>
	<tr>
    
		<td id=news_a align="left" height="25" width="70%" style="border-bottom:1px dotted #CCCCCC; padding-left:10px;">
			
			<a href="<%=rs("dow_sl")%>" target="_blank"><font style="color:#000000" >
			<%
				title=rs("title")
				if len(title)>35 then title=left(title,35)&"..."
			%>
			<%=title%>
			</font></a>
		</td>
		<td align="right" width="30%" style="border-bottom:1px dotted #CCCCCC;padding-right:5px;">[<%=formatdate(rs("wtime"))%>]</td>
	</tr>                
<%
		a=a+1
		rs.movenext
		wend
	end if
	rs.close
	set rs=nothing
%>
	<tr><td colspan="3" height="35" valign="middle"><div style="width:160px;margin:0 auto"><%if pagenum<>"" then call listpage_num(page) end if%></div></td></tr>
</table></td>
  </tr>

</table>

<!--#include file="foot.asp"-->

