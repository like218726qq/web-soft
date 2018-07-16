<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'禁止外部登录
checkpost


id=request.Form("id")
z_body=html(request.Form("z_body"))
f_body=html(request.Form("f_body"))
if id="" or not isnumeric(id) then 	
	call msg("参数错误","")
end if

'连接数据库
openconn

'如果没有回复记录，就添加一条,否则就修改回复内容和时间
set rs=server.CreateObject("adodb.recordset")
sql="select id_re,z_body,wtime from book where id_re="&id&""
rs.open sql,conn,1,3
if rs.eof then
	rs.addnew()
	rs("id_re")=id
	rs("z_body")=z_body
	rs("wtime")=now()
	rs.update
else
	rs("z_body")=z_body
	rs("wtime")=now()
	rs.update
end if
rs.close
set rs=nothing


if z_body<>"" then
conn.execute"update book set huifu='yes',z_body='"&f_body&"' where id="&id&""
else
conn.execute"update book set huifu='no',z_body='"&f_body&"'  where id="&id&""
end if

call msg("成功回复","location='default.asp'")
%>
