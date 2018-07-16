<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'参数传递
id=request("id")
ac=request("ac")
id=replace(id," ","")
del=replace(id,",","")
w_url=request.ServerVariables("HTTP_REFERER")

if del="" or not checknum(del) or ac="" then
	call msg("参数错误",";")
end if

'连接数据库
openconn

'根据参数操作
select case ac
	case "del"
		conn.execute"delete from person1 where id in ("&id&")"
	case "pass1"
		conn.execute"update person1 set pass='no' where id in ("&id&")"
	case "pass2"
		conn.execute"update person1 set pass='yes' where id in ("&id&")"
		
end select 

call msg("成功操作","location='"&w_url&"'")
%>