<!--#include file="conn.asp"-->
<% 
	'获取提交参数
id=request.Form("id")
title=html(request.Form("title"))
title_lm=html(request.Form("title_lm"))
z_body=html(request.Form("z_body"))
send_zt=html(request.Form("send_zt"))
taolun=html(request.Form("taolun"))
z_body1=request.Form("z_body1")
pinglun=request.Form("pinglun")
person_js=html(request.Form("person_js"))

jianjie=request.Form("jianjie")
mubiao=request.Form("mubiao")
danci=html(request.Form("danci"))
leixing=html(request.Form("leixing"))
w_url=request.ServerVariables("HTTP_REFERER")

'修改信息

set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_order where id="&id&" "
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在或已删除","")
else
	rs("mubiao")=mubiao
	rs("jianjie")=jianjie
	rs("title_lm")=title_lm
	rs("danci")=danci
	rs("leixing")=leixing
	rs("title")=title
	rs("pinglun")=pinglun
	rs("taolun")=taolun
	rs("send_zt")=send_zt
	rs.update
end if
rs.close
set rs=nothing

call msg("成功修改","location='"&w_url&"'")
%>