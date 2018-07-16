<!--#include file="../inc_n.asp"-->
<%
conn.close
set conn=nothing
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加管理员</title>
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script>
function check()
{
username=document.form1.username;
password1=document.form1.password1;
password2=document.form1.password2;
rename=document.form1.rename;
usertype=document.form1.usertype;

if (username.value==""||username.value.length<6||username.value.length>12)
	{
		alert("提示：帐号填写不正确 (6-12位字母+数字组成)！")
		username.focus()
		return false
	}
	
if (password1.value==""||password1.value.length<6||password1.value.length>12)
	{
		alert("提示：密码填写不正确 (6-12位字母+数字组成)！")
		password1.focus()
		return false
	}
	
	if(password1.value!=password2.value)
	{
		alert("提示：两次输入密码不一致！")
		password2.focus()
		return false
	}

}

</script>

</head>
<body leftmargin="2" rightmargin="1" topmargin="2" bottommargin="0">
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr>
            <td height="23" align="center" colspan="2" class="topbg"><strong style="color:#FFFFFF; ">管理员管理</strong></td>

  </tr>
  <tr>
    <td width="70" height="23" class="tdbg"><strong>管理导航：</strong></td>
    <td class="tdbg"><a href="default.asp">管理员管理首页</a> | <a href="add.asp">添加管理员</a></td>
  </tr>
</table>
<form name="form1" action="addd.asp" method="post" onSubmit="return check()">
<table width="100%"  border="0" cellpadding="0" cellspacing="1" class="border">
  <tr>
    <td height="22" colspan="2"  align="center" class="title"><strong>添加管理员</strong></td>
  </tr>
    <tr>
    <td width="120" height="22" align="right" class="tdbg"><strong>帐　　号：</strong></td>
    <td class="tdbg"><input name="username" type="text" id="username" maxlength="50">
    <font color="#FF0000">(6-12位字母+数字组成)</font></td>
  </tr>
   <tr>
    <td width="120" height="22" align="right" class="tdbg"><strong>密　　码：</strong></td>
    <td class="tdbg"><input name="password1" type="text" id="password1" maxlength="50" >
    <font color="#FF0000">(6-12位字母+数字组成)</font></td>
  </tr>
   <tr>
    <td width="120" height="22" align="right" class="tdbg"><strong>确认密码：</strong></td>
    <td class="tdbg"><input name="password2" type="text" id="password2" maxlength="50" ></td>
  </tr>
   <tr>
    <td width="120" height="22" align="right" class="tdbg"><strong>使 用 人：</strong></td>
    <td class="tdbg"><input name="rename" type="text" id="rename" maxlength="50"></td>
  </tr>
</table>
<p align="center">
  <input type="submit" name="Submit" value=" 添 加 " style='cursor:hand;' >
  &nbsp;　　<input type="button" name="Submit" value=" 返 回 " style='cursor:hand;' onClick="location='default.asp'">
</p></form>
</body>
</html>
