<!--#include file="../inc.asp"-->
<%
'验证登录情况
checklogin

'提交参数
fid=html(request.form("fid"))
title_lm=html(request.Form("title_lm"))
title_lm_en=html(request.Form("title_lm_en"))
add_xx=html(request.Form("add_xx"))
xia=html(request.Form("xia"))
px=html(request.Form("px"))
img_sl=html(request.Form("img_sl"))
nodes=html(request.Form("nodes"))
nodes_en=html(request.Form("nodes_en"))

titles=request.Form("titles")
keys=request.Form("keys")
des=request.Form("des")
titles_en=request.Form("titles_en")
keys_en=request.Form("keys_en")
des_en=request.Form("des_en")

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
	rs("title_lm_en")=title_lm_en
	rs("add_xx")=add_xx
	rs("xia")=xia
	rs("px")=px
	rs("img_sl")=img_sl
	rs("nodes")=nodes
	rs("nodes_en")=nodes_en

	rs("titles")=titles
	rs("keys")=keys
	rs("des")=des
	rs("titles_en")=titles_en
	rs("keys_en")=keys_en
	rs("des_en")=des_en
rs.update()
rs.close()
set rs=nothing

'关闭数据库
closeconn

response.Write "<script language='javascript'>if (confirm('分类添加成功,\r\n确定要继续添加吗?')) {location='add.asp?id_lm="&fid&"'}  else {location='default.asp'}</script>"
%>