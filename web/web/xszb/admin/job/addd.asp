<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

lang=html(request.Form("lang"))
title=html(request.Form("title"))
z_body=html(request.Form("z_body"))
num=html(request.Form("num"))
address=html(request.Form("address"))
wtime=html(request.Form("wtime"))
etime=html(request.Form("etime"))
px=html(request.Form("px"))

if title="" or z_body="" or wtime="" or etime="" or px="" or not checknum(px) then 
	call msg("带*号的必须填写","")
end if

'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from job"
rs.open sql,conn,1,3
rs.addnew()
	rs("lang")=lang
	rs("title")=title
	rs("z_body")=z_body
	rs("num")=num
	rs("address")=address
	rs("wtime")=wtime
	rs("etime")=etime
	rs("px")=px
	rs("pass")="yes"
rs.update()
rs.close
set rs=nothing

call msg("成功添加","location='default.asp'")
%>
