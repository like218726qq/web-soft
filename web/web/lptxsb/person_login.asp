<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<%
act=trim(request("act"))
if act="post" then
	username=html(lcase(trim(request.Form("username"))))
	password=html(lcase(trim(request.Form("password"))))
	safecode=lcase(trim(request.form("safecode")))
	back_url=request.Form("back_url")
	
	if safecode<>session("safecode") or safecode="" or session("safecode")="" then 
		call msg("验证码错误","")
	end if
	
	if len(username)<4 or len(username)>20 or feifa(username) then
		call msg("用户名格式不正确","")
	end if
	
	if len(password)<4 or len(password)>20 or feifa(password)  then
		call msg("密码格式不正确","")
	end if
		
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from person where username='"&username&"'"
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该用户名不存在","")
	else
		if rs("password")<>password then
			call msg("用户名或密码错误","")
		else
			if rs("pass")<>"yes" then
				call msg("该用户已被停用","")
			else
				session("person")=username
				session("rename")=rs("rename")
				rs("login_num")=rs("login_num")+1
				rs("ltime")=rs("etime")
				rs("lip")=rs("eip")
				rs("etime")=now()
				rs("eip")=getip()
				rs.update()
			end if
		end if
	end if
	rs.close
	set rs=nothing
	if back_url<>"" then
		w_url=back_url
	else
		w_url="person.asp"
	end if
	call msg("","location='"&w_url&"'")
end if
%>

<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/quicknav.css" />
<script type="text/javascript" src="c/common.js?v=2012081522"></script>
<style type="text/css">
<!--
.STYLE1 {
	color: #a49a9a;
	font-size: 14px;
}
.STYLE8 {
	color: #27B5A6;
	font-weight: bold;
	font-size:16px;
}
-->
</style>
<link href="css/person.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><Td align="center">
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1002" height="578"><table width="1002" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46" align="center" valign="bottom" style=" background:url(images/neiye-k_11.jpg) left no-repeat "><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="216" height="40" align="center" valign="bottom"><table width="192" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="40" align="center" valign="middle" class="STYLE8" style="background:url(images/ny-zuo_12.jpg)">会员中心</td>
              </tr>
            </table></td>
            <td width="786"><table width="780" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="34" height="35" align="right" valign="middle"><img src="images/ti.jpg" width="26" height="35" /></td>
            <td width="726" align="left" valign="middle" style="padding-right:30px;"><span style=" float:right">您所在的位置：首页 > 会员中心 > 会员登录</span>
              <span class="STYLE8">会员中心</span></td>
          </tr>
            <tr><td colspan="2" align="left"><img src="images/neiye-zx_33.jpg" width="780" height="1" /></td>
            </tr>
        </table></td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td height="511" align="left" valign="top"  style=" background:url(images/neiye_36.jpg) left repeat-y; ">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="216" align="center" valign="top"><table width="192" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center" valign="middle">	<ul class="pro_left">
                <li><a href="person.asp">基本信息</a></li>
<li><a href="pwd_edit.asp">修改密码</a></li>
<li><a href="zl_edit.asp">修改信息</a></li>
<li><a href="loginout.asp">退出</a></li>
            </ul><img src="images/ny-zuo_17.jpg" /></td>
              </tr>
            </table></td>
    <td width="786">
    <div class="show">
<TABLE class=bian cellSpacing=0 cellPadding=0 align=center border=0>
        <TR>
          <TD width=133 height="180" bgcolor="#E4E4E4"><IMG height=155 src="images/suo.jpg" width=133></TD>
          <TD width=320>
            <TABLE cellSpacing=3 cellPadding=0 width="95%" align=center border=0>
              <FORM id="frmlogin" name="frmlogin" onSubmit="return checkForm('frmlogin')"  action="person_login.asp?act=post" method="post">
              <TR>
                <TD class=font_bot width=66 height=35>用户名 </TD>
                <TD width=202 height=35><INPUT name="username" class="input_s" style="WIDTH: 180px" size="25" maxlength="20" checkStr="用户名" checkType="string,4,20" canEmpty="N"></TD>
                <TD width=69>&nbsp;</TD>
              </TR>
              <TR>
                <TD class=font_bot height=35>密码</TD>
                <TD height=35><INPUT name="password"  type="password" class="input_s" style="WIDTH: 180px" size="25" maxlength="20" checkStr="密码" checkType="string,4,20" canEmpty="N"></TD>
                <TD>&nbsp;</TD>
              </TR>
              <TR>
                <TD class=font_bot height=35> 验证码</TD>
                <TD height=35><input name="safecode" type="text" class="input_s" id="safecode" style="float:left; margin-right:5px;" size="5" maxlength="4" checkStr="验证码" checkType="string,," canEmpty="N"/><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" id="deo" name="deo"></TD>
                <TD>&nbsp;</TD>
              </TR>
              <TR>
                <TD height=35>&nbsp;</TD>
                <TD  height=35><INPUT id=back_url type=hidden name=back_url value="<%=request("back_url")%>"> 
                <INPUT type=image src="images/login.jpg" value=提交 name=Submit>&nbsp;&nbsp;<IMG src="images/reg.jpg" border=0 style="cursor:pointer;" onclick="location='person_reg.asp'"></TD>
      <TD align=right>&nbsp;</TD></TR></FORM></TABLE>
      </TD>
      </TR>
      </TABLE>

</div>
    
    
    </td>
  </tr>
</table>

         
         
         </td>
      </tr>
      <tr>
        <td height="21"><img src="images/neiye_55.jpg" width="1002" height="21" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"><img src="images/lp_17.jpg" width="1002" height="1" /></td>
  </tr>
</table><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</Td></tr></table>
</body>
</html>
