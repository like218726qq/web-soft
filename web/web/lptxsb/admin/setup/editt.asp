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
	application("26lptx")=zhong
application.UnLock()

call msg("成功修改","location='edit.asp'")
%>
