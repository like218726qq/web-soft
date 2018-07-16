<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>客服管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function check()
{
var haoma=document.form1.haoma;
var kf_type=document.form1.kf_type;
var title=document.form1.title;
var px=document.form1.px;

if(haoma.value=="") 
{
alert("提示:客服号码不能为空！");
haoma.focus();
return false;
}
if(kf_type.value=="") 
{
alert("提示:客服用途不能为空！");
kf_type.focus();
return false;
}

if(title.value=="") 
{
alert("提示:客服说明不能为空！");
title.focus();
return false;
}

if (px.value=="")
{
alert("提示:顺序不能为空(只能为数字)！");
px.focus();
return false;
}
}

</script>
<script language="javascript" src="../function.js"></script>
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td colspan="2"  align="center">客服管理----添加客服</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td><a href="default.asp">客服管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加客服</a></td>
  </tr>
</table>

<br />
<form method="POST" name="form1" action="addd.asp" onSubmit="return check()" >
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
    <tr class="title">
      <td align="center" colspan="2">添加客服</td>    
    </tr>
        <tr class="tdbg" >
      <td width="120" align="right"><strong>客服类型：</strong></td>          
        <td ><label>
          <select name="lm" id="lm">
            <option value="qq">QQ</option>
            <option value="msn">MSN</option>
            <option value="skype">skype</option>
            <option value="alibaba">商务通</option>
          </select>
        </label></td>
    </tr>
    <tr class="tdbg">
      <td width="120" align="right"><strong>客服号码：</strong></td>          
        <td >
        <input name="haoma" type="text" id="haoma" maxlength="50"> 
        <font color="#FF0000">*</font></td>
    </tr>
        <tr class="tdbg">
      <td width="120" align="right"><strong>客服作用：</strong></td>          
        <td >
        <input name="kf_type" type="text" id="kf_type" maxlength="50"> 
        <font color="#FF0000">* </font>如&quot;业务咨询&quot;，&quot;售后服务&quot;等</td>
    </tr>
    <tr class="tdbg">
      <td width="120" align="right"><strong>客服说明：</strong></td>          
      <td >
        <input name="title" type="text" id="title" maxlength="50" value="有问题给我消息">
        <font class="hot">*</font></td>
    </tr>
            <tr class="tdbg">
      <td width="120" align="right"><strong>使用人：</strong></td>          
        <td >
        <input name="person" type="text" id="person" maxlength="50"></td>
    </tr>
    <tr class="tdbg">
      <td width="120" align="right"><strong>显示顺序：</strong></td>
        <td ><input name="px" type="text" id="px" value="100" size="8" maxlength="10" > 
          <font  class="fontcolor">*&nbsp;(显示顺序只能为数字，从大到小)</font></td>          
    </tr>
</table>
<p align="center">   
      <INPUT type=submit  value=" 提 交 "  name="submit1"> &nbsp;&nbsp;&nbsp;    
	  <input name="Cancel" type="button" value=" 取 消 " onClick="window.location.href='default.asp'" style="cursor:hand;">
</form>
</body>
		  </html>