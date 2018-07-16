<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'禁止外部提交
checkpost

'检查sql注入
checksql

id=request("id")
id=replace(id," ","")
if id="" then 
	call msg("参数错误","")
end if

'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from person_order_xz where id in ("&id&")"
rs.open sql,conn,1,3
while not rs.eof
	set rsa=server.CreateObject("adodb.recordset")
	sql="select * from person_pro where order_no='"&rs("order_no")&"'"
	rsa.open sql,conn,1,3
	while not rsa.eof
			
	rsa.delete()
	rsa.update()
	rsa.movenext
	wend
	rsa.close
	set rsa=nothing
	rs.delete()
	rs.update()
rs.movenext
wend
rs.close
set rs=nothing
call msg("操作成功","parent.location.reload(1)")
%>