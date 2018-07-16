<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin
	
'禁止外部提交
checkpost

id=request.Form("id")
title=bhtml(request.Form("title"))
z_body=html(request.Form("z_body"))
wtime=bhtml(request.Form("wtime"))
etime=bhtml(request.Form("etime"))
px=bhtml(request.Form("px"))

if id="" or not isnumeric(id) then 
	call msg("参数错误","")
end if

if title="" or z_body="" or wtime="" or etime="" or px="" or not isnumeric(px) then
	call msg("带*号的必须填写","")
end if

'连接数据库
openconn

conn.execute"update job set title='"&title&"',z_body='"&z_body&"',wtime='"&wtime&"',etime='"&etime&"',px="&px&" where id="&id&""

call msg("成功修改招聘","location='default.asp'")
%>
