<!--#include file="inc.asp"-->
<%
'检查登录
chklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.STYLE1 {font-weight: bold}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>合优网络：管理员用户切换</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css">
<script src="function.js"></script>
</head>

<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">  
<tr class="topbg">
  <td  colspan="2"  align="center">管理员帐号密码修改</td>
</tr> 
<tr class="tdbg">
  <td width="70" height="26" ><strong>管理导航：</strong></td>
  <td>填写旧帐号密码&nbsp;--&gt;&nbsp;填写新帐号密码--&gt;修改成功&nbsp;</td>
</tr>
</table>
<br>
<form name="form1" method="post" action="admin_regg.asp"  target="theblank">
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class=title>
    <td  colspan="2" align="center">管理员帐号密码修改</td>
  </tr>
  <tr class="tdbg">
    <td width="120"  height="22" align="right"><strong>原用户名 ：</strong></td>
    <td>
	<input name="username" type="text" style="width:100pt " size="20" maxlength="12"  >
	<span class="style1">	</span></td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right"><strong>原 密 码 ： </strong></td>
    <td><input name="password" type="password" style=" width:100pt " size="20" maxlength="12"   >      </td>
  </tr>
    <tr class="tdbg">
    <td width="120" height="22" align="right"><strong>新 用 户 ：</strong></td>
    <td>
	<input name="username1" type="text" style=" width:100pt " size="20" maxlength="12"  >
    <span class="fontcolor">4-12位(字母、数字)不区分大小写</span><span class="style1">	</span></td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right"><strong>新 密 码 ： </strong></td>
    <td><input name="password1" type="password" style=" width:100pt " size="20" maxlength="12"   >
      <span class="fontcolor">4-12位(字母、数字)不区分大小写</span> </td>
  </tr>  <tr class="tdbg">
    <td width="120" height="22" align="right"><strong>确认密码 ： </strong></td>
    <td><input name="password2" type="password" style=" width:100pt " size="20" maxlength="12"   >      </td>
  </tr>
</table>
<p align="center">
<input type="submit" name="Submit" value=" 提 交 "> &nbsp; &nbsp; &nbsp;<input name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="location.href='main.asp';" style="cursor:hand;">
</p>
</form>
<p class="fontcolor">
<strong>声明:</strong>请记住新的帐号密码,不要泄露给别人,如泄露所造成的损失,合优网络不付任何责任</p>
<iframe name="theblank" width="0" height="0" frameborder="0" scrolling="no"></iframe>
</body>
</html>
