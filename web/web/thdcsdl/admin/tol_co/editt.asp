<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'禁止站外提交
checkpost

'获取提交参数
id=request.Form("id")
lm=request.Form("lm")
title=bhtml(request.Form("title"))
z_body=request.Form("z_body")
px=bhtml(request.Form("px"))

if id="" or not isnumeric(id) then 
	call msg("参数错误","")
end if
if lm="" or title="" or px="" or not isnumeric(px) then 
	call msg("带*号的必须填写","")
end if

'连接数据库
openconn

'修改信息
set rs=server.CreateObject("adodb.recordset")
sql="select * from tol_co where id="&id&" "
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在或已删除","")
else
	rs("lm")=lm
	rs("title")=title
	rs("z_body")=z_body
	rs("px")=px
	rs.update
end if
rs.close
set rs=nothing

call msg("成功修改","location='default.asp?id_lm="&lm&"';")
%>
