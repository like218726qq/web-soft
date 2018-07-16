<!--#include file="inc.asp"-->
<%
'检查登录已否
checklogin_default
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>合优网络后台管理</title>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<script src="scripts/function.js"></script>
</head>
<style>
body {
	font-family:"宋体";
	font-size:12px;
	background:#EFF9FB;
	margin:0px;
	padding:0px;
}
form{
	margin:0;
	padding:0;
}
form table tr td{ padding:6px 0px; margin:0;}
input{
	font-family:"宋体";
	font-size:12px;
	padding:1px 2px;
	border:#66b2e6 1px solid;
	height:25px;
	line-height:25px;
}

.layout {
	width:1003px;
	height:586px;
	margin:0 auto;/*居中*/
	background:url(http://www.heyou51.com/images/dl.jpg) no-repeat left top;
}
#log_in {
	width:275px;
	padding:250px 0 0 530px;
}
</style>
<body onload=document.form1.username.focus()  style="background: #2184bb;">
<div style="width:100%; margin:0 auto; text-align:center;">
<div id="content" class="layout" style="text-align:left;" >
  <div id="log_in">
    <form action="admin_login.asp" method="post" name="form1" target="theblank">
      <table width="250" border="0" align="center" cellspacing="0">
        <tr>
          <td align="right">用户名：</td>
          <td width="164"><input name="username" type="text" class="username" size="25" maxlength="50"></td>
        </tr>
        <tr>
          <td align="right">密　码：</td>
          <td><input name="password" type="password" class="password" size="25" maxlength="50"></td>
        </tr>
        <tr>
          <td align="right">验证码：</td>
          <td><input name="safecode" type="text" class="safecode" size="8" style="float:left; margin-top:2px; margin-right:3px;">
          <img src="getcode.asp" onClick="this.src='getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;"> </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input name="submit" type="image" src="images/sub_btn.gif" style="width:57px; height:23px; border:none; margin:0px; padding:0px;"/>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
</div>

<IFRAME id=theblank name=theblank style="WIDTH: 0px; HEIGHT: 0px" ></IFRAME>

</body>
</html>