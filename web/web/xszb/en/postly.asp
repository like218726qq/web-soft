<!--#include file="data/conn.asp"-->
<%
Dim un,co,ad,tel,em,qq,content,mss
un=Request.Form("username")
'co=Request.Form("company")
ad=Request.Form("address")
tel=Request.Form("tel")
em=Request.Form("email")
fax=Request.Form("fax")
content=Request.Form("content")
if Len(un)=0 then
	mss="姓名不可以为空!"
elseif Len(content)=0 then
	mss="留言内容不可以为空!"
else
	mss="留言已成功提交，我们会尽快处理!"
	set rs=Server.CreateObject("ADODB.RecordSet")
	'conn.Execute("insert into message (username,company,address,tel,email,fax,content) values ('"&un&"','"&co&"','"&ad&"','"&tel&"','"&em&"','"&fax&"','"&content&"')")
	conn.Execute("insert into message (username,address,tel,email,fax,content) values ('"&un&"','"&ad&"','"&tel&"','"&em&"','"&fax&"','"&content&"')")
end if
Response.Write("<script type=""text/javascript"">alert('"&mss&"');location.href='messages.asp';</script>")
%>