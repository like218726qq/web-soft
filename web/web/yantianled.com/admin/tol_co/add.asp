<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>资料管理</title>
<link href="../css/admin_style.css"  type="text/css" rel="stylesheet">
<script src="../scripts/function.js"></script>
<script language = "JavaScript">
function Check(){
	var lm=document.form1.lm;
	var title=document.form1.title;
	var px=document.form1.px;
	if (lm.value=="n"){
		alert("请选择栏目");
		lm.focus();
		return false;
	}
	if (lm.value=="no"){
		alert("所选栏目不允许添加信息");
		lm.focus();
		return false;
	}
	if (title.value==""){
		 alert("标题不能为空");
		 title.focus();
		 return false;
	}
	if (px.value==""){
		 alert("排序不能为空");
		 px.focus();
		 return false;
	}
}
</script>

</head>

<body >
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center" class="topbg">
    <td  colspan="2" >资料管理----添加资料</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td ><a href="default.asp">资料管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加资料</a></td>
  </tr>
</table>
<br>
<form action="addd.asp" name="form1" method="post" onSubmit="return Check()">
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center" class="title">
    <td colspan="2" >添加资料</td>
    </tr>
  <tr>
    <td width="195"  align="right" class="tdbg"><strong>所属栏目：</strong></td>
    <td width="1102" class="tdbg"> 
	   <select name="lm">
		<option value="n" selected>请选择栏目</option>
		<%
		
		'连接数据库
		openconn
		
		'添加信息时显示栏目过程
		Set rsa= Server.CreateObject("ADODB.Recordset")
		sql="select * from tol_lm where fid=0 order by px desc,id_lm desc"
		rsa.open sql,conn,1,1
		while not rsa.eof 	
			i=""
			if rsa("add_xx")="yes" then
				response.write"<OPTION value='"&rsa("id_lm")&"'>• "&rsa("title_lm")&"</OPTION>"&chr(10)
			else
				response.write"<OPTION value='no'>• "&rsa("title_lm")&"×</OPTION>"&chr(10)
			end if
			call addinfo(rsa("id_lm"),i)
			rsa.movenext
		wend
		rsa.close
		set rsa=nothing
		
		'关闭数据库
		closeconn
		
		sub addinfo(fid,i)
		i=i&"&nbsp;"
		sql="select * from tol_lm where fid="&fid&" order by px desc,id_lm desc"
		Set rsb= Server.CreateObject("ADODB.Recordset")
		rsb.open sql,conn,1,1
		while not rsb.eof
			if rsb("add_xx")="yes" then
				response.write"<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"</option>"&chr(10)
			else
				response.write"<option value='no'>"&i&" 　|—"&rsb("title_lm")&"×</option>"&chr(10)
			end if 
			call addinfo(rsb("id_lm"),i&" 　|&nbsp;")
			rsb.movenext
		wend
		rsb.close
		set rsb=nothing
		end sub
		%>
	 </select>
     </td>
  </tr>
    <tr>
    <td width="195" align="right" class="tdbg"><strong>标　　题：</strong></td>
    <td class="tdbg"><input name="title" type="text" id="title" size="30" maxlength="150"></td>
  </tr>
  <tr>
    <td width="195" align="right" class="tdbg"><strong>标　　题(西班牙语)：</strong></td>
    <td class="tdbg"><input name="title_bl" type="text" id="title" size="30" maxlength="150"></td>
  </tr>
   <tr>
    <td width="195" align="right" class="tdbg"><strong>内　　容：</strong></td>
    <td class="tdbg">
    <!-- #INCLUDE file="../fckeditor.asp" -->
    <%
    Dim oFCKeditor
    Set oFCKeditor = New FCKeditor
    oFCKeditor.Config("LinkBrowser") = "true" 
    oFCKeditor.Config("ImageBrowser") = "true" 
    oFCKeditor.Config("FlashBrowser") = "true" 
    oFCKeditor.Config("LinkUpload") = "true" 
    oFCKeditor.Config("ImageUpload") = "true" 
    oFCKeditor.Config("FlashUpload") = "true" 
    oFCKeditor.Value = ""
    oFCKeditor.Create "z_body"
    %>	
    </td>
  </tr>
   <tr>
    <td width="195" align="right" class="tdbg"><strong>内　　容(西班牙语)：</strong></td>
    <td class="tdbg">
    <%
    oFCKeditor.Value = ""
    oFCKeditor.Create "z_body_bl"
    %>	
    </td>
  </tr>
<tr class="tdbg">
    <td width="195" align="right"><STRONG>显示顺序：</STRONG></td>
    <td><input name="px" type="text" id="px" value="100" size="8" maxlength="10" >
      <FONT color=red>*(从大到小排序)</FONT></td>
  </tr>
  
</table><p align="center">   
		<INPUT type="submit" id="b1" name="b1"   value=" 添 加 " > &nbsp;       <input name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="location='default.asp'" style="cursor:hand;">  </p>
</form>
</body>
</html>
