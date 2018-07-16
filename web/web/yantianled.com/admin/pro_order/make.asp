<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

id=request("id")
id=replace(id," ","")
del=replace(id,",","")
w_url=request.ServerVariables("HTTP_REFERER")

if del="" or not checknum(del) then
	call msg("参数错误",";")
end if

'连接数据库
openconn

conn.execute"delete from pro_order where id in ( "&id&")"

call msg("成功操作","location='"&w_url&"'")
%>