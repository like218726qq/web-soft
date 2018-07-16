<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin

'获取提交参数
id=html(request.Form("id"))
lm=html(request.Form("lm"))
title=html(request.Form("title"))
title_en=html(request.Form("title_en"))
pro_guige=html(request.Form("pro_guige"))
pro_danwei=html(request.Form("pro_danwei"))
pro_color=html(request.Form("pro_color"))
pro_money=html(request.Form("pro_money"))
f_body=html(request.Form("f_body"))
f_body_en=html(request.Form("f_body_en"))
z_body=request.Form("z_body")
z_body_en=request.Form("z_body_en")
z_body_1=request.Form("z_body_1")
z_body_1_en=request.Form("z_body_1_en")
z_body_2=request.Form("z_body_2")
z_body_2_en=request.Form("z_body_2_en")
z_body_3=request.Form("z_body_3")
z_body_3_en=request.Form("z_body_3_en")
z_body_4=request.Form("z_body_4")
z_body_4_en=request.Form("z_body_4_en")
img_sl=html(request.Form("img_sl"))
px=html(request.Form("px"))
w_url=request.Form("w_url")
ej_lx=html(request.Form("ej_lx"))
ej_lx=html(request.Form("ej_lx"))
sj_lx=html(request.Form("sj_lx"))
sm_lx=html(request.Form("sm_lx"))
ej_fs=html(request.Form("ej_fs"))
sj_pp=html(request.Form("sj_pp"))
ej_fg=html(request.Form("ej_fg"))
ej_xk=html(request.Form("ej_xk"))
ej_xk1=html(request.Form("ej_xk1"))
ej_xk2=html(request.Form("ej_xk2"))

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
	rs("pro_danwei")=pro_danwei
	rs("pro_color")=pro_color
	rs("pro_money")=pro_money
	rs("f_body")=f_body
	rs("f_body_en")=f_body_en
	rs("z_body")=z_body
	rs("z_body_en")=z_body_en
	rs("z_body_1")=z_body_1
	rs("z_body_1_en")=z_body_1_en
	rs("z_body_2")=z_body_2
	rs("z_body_2_en")=z_body_2_en
	rs("z_body_3")=z_body_3
	rs("z_body_3_en")=z_body_3_en
	rs("z_body_4")=z_body_4
	rs("z_body_4_en")=z_body_4_en
	rs("img_sl")=img_sl
	rs("px")=px
	rs("ej_lx")=ej_lx
	rs("ej_lx")=ej_lx
	rs("sj_lx")=sj_lx
	rs("sm_lx")=sm_lx
	rs("ej_fs")=ej_fs
	rs("sj_pp")=sj_pp
	rs("ej_fg")=ej_fg
	rs("ej_xk")=ej_xk
	rs("ej_xk1")=ej_xk1
	rs("ej_xk2")=ej_xk2
	rs.update
end if
rs.close
set rs=nothing

call msg("成功修改","location='"&w_url&"'")
%>

