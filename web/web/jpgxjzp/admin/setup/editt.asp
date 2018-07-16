<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'连接数据库
openconn

id=html(request.Form("id"))
site_title=html(request.Form("site_title"))
site_key=html(request.Form("site_key"))
site_des=html(request.Form("site_des"))
site_bot=request.Form("site_bot")
site_title_en=html(request.Form("site_title_en"))
site_key_en=html(request.Form("site_key_en"))
site_des_en=html(request.Form("site_des_en"))
site_bot_en=request.Form("site_bot_en")
site_count=html(request.Form("site_count"))
site_can1=request.Form("site_can1")
site_can2=request.Form("site_can2")
site_can3=request.Form("site_can3")
site_can4=request.Form("site_can4")
site_can5=request.Form("site_can5")
site_can6=request.Form("site_can6")
site_can7=request.Form("site_can7")
site_can8=request.Form("site_can8")
site_can9=request.Form("site_can9")
site_can10=request.Form("site_can10")

site_can1_en=request.Form("site_can1_en")
site_can2_en=request.Form("site_can2_en")
site_can3_en=request.Form("site_can3_en")
site_can4_en=request.Form("site_can4_en")
site_can5_en=request.Form("site_can5_en")
site_can6_en=request.Form("site_can6_en")
site_can7_en=request.Form("site_can7_en")
site_can8_en=request.Form("site_can8_en")
site_can9_en=request.Form("site_can9_en")
site_can10_en=request.Form("site_can10_en")

if id="" or not checknum(id) then 
	call msg("参数错误","")
end if

set rs=server.CreateObject("adodb.recordset")
sql="select * from setup where id="&id&""
rs.open sql,conn,1,3
	rs("site_title")=site_title
	rs("site_key")=site_key
	rs("site_des")=site_des
	rs("site_bot")=site_bot
	rs("site_title_en")=site_title_en
	rs("site_key_en")=site_key_en
	rs("site_des_en")=site_des_en
	rs("site_bot_en")=site_bot_en
	rs("site_count")=site_count
	rs("site_can1")=site_can1
	rs("site_can2")=site_can2
	rs("site_can3")=site_can3
	rs("site_can4")=site_can4
	rs("site_can5")=site_can5
	rs("site_can6")=site_can6
	rs("site_can7")=site_can7
	rs("site_can8")=site_can8
	rs("site_can9")=site_can9
	rs("site_can10")=site_can10
	
	rs("site_can1_en")=site_can1_en
	rs("site_can2_en")=site_can2_en
	rs("site_can3_en")=site_can3_en
	rs("site_can4_en")=site_can4_en
	rs("site_can5_en")=site_can5_en
	rs("site_can6_en")=site_can6_en
	rs("site_can7_en")=site_can7_en
	rs("site_can8_en")=site_can8_en
	rs("site_can9_en")=site_can9_en
	rs("site_can10_en")=site_can10_en
rs.update()
rs.close()
set rs=nothing


application.Lock()
	dim zhong(3)
	zhong(0)=site_title
	zhong(1)=site_key
	zhong(2)=site_des
	zhong(3)=site_bot
	'这个sitename变量要换成你在做的网站名，如果是中英文版的话，就网站名+版本文件夹名
	application("sitename")=zhong
application.UnLock()

call msg("成功修改","location='edit.asp'")
%>
