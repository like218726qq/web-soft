<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'获取提交参数
id=html(request.Form("id"))
lm=html(request.Form("lm"))
title=html(request.Form("title"))
z_body=request.Form("z_body")
title_en=html(request.Form("title_en"))
z_body_en=request.Form("z_body_en")
px=html(request.Form("px"))
w_url=request.Form("w_url")

titles=request.Form("titles")
keys=request.Form("keys")
des=request.Form("des")
titles_en=request.Form("titles_en")
keys_en=request.Form("keys_en")
des_en=request.Form("des_en")

if id="" or not checknum(id) or lm="" or not checknum(lm) or title="" or px="" or not checknum(px) then 
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
	rs("title_en")=title_en
	rs("z_body_en")=z_body_en
	rs("px")=px

	rs("titles")=titles
	rs("keys")=keys
	rs("des")=des
	rs("titles_en")=titles_en
	rs("keys_en")=keys_en
	rs("des_en")=des_en
	rs.update
end if
rs.close
set rs=nothing

call msg("成功修改","location='default.asp?id_lm="&lm&"'")
%>
