<!--#include file="../inc.asp"-->
<!--#include file="img_con.asp"-->
<%
'检查登录
checklogin
pro_id=trim(request("pro_id"))
if pro_id<>"" and not checknum(pro_id) then
	pro_id=""
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
<form name="formn" method="POST" action="img_addd.asp" enctype="multipart/form-data" onsubmit="return check()">
<input id="pro_id"  type="hidden" name="pro_id" value="<%=pro_id%>"/>
  <tr>
    <td><input type="file" name="file_up" id="file_up" size="20" enctype="multipart/form-data" ></td>
    <td>&nbsp;<input name=mysubm  type="submit" value="上传" >  </td>
  </tr>
</form>
</table>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
	<%
    openconn
    if (pro_id<>"" and checknum(pro_id)) or (session("pro_id")<>"" and checknum(session("pro_id"))) then
		set rs=server.CreateObject("adodb.recordset")
		if pro_id<>"" and checknum(pro_id) then
			sql="select * from pro_img where pro_id="&pro_id&""
		elseif session("pro_id")<>"" and checknum(session("pro_id")) then
			sql="select * from pro_img where pro_id="&session("pro_id")&""
		end if
		rs.open sql,conn,1,1
		a=1
		while not rs.eof
		%>
		<td width="102" height="125" align="center" valign="bottom">
		<table  border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td bgcolor="#e4e4e4" width="88" height="88"><img src="../../<%=rs("img_sl")%>" border="0" width="80" height="80"/></td>
		  </tr>
		  <tr>
			<td align="center" height="33"><input name="" type="button" value="修改" onclick="location='img_edit.asp?id=<%=rs("id")%>&pro_id=<%=pro_id%>'"/>&nbsp;<input name="" type="button" value="删除" onclick="location='img_make.asp?id=<%=rs("id")%>&pro_id=<%=pro_id%>'"/></td>
		  </tr>
		</table>
		</td>
	<%
		if a mod 6 =0 then 
			response.write "</tr><tr>" 
		end if
		a=a+1
		rs.movenext
		wend
		rs.close
		set rs=nothing
	end if
    %>
  </tr>
</table>
</body>
</html>
