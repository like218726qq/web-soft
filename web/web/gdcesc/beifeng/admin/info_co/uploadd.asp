<!--#include file="../inc.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_style.css"  type="text/css" rel="stylesheet">
<style>
body{ margin:0px; padding:0px; background-color:#e5ebf1; height:22px;}
</style>
</head>

<body >
<%
'检查登录
checklogin

ac=request("ac")
frameid=request("frameid")
kuang=request("kuang")
img_sl=request("img_sl")
s_pic=request("s_pic")
s_typ=request("s_typ")
s_wid=request("s_wid")
s_hei=request("s_hei")

if ac="" then
	if img_sl="" then
		response.write"<script>location='up.asp?frameid="&frameid&"&kuang="&kuang&"&s_pic="&s_pic&"&s_typ="&s_typ&"&s_wid="&s_wid&"&s_hei="&s_hei&"'</script>"
	else
		response.write"&nbsp;<img src='../images/img.gif' onmouseover=popImage(this,'../../"&img_sl&"'); onmouseout=hideLayer();>　<a href='uploadd.asp?frameid="&frameid&"&kuang="&kuang&"&img_sl="&img_sl&"&ac=del&s_pic="&s_pic&"&s_typ="&s_typ&"&s_wid="&s_wid&"&s_hei="&s_hei&"' onclick='return confirm(""确定要删除文件吗？"")'>删除文件,重新上传</a>"
	end if
elseif ac="del" then
	if img_sl<>"" then
		delfile("../../"&img_sl)
		delfile("../../"&mid(img_sl,1,instrrev(img_sl,"/"))&"d"&mid(img_sl,instrrev(img_sl,"/")+1))
	end if
	response.write"<script>parent.document.getElementById("""&kuang&""").value='';</script>"
	response.write"<script>location='up.asp?frameid="&frameid&"&kuang="&kuang&"&s_pic="&s_pic&"&s_typ="&s_typ&"&s_wid="&s_wid&"&s_hei="&s_hei&"'</script>"
end if
%>
<script language="javascript">
function hideLayer()
{	
	var layer =parent.document.getElementById("popImageLayer");
	layer.style.visibility='hidden';
}
function popImage(obj,img) 
{ 
	var layer = parent.document.getElementById("popImageLayer");
	obj=parent.document.getElementById("<%=frameid%>")
	
	var t=obj.offsetTop;
	var l=obj.offsetLeft;
	while(obj=obj.offsetParent)
	{
		t+=obj.offsetTop;
		l+=obj.offsetLeft;
	}
	var ext=GetFileExtension(img);
	if ((ext=="gif")||(ext=="jpg")||(ext=="bmp")||(ext=="png"))
	{
	var content ="<br><IMG src='"+img+"' id='img_m' onload='DrawImage(this,220,220);' border='0'   style='FILTER: alpha(opacity=10);' >"; 
	}
	else
	{
	var content ="<br><br><br><IMG src='../images/img/"+ext+".gif' id='img_m' onload='DrawImage(this,220,220);' border='0'   style='FILTER: alpha(opacity=10);' >"; 
	}
	layer.innerHTML=content;
	layer.style.left =(l+20)+'px';
	layer.style.top = (t-10)+'px';
	layer.style.visibility='visible';
}
function GetFileExtension(name) 
{
var ext = name.substring(name.lastIndexOf(".") + 1, name.length);
return ext.toLowerCase(); 
}
</script>
</body>
</html>