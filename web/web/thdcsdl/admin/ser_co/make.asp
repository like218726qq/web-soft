<!--#include file="../inc.asp"-->
<%

'检查登录
checklogin

'禁止外部提交
checkpost

'检查sql注入
checksql

'传递参数
id=request("id")
ac=request("ac")
id=replace(id," ","")
del=replace(id,",","")

if del="" or not isnumeric(del) or ac="" then
	call msg("参数错误",";")
end if
'连接数据库
openconn

'屏蔽
select case ac

		'删除
		case "del" 
			conn.execute"delete from ser_co  WHERE id in ("&id&")"
			
		'修改排序
		case"px"  
			shu=split(id,",")
			for a=0 to ubound(shu)
				conn.execute"update ser_co set px="&request(shu(a))&" where id="&shu(a)&" "
			next
end select 
call msg("成功操作","parent.location.reload(1)")
%>