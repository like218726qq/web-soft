<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin

id=request.Form("id")
lang=html(request.Form("lang"))
title=html(request.Form("title"))
z_body=html(request.Form("z_body"))
num=html(request.Form("num"))
address=html(request.Form("address"))
wtime=html(request.Form("wtime"))
etime=html(request.Form("etime"))
px=html(request.Form("px"))
w_url=request.Form("w_url")
lm=request.Form("lm")

if id="" or not checknum(id) then 
	call msg("参数错误","")
end if

if title="" or z_body="" or wtime="" or etime="" or px="" or not checknum(px) then
	call msg("带*号的必须填写","")
end if

'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from job where id="&id&""
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在","")
else
	rs("lang")=lang
	rs("title")=title
	rs("z_body")=z_body
	rs("num")=num
	rs("address")=address
	rs("wtime")=wtime
	rs("etime")=etime
	rs("px")=px
	rs("pass")="yes"
	rs("lm")=lm
	rs.update()
end if
rs.close
set rs=nothing

call msg("成功修改","location='"&w_url&"'")
%>
