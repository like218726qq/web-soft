﻿检查 Persits ASP 各组件的注册状态<br>

<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%  Session.CodePage=65001
    Response.CharSet = "utf-8" 
On Error Resume Next

set jpeg=server.createobject("persits.jpeg")
response.write "<p>ASPjpeg "&jpeg.version&" "
if jpeg.expires="9999-9-9" then
	response.write "已注册("&jpeg.expires&")"
else
	response.write "未注册(过期时间:"&jpeg.expires&")"
end if
if jpeg.version < "2.0.0.1" then response.write "<br>ASPjpeg 不是最新版,请升级到最新版本<p>"


set Upload=server.createobject("persits.Upload")
response.write "<p>ASPUpload "&Upload.version&" "

if Upload.expires="9999-9-9" then
	response.write "已注册("&Upload.expires&")"
else
	response.write "未注册(过期时间:"&Upload.expires&")"
end if
if Upload.version < "3.0.0.6" then response.write "<br>ASPUpload 不是最新版,请升级到最新版本<p>"



set Email=server.createobject("Persits.MailSender")
response.write "<p>ASPEmail "&Email.version&" "

if Email.expires="9999-9-9" then
	response.write "已注册("&Email.expires&")"
else
	response.write "未注册(过期时间:"&Email.expires&")"
end if
if Email.version < "5.0.0.7" then response.write "<br>ASPEmail 不是最新版,请升级到最新版本<p>"

%>