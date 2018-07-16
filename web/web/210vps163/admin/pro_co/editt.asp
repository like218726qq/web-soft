<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin

'获取提交参数
id=html(request.Form("id"))
lm=html(request.Form("lm"))
title=html(request.Form("title"))
title_en=html(request.Form("title_en"))
pro_guige=request.Form("pro_guige")
pro_guige_en=request.Form("pro_guige_en")
pro_danwei=request.Form("pro_danwei")
pro_danwei_en=request.Form("pro_danwei_en")
pro_color=request.Form("pro_color")
pro_color_en=request.Form("pro_color_en")
pro_money=request.Form("pro_money")
pro_money_en=request.Form("pro_money_en")
f_body=html(request.Form("f_body"))
f_body_en=html(request.Form("f_body_en"))
z_body=request.Form("z_body")
z_body_en=request.Form("z_body_en")
img_sl=html(request.Form("img_sl"))
px=html(request.Form("px"))
w_url=request.Form("w_url")

if id="" or not checknum(id) or lm="" or title="" or px="" or not checknum(px) then 
	call msg("带*号必须填写","")
end if

'连接数据库
openconn

'修改数据
set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_co where id="&id&" "
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在或已删除","")
else
	rs("lm")=lm
	rs("title")=title
	rs("title_en")=title_en
	rs("pro_guige")=pro_guige
	rs("pro_guige_en")=pro_guige_en
	rs("pro_danwei")=pro_danwei
	rs("pro_danwei_en")=pro_danwei_en
	rs("pro_color")=pro_color
	rs("pro_color_en")=pro_color_en
	rs("pro_money")=pro_money
	rs("pro_money_en")=pro_money_en
	rs("f_body")=f_body
	rs("f_body_en")=f_body_en
	rs("z_body")=z_body
	rs("z_body_en")=z_body_en
	rs("img_sl")=img_sl
	rs("px")=px
	rs.update
end if
rs.close
set rs=nothing

call msg("成功修改","location='"&w_url&"'")
%>

