<!--#include file="html.conn.asp"-->

<%
rename=bhtml(Request.Form("rename"))
tit=bhtml(Request.Form("title"))
address=bhtml(Request.Form("address"))
pho=bhtml(Request.Form("phone"))
ema=bhtml(Request.Form("email"))
com=bhtml(Request.Form("compname"))
z_body=bhtml(Request.Form("z_body"))
safecode=lcase(trim(request.form("safecode")))

'验证码
if safecode<>session("safecode") or safecode="" or session("safecode")="" then 
	call msg("验证码错误","")
end if

if tit="" then
	call msg("标题不能为空","")
elseif rename="" then
	call msg("姓名不能为空","")
elseif ema="" then
	call msg("电子邮箱不能为空","")
end if

conn.Execute("insert into book (title,rename,compname,address,phone,email,z_body,wtime,ip,pass,lang) values ('"&tit&"','"&rename&"','"&com&"','"&address&"','"&pho&"','"&ema&"','"&z_body&"','"&now()&"','"&getip()&"','no','cn')")

call msg("留言成功","location='message.asp'")
%>