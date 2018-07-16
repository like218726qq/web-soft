<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'禁止外部提交
checkpost

'连接数据库
openconn

id=bhtml(request.Form("id"))
site_title=bhtml(request.Form("site_title"))
site_key=bhtml(request.Form("site_key"))
site_des=bhtml(request.Form("site_des"))
site_bot=html(request.Form("site_bot"))
email=html(request.Form("email"))

if id="" or not isnumeric(id) then 
	call msg("参数错误","")
end if

conn.execute"update setup set site_title='"&site_title&"',site_key='"&site_key&"',site_des='"&site_des&"',site_bot='"&site_bot&"',email='"&email&"' where id="&id&""

'application.Lock()
'dim zhong(3)
'zhong(0)=site_title
'zhong(1)=site_key
'zhong(2)=site_des
'zhong(3)=site_bot
'application("setup")=zhong
'application.UnLock()

call msg("成功修改","location='edit.asp'")
%>
