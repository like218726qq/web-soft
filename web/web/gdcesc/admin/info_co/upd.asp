<!--#include file="../inc.asp"-->
<!--#include file="updcon.asp"-->
<%
'检查登录
checklogin

frameid=request("frameid")
kuang=request("kuang")
%>
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
<script language="javascript">
function check()
{
var sAllowExt="<%=AllowExt%>";
file_up=document.formn.file_up;
if (file_up.value=="")
{
  alert('提示：请选择要上传的文件！');
  return false
}

if (!IsExt(file_up.value,sAllowExt))
{
	alert("提示：\n\n请选择一个有效的文件，\n支持的格式有（"+sAllowExt+"）！");
	return false;
}

document.formn.action="updload.asp?frameid=<%=frameid%>&kuang=<%=kuang%>"
document.formn.submit();
} 
// 是否有效的扩展名
function IsExt(url, opt){
	var sTemp;
	var b=false;
	var s=opt.toUpperCase().split("|");
	for (var i=0;i<s.length ;i++ ){
		sTemp=url.substr(url.length-s[i].length-1);
		sTemp=sTemp.toUpperCase();
		s[i]="."+s[i];
		if (s[i]==sTemp){
			b=true;
			break;
		}
	}
	return b;
}
</script>
<!--
formid 表示上传的表单
url 表示保存的地址
kuang 表示存储地址的隐藏文本框
-->
<form name="formn" method="POST" enctype="multipart/form-data" >  
<input type="file" name="file_up" size="20" enctype="multipart/form-data" >
<input name=mysubm  type="button" value="上传"  onclick="check()">     
</form> 
</body>
</html>

 

