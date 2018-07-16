<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
	
'禁止外部提交
checkpost

title=bhtml(request.Form("title"))
z_body=html(request.Form("z_body"))
wtime=bhtml(request.Form("wtime"))
etime=bhtml(request.Form("etime"))
px=bhtml(request.Form("px"))
if title="" or z_body="" or wtime="" or etime="" or px="" or not isnumeric(px) then 
	call msg("带*号的必须填写","")
end if

'连接数据库
openconn

conn.execute"insert into job (title,z_body,wtime,etime,px,pass)values('"&title&"','"&z_body&"','"&wtime&"','"&etime&"',"&px&",'yes')"

call msg("成功添加招聘","location='default.asp'")
%>
