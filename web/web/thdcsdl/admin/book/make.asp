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
ac=request("ac")
if id="" or ac="" then 
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
call msg("操作成功","parent.location.reload(1)")

%>