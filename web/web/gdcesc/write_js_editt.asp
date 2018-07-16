<!--#include file="conn.asp"-->
<% 
	'获取提交参数
id=request.Form("id")
title=html(request.Form("title"))
z_body=html(request.Form("z_body"))
send_zt=html(request.Form("send_zt"))
taolun=html(request.Form("taolun"))
z_body1=request.Form("z_body1")
pinglun=request.Form("pinglun")
person_js=html(request.Form("person_js"))
w_url=request.ServerVariables("HTTP_REFERER")

'修改信息

set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_order_xz where id="&id&" "
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在或已删除","")
else
	rs("z_body1")=z_body1
	rs("send_zt")=send_zt
	rs("pinglun")=pinglun
	rs("taolun")=taolun
	rs.update
end if
rs.close
set rs=nothing

call msg("成功修改","location='"&w_url&"'")
%>