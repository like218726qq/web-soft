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

'屏蔽
select case ac
	case"ping1" 
		conn.execute"update job set pass='no' where id in ("&id&")"
	'恢复
	case "ping2" 
		conn.execute"update job set pass='yes' where id in ("&id&")"
	'删除
	case "del" 
		conn.execute"delete from job  where id in ("&id&")"
	'删除简历
	case "dell" 
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from job_yp where id in ("&id&")"
		rs.open sql,conn,1,3
		while not rs.eof
			'删除简历附件 
			if rs("up_sl")<>"" then
				delfile("../../"&rs("up_sl"))
			end if
			'删除文章
			rs.delete
			rs.update
			rs.movenext
		wend
		rs.close
		set rs=nothing
	'修改排序
	case"px"  
		shu=split(id,",")
		for a=0 to ubound(shu)
			conn.execute"update job set px="&request(shu(a))&" where id="&shu(a)&" "
		next
end select 

call msg("成功操作","location='"&w_url&"'")
%>