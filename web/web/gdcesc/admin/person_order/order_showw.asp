<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'禁止外部登录
checkpost


id=request.Form("id")
h_body=html(request.Form("h_body"))
z_body=html(request.Form("z_body"))
q_url=request.Form("q_url")
order_zt=request.Form("order_zt")
pay_zt=request.Form("pay_zt")

if id="" or not isnumeric(id)  or order_zt="" or pay_zt="" then 	
	call msg("参数错误","")
end if

'连接数据库
openconn
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from person_order where id="&id&""
	rs.open sql,conn,1,3
	if not rs.eof then
		rs("order_zt")=order_zt
		rs("pay_zt")=pay_zt
		rs("h_body")=h_body
		rs("z_body")=z_body
		rs.update()	
	end if
	rs.close
	set rs=nothing
	
	call msg("修改成功","location='order_show.asp?id="&id&"&q_url="&q_url&"'")
%>
