<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin

'获取提交参数
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

if lm="" or not checknum(lm) or title="" or px="" or not checknum(px)   then 
	call msg("带*号必须填写","")
end if

'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_co "
rs.open sql,conn,1,3
rs.addnew()
	rs("lm")=lm
	rs("title")=title
	rs("title_en")=title_en
	rs("pro_guige")=pro_guige
	rs("pro_danwei")=pro_danwei
	rs("pro_color")=pro_color
	rs("pro_money")=pro_money
	rs("f_body")=f_body
	rs("z_body")=z_body
	rs("z_body_en")=z_body_en
	rs("img_sl")=img_sl
	rs("hot")="no"
	rs("tuijian")="no"
	rs("pass")="yes"
	rs("read_num")=0
	rs("wtime")=now()
	rs("px")=px
rs.update
pro_id=rs("id")
rs.close
set rs=nothing

'在此处加多图上传处理程序
if session("pro_id")<>"" and checknum(session("pro_id")) then
	conn.execute"update pro_img set pro_id="&pro_id&" where pro_id="&session("pro_id")&""
	session("pro_id")=""
end if
call msg("成功添加","location='default.asp?id_lm="&request("lm")&"'")
%>