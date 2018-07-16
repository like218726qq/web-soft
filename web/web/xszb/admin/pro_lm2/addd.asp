<!--#include file="../inc.asp"-->
<%
'验证登录情况
checklogin

'提交参数
fid=html(request.form("fid"))
title_lm=html(request.Form("title_lm"))
add_xx=html(request.Form("add_xx"))
xia=html(request.Form("xia"))
px=html(request.Form("px"))

'验证提交数据
if title_lm="" or px="" or not checknum(px) then
	call msg("带*号的必须填写","")
end if

'连接数据库
openconn

'添加数据
set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_lm "
rs.open sql,conn,1,3
rs.addnew()
	rs("fid")=fid
	rs("title_lm")=title_lm
	rs("add_xx")=add_xx
	rs("xia")=xia
	rs("px")=px
rs.update()
rs.close()
set rs=nothing

'关闭数据库
closeconn

response.Write "<script language='javascript'>if (confirm('分类添加成功,\r\n确定要继续添加吗?')) {location='add.asp'}  else {location='default.asp'}</script>"
%>