<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
	
'禁止外部提交
checkpost

lm=bhtml(request.Form("lm"))
haoma=bhtml(request.Form("haoma"))
kf_type=bhtml(request.Form("kf_type"))
title=bhtml(request.Form("title"))
person=bhtml(request.Form("person"))
px=bhtml(request.Form("px"))

if haoma="" or kf_type="" or title="" or px="" or not isnumeric(px) then 
	call msg("带*号的必须填写","")
end if

'连接数据库
openconn
set rs=server.CreateObject("adodb.recordset")
sql="select * from ser_co"
rs.open sql,conn,1,3
rs.addnew()
rs("lm")=lm
rs("haoma")=haoma
rs("kf_type")=kf_type
rs("title")=title
rs("person")=person
rs("px")=px
rs.update()
rs.close
set rs=nothing
call msg("成功添加","location='default.asp'")
%>
