<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'获取提交参数
lm=html(request.Form("lm"))
title=html(request.Form("title"))
title_en=html(request.Form("title_en"))
color_font=html(request.Form("color_font"))
link_url=html(request.Form("link_url"))
info_from=html(request.Form("info_from"))
info_author=html(request.Form("info_author"))
f_body=html(request.Form("f_body"))
f_body_en=html(request.Form("f_body_en"))
z_body=request.Form("z_body")
z_body_en=request.Form("z_body_en")
img_sl=html(request.Form("img_sl"))
dow_sl=html(request.Form("dow_sl"))
vid_sl=html(request.Form("vid_sl"))
wtime=html(request.Form("wtime"))
px=html(request.Form("px"))

if lm="" or not checknum(lm) or title="" or px="" or not checknum(px)  then
	call msg("带*号的必须填写","")
end if

'判断录入时间
if wtime<>"" and isdate(wtime)=false then 
	call msg("请输入正确的录入时间","")
end if

'连接数据库
openconn

'添加信息
set rs=server.CreateObject("adodb.recordset")
sql="select * from info_co "
rs.open sql,conn,1,3
rs.addnew()
	rs("lm")=lm
	rs("title")=title
	rs("color_font")=color_font
	rs("link_url")=link_url
	rs("info_from")=info_from
	rs("info_author")=info_author
	rs("f_body")=f_body
	rs("f_body_en")=f_body_en
	rs("z_body")=z_body
			rs("title_en")=title_en
	rs("z_body_en")=z_body_en
	rs("img_sl")=img_sl
	rs("dow_sl")=dow_sl
	rs("vid_sl")=vid_sl
	rs("wtime")=wtime
	rs("px")=px
	rs("hot")="no"
	rs("tuijian")="no"
	rs("pass")="yes"
	rs("read_num")=0
rs.update
rs.close
set rs=nothing

call msg("成功添加","location='default.asp?id_lm="&lm&"';")
%>
