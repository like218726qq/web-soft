<!--#include file="conn.asp"-->
<%
'禁止外部提交
checkpost

title=bhtml(request.Form("title"))
person=bhtml(request.Form("person"))
email=bhtml(request.Form("email"))
compname=bhtml(request.Form("compname"))
phone=bhtml(request.Form("phone"))
addr=bhtml(request.Form("addr"))
z_body=html(request.Form("z_body"))
safecode=lcase(trim(request.form("safecode")))

'验证码
if safecode<>session("safecode") or safecode="" or session("safecode")="" then 
	call msg("验证码错误","")
end if

if title="" or email="" or person="" then 
	call msg("带*号的必须填写","")
end if

conn.execute "insert into book (title,email,person,compname,phone,addr,z_body,wtime,ip,pass,huifu,chakan) values('"&title&"','"&email&"','"&person&"','"&compname&"','"&phone&"','"&addr&"','"&z_body&"','"&now()&"','"&getip()&"','no','no','no')"

call msg("成功留言","location='message.asp'")
%>