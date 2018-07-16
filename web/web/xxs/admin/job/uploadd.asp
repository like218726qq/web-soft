<!--#include file="../inc.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
body{ margin:0px; padding:0px;  height:22px;}
A 
{
	font-size:12px;
	TEXT-DECORATION: none;
	color: #000000;
}
A:hover
{
	COLOR: #195288;
	text-decoration: underline;
}
</style>
</head>

<body >
<%

ac=request("ac")
frameid=request("frameid")
kuang=request("kuang")
img_sl=request("img_sl")
if ac="" then
	if img_sl="" then
		response.write"<script>location='up.asp?frameid="&frameid&"&kuang="&kuang&"'</script>"
	else
		response.write"<a href='uploadd.asp?frameid="&frameid&"&kuang="&kuang&"&img_sl="&img_sl&"&ac=del' onclick='return confirm(""确定要删除文件吗？"")'>删除文件,重新上传</a>"
	end if
elseif ac="del" then
	if img_sl<>"" then
		delfile("../../"&img_sl)
	end if
	response.write"<script>parent.document.getElementById("""&kuang&""").value='';</script>"
	response.write"<script>location='up.asp?frameid="&frameid&"&kuang="&kuang&"'</script>"
end if
%>
</body>
</html>