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

conn.execute"DELETE FROM pro_order WHERE id in ( "&id&")"

call msg("操作成功","parent.location.reload(1)")
%>