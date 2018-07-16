<!--#include file="html.conn.asp"-->
<%

'获取参数
title=html(request.Form("title"))
order_num=html(request.Form("order_num"))
rename=html(request.Form("rename"))
email=html(request.Form("email"))
phone=html(request.Form("phone"))
fax=html(request.Form("fax"))
post=html(request.Form("post"))
address=html(request.Form("address"))
z_body=html(request.Form("z_body"))
safecode=lcase(trim(request.form("safecode")))

'验证码
if safecode<>session("safecode") or safecode="" or session("safecode")="" then 
	call msg("验证码错误","")
end if

if title="" or order_num="" or rename="" or email="" or phone="" then 
	call msg("带*号的必须填写","")
end if

set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_order"
rs.open sql,conn,1,3
rs.addnew()
	rs("title")=title
	rs("order_num")=order_num
	rs("rename")=rename
	rs("email")=email
	rs("phone")=phone
	rs("fax")=fax
	rs("post")=post
	rs("address")=address
	rs("z_body")=z_body
	rs("wtime")=now()
	rs("ip")=getip()
	rs("chakan")="no"
rs.update()
rs.close()
set rs=nothing

call msg("成功发送","location='price.asp'")

%>