<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'接收参数
fid=html(request.Form("fid"))
title_lm=html(request.Form("title_lm"))
px=html(request.Form("px"))
add_xx=html(request.Form("add_xx"))
xia=html(request.Form("xia"))
link_url=html(request.Form("link_url"))
info_from=html(request.Form("info_from"))
f_body=html(request.Form("f_body"))
z_body=html(request.Form("z_body"))
img_sl=html(request.Form("img_sl"))
s_pic=html(request.Form("s_pic"))
s_typ=html(request.Form("s_typ"))
s_wid=html(request.Form("s_wid"))
s_hei=html(request.Form("s_hei"))
dow_sl=html(request.Form("dow_sl"))
vid_sl=html(request.Form("vid_sl"))
wtime=html(request.Form("wtime"))
node=html(request.Form("node"))


titles=request.Form("titles")
keys=request.Form("keys")
des=request.Form("des")
titles_en=request.Form("titles_en")
keys_en=request.Form("keys_en")
des_en=request.Form("des_en")


'检查参数
if title_lm="" or px="" or not checknum(px) then
	call msg("带*号的必须填写",";")
end if

'连接数据库
openconn

'添加数据
set rs=server.CreateObject("adodb.recordset")
sql="select * from info_lm "
rs.open sql,conn,1,3
rs.addnew()
	rs("fid")=fid
	rs("title_lm")=title_lm
	rs("px")=px
	rs("add_xx")=add_xx
	rs("xia")=xia
	rs("link_url")=link_url
	rs("info_from")=info_from
	rs("f_body")=f_body
	rs("z_body")=z_body
	rs("img_sl")=img_sl
	rs("s_pic")=s_pic
	rs("s_typ")=s_typ
	rs("s_wid")=s_wid
	rs("s_hei")=s_hei
	rs("dow_sl")=dow_sl
	rs("vid_sl")=vid_sl
	rs("wtime")=wtime
	rs("node")=node
	
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

response.Write "<script language='javascript'>if (confirm('栏目添加成功,\r\n确定要继续添加吗?')) {location='add.asp'}  else {location='default.asp'}</script>"
%>