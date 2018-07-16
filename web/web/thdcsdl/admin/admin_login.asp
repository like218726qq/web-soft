<!--#include file="inc.asp"-->
<%
'禁止外部登录
checkpost

'防sql注入
checksql

safecode=lcase(trim(request.form("safecode")))
username=lcase(trim(request.form("username")))
password=lcase(trim(request.form("password")))

'验证码

if safecode<>session("safecode") or safecode="" or session("safecode")="" then 
	call msg("验证码错误","parent.form1.safecode.focus();")
end if

'检查帐号
if username="" then 
	call msg("帐号不能为空，请重新输入","parent.form1.username.focus();")
end if
if feifa(username) then 
	call msg("帐号含有非法字符，请重新输入","parent.form1.username.focus();") 
end if

'检查密码
if password="" then 
	call msg("密码不能为空，请重新输入","parent.form1.password.focus();")
end if
if feifa(password) then 
	call msg("密码含有非法字符，请重新输入","parent.form1.password.focus();")
end if

'打开数据库
opeconn

sql="select * from master where username='"&bsql(username)&"'"
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,3

'用户是否存在
if rs.eof  or rs.bof then
	call msg("没有该用户，请重新输入","parent.form1.username.focus();") 
end if

'密码是否正确
if rs("password")<>password then 
	call msg("密码错误，请重新输入","parent.form1.password.focus();")  
end if

session.Timeout=60
session("pyadmin")=rs("username")
session("yzpysm")="#@yz123pysm@#"

rs("ntime")=rs("ltime")
rs("ltime")=now()
rs("login_num")=rs("login_num")+1
rs.update
rs.close
set rs=nothing

call msg("成功登录网站管理系统","parent.parent.location='system.asp';")


%>    