<!--#include file="conn.asp"-->
<%
title=html(request.Form("title"))
rename=html(request.Form("rename"))
email=html(request.Form("email"))
compname=html(request.Form("compname"))
phone=html(request.Form("phone"))
address=html(request.Form("address"))
z_body=html(request.Form("z_body"))
safecode=lcase(trim(request.form("safecode")))

'验证码
if safecode<>session("safecode") or safecode="" or session("safecode")="" then 
	call msg("Verification code error.","")
end if

if title="" or email="" or rename="" then 
	call msg("With an asterisk must be filled","")
end if

set rs=server.CreateObject("adodb.recordset")
sql="select * from book"
rs.open sql,conn,1,3
rs.addnew()
	rs("title")=title
	rs("lang")="en"
	rs("email")=email
	rs("rename")=rename
	rs("compname")=compname
	rs("phone")=phone
	rs("address")=address
	rs("z_body")=z_body
	rs("wtime")=now()
	rs("ip")=getip()
	rs("pass")="no"
	rs("huifu")="no"
	rs("chakan")="no"
rs.update()
rs.close()
set rs=nothing

call msg("Success message, please wait for the administrator audit","location='message.asp'")
%>