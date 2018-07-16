<!--#include file="conn.asp"-->
<%
'获取参数
job_title=html(request.Form("job_title"))
username=html(request.Form("username"))
phone=html(request.Form("phone"))
email=html(request.Form("email"))
z_body=html(request.Form("z_body"))
up_sl=html(request.Form("up_sl"))
safecode=lcase(trim(request.form("safecode")))

'验证码
if safecode<>session("safecode") or safecode="" or session("safecode")="" then 
	call msg("验证码错误","")
end if

if job_title="" or username="" or phone="" then 
	call msg("带*号的必须填写","")
end if

set rs=server.CreateObject("adodb.recordset")
sql="select * from job_yp"
rs.open sql,conn,1,3
rs.addnew()
	rs("job_title")=job_title
	rs("username")=username
	rs("phone")=phone
	rs("email")=email
	rs("z_body")=z_body
	rs("up_sl")=up_sl
	rs("wtime")=now()
	rs("ip")=getip()
	rs("chakan")="no"
rs.update()
rs.close()
set rs=nothing


call msg("成功应聘","location='yinpin.asp?job_title="&escape(job_title)&"'")

%>