<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin
	


id=request.Form("id")
lm=bhtml(request.Form("lm"))
haoma=bhtml(request.Form("haoma"))
kf_type=bhtml(request.Form("kf_type"))
title=bhtml(request.Form("title"))
person=bhtml(request.Form("person"))
px=bhtml(request.Form("px"))

if id="" or not isnumeric(id) then 
	call msg("参数错误","")
end if

if haoma="" or kf_type="" or title="" or px="" or not isnumeric(px) then 
	call msg("带*号的必须填写","")
end if

'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from ser_co where id="&id&""
rs.open sql,conn,1,3
if not rs.eof then
	rs("lm")=lm
	rs("haoma")=haoma
	rs("kf_type")=kf_type
	rs("title")=title
	rs("person")=person
	rs("px")=px
rs.update
end if

call msg("成功修改客服","location='default.asp'")
%>
