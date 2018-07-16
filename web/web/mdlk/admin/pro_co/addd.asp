<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin

'获取提交参数
lm=html(request.Form("lm"))
title=html(request.Form("title"))
title_bl=html(request.Form("title_bl"))
pro_guige=html(request.Form("pro_guige"))
pro_danwei=html(request.Form("pro_danwei"))
pro_color=html(request.Form("pro_color"))
pro_money=html(request.Form("pro_money"))
pro_guige_bl=html(request.Form("pro_guige_bl"))
pro_danwei_bl=html(request.Form("pro_danwei_bl"))
pro_color_bl=html(request.Form("pro_color_bl"))
pro_money_bl=html(request.Form("pro_money_bl"))
f_body=html(request.Form("f_body"))
z_body=request.Form("z_body")
z_body_bl=request.Form("z_body_bl")
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
	rs("title_bl")=title_bl
	rs("pro_guige")=pro_guige
	rs("pro_danwei")=pro_danwei
	rs("pro_color")=pro_color
	rs("pro_money")=pro_money
			rs("pro_guige_bl")=pro_guige_bl
	rs("pro_danwei_bl")=pro_danwei_bl
	rs("pro_color_bl")=pro_color_bl
	rs("pro_money_bl")=pro_money_bl
	rs("f_body")=f_body
	rs("z_body")=z_body
	rs("z_body_bl")=z_body_bl
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

call msg("成功添加","location='default.asp?id_lm="&request("lm")&"'")
%>