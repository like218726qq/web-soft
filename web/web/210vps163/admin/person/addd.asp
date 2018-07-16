<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'获取提交参数
username=html(lcase(trim(request.Form("username"))))
password=html(lcase(trim(request.Form("password"))))
rename=html(trim(request.Form("rename")))
email=html(trim(request.Form("email")))
phone=html(trim(request.Form("phone")))
fax=html(trim(request.Form("fax")))
post=html(trim(request.Form("post")))
address=html(trim(request.Form("address")))
z_body=html(trim(request.Form("z_body")))

if  len(username)<4 or len(username)>20 or len(password)<4 or len(password)>20 or feifa(username) or feifa(password)  then
	call msg("用户名或密码格式不正确","")
end if

'连接数据库
openconn

'添加信息
set rs=server.CreateObject("adodb.recordset")
sql="select * from person where username='"&username&"'"
rs.open sql,conn,1,3
if not rs.eof then
	call msg("该用户名已存在，使用人是"&rs("rename")&"","")
else
	rs.addnew()
		rs("username")=username
		rs("password")=password
		rs("rename")=rename
		rs("email")=email
		rs("phone")=phone
		rs("fax")=fax
		rs("post")=post
		rs("address")=address
		rs("z_body")=z_body
		rs("pass")="yes"
		rs("login_num")=0
		rs("wtime")=now()
		rs("wip")=getip()
	rs.update
end if
rs.close
set rs=nothing

call msg("成功添加","location='default.asp';")
%>
