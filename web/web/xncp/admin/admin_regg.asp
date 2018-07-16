<!--#include file="inc.asp"-->
<%
'检查登录
chklogin
username=lcase(request.form("username"))
password=lcase(request.form("password"))
username1=lcase(request.form("username1"))
password1=lcase(request.form("password1"))
password2=lcase(request.form("password2"))
if username="" or feifa(username) then 
	call msg("原用户名书写不正确(不能使用汉字)","parent.form1.username.focus()")
end if
if password="" or feifa(password) then 
	call msg("原密码书写不正确(不能使用汉字)","parent.form1.password.focus()")
end if
if username1="" or len(username1)<4 then
	call msg("新用户名不能为空，4位(字母、数字)","parent.form1.username1.focus()")
end if
if feifa(username1) then
	call msg("新用户名含有非法字符(不能输入汉字)","parent.form1.username1.focus()")
end if
if password1="" or len(password1)<4  then 
	call msg("新密码不能为空，4位(字母、数字)","parent.form1.password1.focus()")
end if
if feifa(password1) then
	call msg("新密码含有非法字符(不能输入汉字)","parent.form1.password1.focus()")
end if
if password1<>password2 then
	call msg("两次输入密码不一致","parent.form1.password2.focus()")
end if

'连接数据库
opeconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from  master where username='"&username&"' and password='"&password&"'"
rs.open sql,conn,1,3
if rs.eof then 
	call msg("原用户名或密码错误","parent.form1.username.focus()")
else
	rs("username")=lcase(username1)
	rs("password")=lcase(password1)
	rs.update
end if
rs.close
set rs=nothing
session("pyadmin")=""
session("yzpysm")=""
call msg("修改成功,请重新登陆","parent.parent.location='default.asp'")
%>
