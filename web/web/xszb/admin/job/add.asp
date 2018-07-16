<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>招聘管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
<script language="javascript">
function check(){
	var title=document.form1.title;
	var z_body=document.form1.z_body;
	var wtime=document.form1.wtime;
	var etime=document.form1.etime;
	var px=document.form1.px;
	if(title.value=="") {
		alert("招聘职位不能为空");
		title.focus();
		return false;
	}
	if (z_body.value==""){
		alert("职位要求不能为空");
		z_body.focus();
		return false;
	}
	if (wtime.value==""){
		alert("发布日期不能为空");
		wtime.focus();
		return false;
	}
	if (etime.value==""){
		alert("结束日期不能为空");
		etime.focus();
		return false;
	}
	if (px.value==""){
		alert("排序不能为空(只能为数字)");
		px.focus();
		return false;
	}
}
</script>

</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td colspan="2"  align="center">人才招聘管理----添加招聘</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td><a href="default.asp">管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加招聘</a>&nbsp;</td>
  </tr>
</table>

<br />
<form method="POST" name="form1" action="addd.asp" onSubmit="return check()" >
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
    <tr class="title">
      <td align="center" colspan="2">添加招聘</td>    
    </tr>
        <tr class="tdbg">
      <td width="120" align="right"><strong>发布网站：</strong></td>          
        <td ><input type="radio" name="lang" value="cn" checked="checked" />中文版<input type="radio" name="lang" value="en"  />英文版</td>
    </tr> 
    <tr class="tdbg">
      <td width="120" align="right"><strong>招聘职位：</strong></td>          
        <td >
        <input name="title" type="text" id="title" size="40" maxlength="50"> <font color="#FF0000">*</font>      </td>
    </tr>        
    <tr class="tdbg" >          
        <td width="120" align="right" valign="top" ><strong>职位要求：</strong></td>
        <td ><textarea name="z_body" cols="70" rows="10" id="z_body"></textarea> <font class="fontcolor">*</font></td>
    </tr> 
    <tr class="tdbg">
      <td width="120" align="right"><strong>招聘人数：</strong></td>
        <td ><input name="num" type="text" id="num"  maxlength="50">
          &nbsp;&nbsp; &nbsp;工作地点：<input name="address" type="text" id="address" value="" maxlength="50" /></td>          
    </tr>      
    <tr class="tdbg">
      <td width="120" align="right"><strong>发布日期：</strong></td>
        <td ><input name="wtime" type="text" id="wtime" value="<%=date()%>" maxlength="50"> 
          <font  class="fontcolor">*</font>&nbsp;&nbsp;结束日期：<input name="etime" type="text" id="etime" value="<%=date()+30%>" maxlength="50" />
        <font  class="fontcolor">*&nbsp;</font></td>          
    </tr>
    <tr class="tdbg">
      <td width="120" align="right"><strong>显示顺序：</strong></td>
        <td ><input name="px" type="text" id="px" value="100" size="8" maxlength="10" > 
          <font  class="fontcolor">*&nbsp;(从大到小排序)</font></td>          
    </tr>
</table>
<p align="center">   
      <INPUT type=submit  value=" 提 交 "  name="submit1"> &nbsp;&nbsp;&nbsp;    
	  <input name="Cancel" type="button" value=" 取 消 " onClick="window.location.href='default.asp'" style="cursor:hand;">
</form>
</body>
		  </html>