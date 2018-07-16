<!--#include file="../inc.asp"-->
<%
pro_id=request.Form("pro_id")
%>
<%
'检查登录
checklogin

'获取提交参数
id=html(request.Form("id"))
lm=html(request.Form("lm"))
title=html(request.Form("title"))
color_font=html(request.Form("color_font"))
link_url=html(request.Form("link_url"))
info_from=html(request.Form("info_from"))
info_author=html(request.Form("info_author"))
f_body=html(request.Form("f_body"))
z_body=request.Form("z_body")
img_sl=html(request.Form("img_sl"))
dow_sl=html(request.Form("dow_sl"))
vid_sl=html(request.Form("vid_sl"))
wtime=html(request.Form("wtime"))
px=html(request.Form("px"))
w_url=request.Form("w_url")

'判断必填项
if id="" or not checknum(id) or lm="" or not checknum(lm) or title="" or px="" or not checknum(px) then
	'call msg("带*号的必须填写","")
end if

'判断录入时间
if wtime<>"" and isdate(wtime)=false then 
	call msg("请输入正确的录入时间","")
end if

'连接数据库
openconn
lm=1

'修改信息
set rs=server.CreateObject("adodb.recordset")
sql="select * from img_co where id="&id&" "
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在或已删除","")
else
	rs("lm")=lm
	rs("title")=title
	rs("color_font")=color_font
	rs("link_url")=link_url
	rs("info_from")=info_from
	rs("info_author")=info_author
	rs("f_body")=f_body
	rs("z_body")=z_body
	rs("img_sl")=img_sl
	rs("dow_sl")=dow_sl
	rs("vid_sl")=vid_sl
	rs("wtime")=wtime
	rs("px")=px
	rs("pro_id")=pro_id
	rs.update
end if
rs.close
set rs=nothing
w_url="default.asp?id_lm="&lm&"&pro_id="&pro_id
call msg("成功修改","location='"&w_url&"'")
%>
