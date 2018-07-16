<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'连接数据库
openconn

site_title=html(request.Form("site_title"))
site_key=html(request.Form("site_key"))
site_des=html(request.Form("site_des"))
site_bot=request.Form("site_bot")

site_title_en=html(request.Form("site_title_en"))
site_key_en=html(request.Form("site_key_en"))
site_des_en=html(request.Form("site_des_en"))
site_bot_en=request.Form("site_bot_en")


set rs=server.CreateObject("adodb.recordset")
sql="select * from setup where id=1"
rs.open sql,conn,1,3
	rs("site_title")=site_title
	rs("site_key")=site_key
	rs("site_des")=site_des
	rs("site_bot")=site_bot
rs.update()
rs.close()
set rs=nothing

set rs=server.CreateObject("adodb.recordset")
sql="select * from setup where id=2"
rs.open sql,conn,1,3
	rs("site_title")=site_title_en
	rs("site_key")=site_key_en
	rs("site_des")=site_des_en
	rs("site_bot")=site_bot_en
rs.update()
rs.close()
set rs=nothing

application.Lock()
	dim zhong(3)
	zhong(0)=site_title
	zhong(1)=site_key
	zhong(2)=site_des
	zhong(3)=site_bot
	'这个变量最好是网站名，如果是中英文版的话，就网站名+版本文件夹名
	application("26hmlj_en")=zhong
	
	dim ying(3)
	ying(0)=site_title_en
	ying(1)=site_key_en
	ying(2)=site_des_en
	ying(3)=site_bot_en
	'这个变量最好是网站名，如果是中英文版的话，就网站名+版本文件夹名
	application("26hmlj_bl")=ying
application.UnLock()

call msg("成功修改","location='edit.asp'")
%>
