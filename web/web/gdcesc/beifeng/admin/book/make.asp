<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

id=request("id")
ac=request("ac")
id=replace(id," ","")
del=replace(id,",","")
w_url=request.ServerVariables("HTTP_REFERER")

if del="" or not checknum(del) or ac="" then
	call msg("参数错误","")
end if

'连接数据库
openconn

select case ac
'删除
case "del" 
	conn.execute"delete from book where id in ("&id&")"	
	conn.execute"delete from book where id_re in ("&id&")"

'屏蔽
case"ping1" 
	conn.execute"update book set pass='no' where id="&id&""
'审核
case"ping2" 
	conn.execute"update book set pass='yes' where id="&id&""
end select

call msg("成功操作","location='"&w_url&"'")

%>