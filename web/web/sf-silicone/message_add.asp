<!--#include file="conn.asp"-->
<%
title=html(request.Form("title"))
rename=html(request.Form("rename"))
email=html(request.Form("email"))
compname=html(request.Form("compname"))
phone=html(request.Form("phone"))
address=html(request.Form("address"))
z_body=html(request.Form("z_body"))


'验证码


if title="" or email="" or rename="" then 
	call msg("带*号的必须填写","")
end if

set rs=server.CreateObject("adodb.recordset")
sql="select * from book"
rs.open sql,conn,1,3
rs.addnew()
	rs("title")=title
	rs("email")=email
	rs("rename")=rename
	rs("compname")=compname
	rs("phone")=phone
	rs("address")=address
	rs("z_body")=z_body
	rs("wtime")=now()
	rs("ip")=getip()
	rs("pass")="no"
	rs("huifu")="no"
	rs("chakan")="no"
rs.update()
rs.close()
set rs=nothing


 
on Error Resume Next
		Set objMail = Server.CreateObject("CDO.Message") 
		Set objConfig = Server.CreateObject("CDO.Configuration") 
		objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
		objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
		objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") ="smtp.ym.163.com"
		objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
		objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "js49@heyou51.com" '这行无意思，可去掉  703520731@qq.com
		objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "heyou51" '这行无意思，可去掉
		objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/languagecode") = "0x0804"
		objConfig.Fields.Update()
		
		Set objMail.Configuration = objConfig
		objMail.Subject = "森富塑胶-在线留言"
		objMail.From = "js49@heyou51.com" 
		objMail.To = "luke@sf-silicone.com"
		objMail.BodyPart.ContentTransferEncoding = "7bit"
		'如果使用多國語言時，才要設定 Charset
		objMail.BodyPart.Charset = "gb2312"
		
		body=body&"信函标题："&title&"<br/>"
		body="客户姓名："&rename&"<br />"
		body="公司名称："&compname&"<br />"
		body=body&"联系电话："&phone&"<br/>"
		body=body&"联系地址："&address&"<br/>"
		body=body&"电子邮箱："&email&"<br/>"
		body=body&"留言内容："&z_body&"<br/>"
 		objMail.HTMLBody = body
		'objMail.AddAttachment(http://xxxxxx/xxxx.xxx) '或者其他任何正确的url,包括http,ftp,file等等
		objMail.Send


call msg("恭喜您提交成功，我们会尽快与你联系！","location='feedback.asp'")
%>