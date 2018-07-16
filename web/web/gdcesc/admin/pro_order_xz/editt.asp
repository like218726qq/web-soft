<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'获取提交参数
id=html(request.Form("id"))
person_xs=request.Form("person_xs")
wtime=html(request.Form("wtime"))
title=html(request.Form("title"))
datehm=html(request.Form("datehm"))
jianjie=html(request.Form("jianjie"))
mubiao=html(request.Form("mubiao"))
danci=html(request.Form("danci"))
taolun=html(request.Form("taolun"))
leixing=html(request.Form("leixing"))
send_zt=html(request.Form("send_zt"))
ip=html(request.Form("ip"))
z_body=html(request.Form("z_body"))
z_body1=request.Form("z_body1")
pinglun=request.Form("pinglun")
person_js=html(request.Form("person_js"))




'连接数据库
openconn

'修改信息
set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_order_xz where id="&id&" "
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在或已删除","")
else
	rs("z_body1")=z_body1
	rs("person_js")=person_js
	rs("jianjie")=jianjie
	rs("mubiao")=mubiao
	rs("danci")=danci
	rs("taolun")=taolun
	rs("leixing")=leixing
	rs("title")=title
	rs("pinglun")=pinglun
	rs("send_zt")=send_zt
	rs.update
end if
rs.close
set rs=nothing

call msg("成功修改","location='"&w_url&"'")
%>
