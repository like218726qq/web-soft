<!--#include file="conn.asp"-->
<% 
	'获取提交参数
id=request.Form("id")
send_xs=html(request.Form("send_xs"))
w_url=request.ServerVariables("HTTP_REFERER")

'修改信息

set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_order where id="&id&" "
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在或已删除","")
else
	rs("send_xs")=send_xs
	rs.update
end if
rs.close
set rs=nothing

call msg("成功修改","location='"&w_url&"'")
%>