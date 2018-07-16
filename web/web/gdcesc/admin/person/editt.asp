<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'获取提交参数
id=trim(request.Form("id"))
ky=trim(request.Form("ky"))
xz=trim(request.Form("xz"))
username=lcase(trim(request.Form("username")))
password=lcase(trim(request.Form("password")))
post=html(trim(request.Form("post")))
rename=html(trim(request.Form("rename")))
phone=html(trim(request.Form("phone")))
fax=html(trim(request.Form("fax")))
email=html(trim(request.Form("email")))
xx=html(trim(request.Form("xx")))
nj=html(trim(request.Form("nj")))
zy=html(trim(request.Form("zy")))
address=html(trim(request.Form("address")))
xingbie=html(trim(request.Form("xingbie")))
z_body=html(trim(request.Form("z_body")))
w_url=request.Form("w_url")

if id="" or not checknum(id) then
	call msg("参数错误","")
end if

if ky="" or not checknum(id) then
	ky=0
end if

if xz="" or not checknum(id) then
	xz=0
end if

if len(username)<4 or len(username)>20 or len(password)<4 or len(password)>20 or feifa(username) or feifa(password)  then
	call msg("用户名或密码格式不正确","")
end if

'连接数据库
openconn

'查看该用户名是否其他人在使用
set rs=server.CreateObject("adodb.recordset")
sql="select * from person where username='"&username&"' and id<>"&id&""
rs.open sql,conn,1,3
if not rs.eof then
	call msg("该用户名已存在，使用人是"&rs("rename")&"","")
end if
rs.close
set rs=nothing

set rs=server.CreateObject("adodb.recordset")
sql="select * from person where id="&id&""
rs.open sql,conn,1,3
if rs.eof then
	call msg("该帐号不存在或已删除","")
else
	rs("username")=username
	rs("password")=password
	rs("rename")=rename
	rs("email")=email
	rs("phone")=phone
	rs("fax")=fax
	rs("post")=post
	rs("address")=address
	rs("xingbie")=xingbie
	rs("zy")=zy
	rs("xx")=xx
	rs("nj")=nj
	rs("z_body")=z_body
	rs("ky")=ky
	rs("xz")=xz
	rs.update
end if
rs.close
set rs=nothing

call msg("成功修改","location='"&w_url&"'")
%>
