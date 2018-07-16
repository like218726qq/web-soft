<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'获取提交参数
lm=html(request.Form("lm"))
title=html(request.Form("title"))
z_body=request.Form("z_body")
img_sl=html(request.Form("img_sl"))
px=html(request.Form("px"))

if lm="" or not checknum(lm) or title="" or px="" or not checknum(px) then 
	call msg("带*号的必须填写","")
end if

'连接数据库
openconn

'添加信息
set rs=server.CreateObject("adodb.recordset")
sql="select * from tol_co "
rs.open sql,conn,1,3
rs.addnew()
	rs("lm")=lm
	rs("title")=title
	rs("z_body")=z_body
	rs("img_sl")=img_sl
	rs("px")=px
rs.update
rs.close
set rs=nothing

call msg("成功添加","location='default.asp?id_lm="&lm&"';")
%>
