<!--#include file="conn.asp"-->
<%

'获取参数
id=request.Form("id")
person_jsj=request.Form("person_jsj")
title=html(request.Form("title"))
title_lm=html(request.Form("title_lm"))
title_ky=html(request.Form("title_ky"))
order_num=html(request.Form("order_num"))
rename=html(request.Form("rename"))
email=html(request.Form("email"))
phone=html(request.Form("phone"))
fax=html(request.Form("fax"))
post=html(request.Form("post"))
address=html(request.Form("address"))
z_body=html(request.Form("z_body"))
leixing=html(request.Form("leixing"))
datehm=html(request.Form("datehm"))
send_zt=html(request.Form("send_zt"))
send_xs=html(request.Form("send_xs"))
person_js=html(request.Form("person_js"))
safecode=lcase(trim(request.form("safecode")))
person_name=session("person")

'验证码
'if safecode<>session("safecode") or safecode="" or session("safecode")="" then 
'	call msg("验证码错误","")
'end if

if datehm="" then 
	call msg("带*号的必须填写","")
end if




set rsa=server.CreateObject("adodb.recordset")
sql="select * from person where username='"&session("person")&"'"
rsa.open sql,conn,1,3
	if rsa("ky")<1 then
		call msg("您好，您现在的预约课程次数已为0次，需要购买课程才能再预约","")
	end if
rsa.close
set rsa=nothing

set rsx=server.CreateObject("adodb.recordset")
sql="select * from info_co_xz where id="&title&" "
rsx.open sql,conn,1,3
if not rsx.eof then
 z_body_xz=rsx("z_body")
 title_xz=rsx("title")
 	set rs2=server.CreateObject("adodb.recordset")
	sql="select * from info_lm_xz where id_lm="&rsx("lm")&""
	rs2.open sql,conn,1,3
	if not rs2.eof then
		title_lm_xz=rs2("title_lm")
	end if
	rs2.close
	set rs2=nothing
 	
end if
rsx.close
set rsx=nothing

set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_order"
rs.open sql,conn,1,3
rs.addnew()
	rs("title")=title_xz
	rs("person_jsj")=person_jsj
	rs("title_lm")=title_lm_xz
	rs("order_num")=order_num
	rs("person_xs")=person_name
	rs("jianjie")=z_body_xz
	rs("rename")=rename
	rs("email")=email
	rs("phone")=phone
	rs("phone")=phone
	rs("fax")=fax
	rs("post")=post
	rs("address")=address
	rs("leixing")=leixing
	rs("title_ky")=title_ky
	rs("datehm")=datehm
	rs("z_body")=z_body
	rs("send_zt")=send_zt
	rs("send_xs")=send_xs
	rs("person_js")=person_js
	rs("wtime")=now()
	rs("ip")=getip()
	rs("chakan")="no"
rs.update()
rs.close()
set rs=nothing

set rsa=server.CreateObject("adodb.recordset")
sql="select * from person where username='"&session("person")&"'"
rsa.open sql,conn,1,3
	rsa("ky")=rsa("ky")-1
rsa.update
rsa.close
set rsa=nothing

call msg("成功预约，到时会有相关人员与你联系，谢谢！","location='person_home.asp'")

%>