<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'禁止站外提交
checkpost

'获取提交参数
lm=bhtml(request.Form("lm"))
title=bhtml(request.Form("title"))
color_font=bhtml(request.Form("color_font"))
uselink=bhtml(request.Form("uselink"))
link_url=bhtml(request.Form("link_url"))
info_from=bhtml(request.Form("info_from"))
info_author=bhtml(request.Form("info_author"))
f_body=html(request.Form("f_body"))
z_body=request.Form("z_body")
img_sl=bhtml(request.Form("img_sl"))
wtime=bhtml(request.Form("wtime"))
px=bhtml(request.Form("px"))
if lm="" or title="" or px=""  then
	call msg("带*号的必须填写","")
end if

'判断录入时间
if wtime<>"" and isdate(wtime)=false then 
	call msg("请输入正确的录入时间","")
end if

if  not isnumeric(px) then 
	call msg("请输入正确的输入显示顺序","")
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
rs("uselink")=uselink
rs("link_url")=link_url
rs("info_from")=info_from
rs("info_author")=info_author
rs("f_body")=f_body
rs("z_body")=z_body
rs("img_sl")=img_sl
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
