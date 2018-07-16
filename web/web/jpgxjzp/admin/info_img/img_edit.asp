<!--#include file="../inc.asp"-->
<!--#include file="img_con.asp"-->
<%
'检查登录
checklogin

id=request("id")
info_id=request("info_id")
if id="" or not checknum(id) then
	call msg("参数错误","")
end if
if info_id<>"" and not checknum(info_id) then
	call msg("参数错误","")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>多图上传</title>
<link href="../css/admin_style.css" rel="stylesheet" />
<LINK href="../admin.css" rel="stylesheet" type="text/css">
<style>
html{overflow-x:hidden;}
body{margin:0px; padding:0px;overflow-x:hidden;}
</style>
<script language="javascript">
function check(){
	var sAllowExt="<%=AllowExt%>";
	var file_up=document.formn.file_up;
	if (file_up.value==""){
	  alert("请选择要上传的文件");
	  return false;
	}
	if (!IsExt(sAllowExt,file_up.value)){
		alert("请选择一个有效的文件，\n\n支持的格式有（"+sAllowExt+"）");
		return false;
	}
} 
function IsExt(opt,url){
	var sTemp;
	var b=false;
	var s=opt.toUpperCase().split("|");
	ext=url.substr(url.lastIndexOf( ".")+1);
	ext=ext.toUpperCase();
	for (var i=0;i<s.length ;i++ ){
		if (s[i]==ext){
			b=true;
			break;
		}
	}
	return b;
}
</script>
</head>

<body>
<table border="0" cellpadding="0" cellspacing="0" >
<form name="formn" method="POST" action="img_editt.asp" enctype="multipart/form-data" onSubmit="return check()">
<input id="id"  type="hidden" name="id" value="<%=id%>"/>
<input id="info_id"  type="hidden" name="info_id" value="<%=info_id%>"/>
  <tr>
    <td><input type="file" name="file_up" id="file_up" size="20" enctype="multipart/form-data" ></td>
    <td>&nbsp;<input name=mysubm  type="submit" value="上传" >  <input name=mysubm  type="button" value="返回" onClick="history.back()" ></td>
  </tr>
</form>
</table>
</body>
</html>
