<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin

'获取提交参数
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
img_sl=html(request.Form("img_sl"))
px=html(request.Form("px"))

titles=request.Form("titles")
keys=request.Form("keys")
des=request.Form("des")
titles_en=request.Form("titles_en")
keys_en=request.Form("keys_en")
des_en=request.Form("des_en")

pro_can1=html(request.Form("pro_can1"))
pro_can2=html(request.Form("pro_can2"))
pro_can3=html(request.Form("pro_can3"))
pro_can4=html(request.Form("pro_can4"))
pro_can5=html(request.Form("pro_can5"))
pro_can6=html(request.Form("pro_can6"))
pro_can7=html(request.Form("pro_can7"))
pro_can8=html(request.Form("pro_can8"))
pro_can9=html(request.Form("pro_can9"))
pro_can10=html(request.Form("pro_can10"))

pro_can1_en=html(request.Form("pro_can1_en"))
pro_can2_en=html(request.Form("pro_can2_en"))
pro_can3_en=html(request.Form("pro_can3_en"))
pro_can4_en=html(request.Form("pro_can4_en"))
pro_can5_en=html(request.Form("pro_can5_en"))
pro_can6_en=html(request.Form("pro_can6_en"))
pro_can7_en=html(request.Form("pro_can7_en"))
pro_can8_en=html(request.Form("pro_can8_en"))
pro_can9_en=html(request.Form("pro_can9_en"))
pro_can10_en=html(request.Form("pro_can10_en"))

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
	rs("f_body_en")=f_body_en
	rs("z_body")=z_body
	rs("z_body_en")=z_body_en
	rs("img_sl")=img_sl
	rs("hot")="no"
	rs("tuijian")="no"
	rs("pass")="yes"
	rs("read_num")=0
	rs("wtime")=now()
	rs("px")=px
	
	rs("titles")=titles
	rs("keys")=keys
	rs("des")=des
	rs("titles_en")=titles_en
	rs("keys_en")=keys_en
	rs("des_en")=des_en
	
	rs("pro_can1")=pro_can1
	rs("pro_can2")=pro_can2
	rs("pro_can3")=pro_can3
	rs("pro_can4")=pro_can4
	rs("pro_can5")=pro_can5
	rs("pro_can6")=pro_can6
	rs("pro_can7")=pro_can7
	rs("pro_can8")=pro_can8
	rs("pro_can9")=pro_can9
	rs("pro_can10")=pro_can10
	
	rs("pro_can1_en")=pro_can1_en
	rs("pro_can2_en")=pro_can2_en
	rs("pro_can3_en")=pro_can3_en
	rs("pro_can4_en")=pro_can4_en
	rs("pro_can5_en")=pro_can5_en
	rs("pro_can6_en")=pro_can6_en
	rs("pro_can7_en")=pro_can7_en
	rs("pro_can8_en")=pro_can8_en
	rs("pro_can9_en")=pro_can9_en
	rs("pro_can10_en")=pro_can10_en

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