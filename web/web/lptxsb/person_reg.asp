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
	confirmpassword=html(lcase(trim(request.Form("confirmpassword"))))
	rename=html(trim(request.Form("rename")))
	email=html(trim(request.Form("email")))
	phone=html(trim(request.Form("phone")))
	fax=html(trim(request.Form("fax")))
	post=html(trim(request.Form("post")))
	address=html(trim(request.Form("address")))
	safecode=lcase(trim(request.form("safecode")))
	
	if safecode<>session("safecode") or safecode="" or session("safecode")="" then 
		call msg("验证码错误","")
	end if
	
	if len(username)<4 or len(username)>20 or feifa(username) then
		call msg("用户名格式不正确","")
	end if
	
	if len(password)<4 or len(password)>20 or feifa(password) or confirmpassword<>password then
		call msg("密码格式不正确","")
	end if
	
	if rename=""  or phone="" or email="" then
		call msg("带*号的必须填写","")
	end if
	
	if not isemail(email) then
		call msg("请输入正确的邮箱","")
	end if
	
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from person where username='"&username&"'"
	rs.open sql,conn,1,3
	if not rs.eof then
		call msg("该用户名已经存在","")
	else
		rs.addnew()
		rs("username")=username
		rs("password")=password
		rs("rename")=rename
		rs("email")=email
		rs("phone")=phone
		rs("fax")=fax
		rs("post")=post
		rs("address")=address
		rs("pass")="yes"
		rs("login_num")=0
		rs("wtime")=now()
		rs("wip")=getip()
		rs.update()
	end if
	rs.close
	set rs=nothing
	call msg("注册成功，请登录","location=""person_login.asp""")
	response.End()
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
            <td width="786"><table width="780" border="0" cellspacing="0" cellpadding="0" class="line">
          <tr>
            <td width="34" height="35" align="right" valign="middle"><img src="images/ti.jpg" width="26" height="35" /></td>
            <td width="726" align="left" valign="middle" style="padding-right:30px;"><span style=" float:right">您所在的位置：首页 > 会员中心 > 会员注册</span>
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
    <td width="786" class="line">
    <div class="show">
<TABLE cellSpacing=0 cellPadding=2 width=540 border=0 align="center">
        <FORM id=frm name=frm onSubmit="return checkForm('frm')" action=person_reg.asp?act=post method=post>
        <TBODY>
        <TR>
          <TD align=right width=100 height=40>用户名</TD>
          <TD width=5 height=28>&nbsp;</TD>
          <TD width=460><INPUT  name=username class=input_m style="WIDTH: 180px" size=25 maxlength="20" canEmpty="N" checkType="string,4,20" checkStr="用户名">  <SPAN class=font_8>*</SPAN>&nbsp;用户名必须是英文字母,数字，长度4-20位之间</TD></TR>
        <TR>
          <TD align=right height=40>密码</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=password type=password class=input_m style="WIDTH: 180px" size=25 maxlength="20" canEmpty="N" checkType="string,4,20" checkStr="密码">  <SPAN class=font_8>*</SPAN>&nbsp;密码必须是英文字母,数字，长度4-20位之间</TD>
        </TR>
        <TR>
          <TD height="40" align=right>确认密码</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=confirmpassword type=password class=input_m style="WIDTH: 180px" size=25 maxlength="20" canEmpty="N" checkType="string,," checkStr="确认密码" equal="password"> <SPAN class=font_8>*</SPAN></TD></TR>
        <TR>
          <TD align=right height=40>姓名</TD>
          <TD height=28 align=right>&nbsp;</TD>
          <TD align=left><INPUT  name=rename class=input_m style="WIDTH: 180px" size=25 maxlength="50" canEmpty="N" checkType="string,," checkStr="姓名">  <span class="font_8">*</span> </TD>
        </TR>
        <TR>
          <TD align=right height=40>邮箱</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=email class=input_m style="WIDTH: 180px" size=25 maxlength="50" canEmpty="N" checkType="email" checkStr="邮箱">
           <SPAN class=font_8>*</SPAN></TD></TR>
        <TR>
          <TD align=right height=40>联系电话</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=phone class=input_m style="WIDTH: 180px" size=25 maxlength="50" canEmpty="N" checkType="string,," checkStr="联系电话">
           <SPAN class=font_8>*</SPAN></TD></TR>
        <TR>
          <TD align=right height=40>传真</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=fax class=input_m style="WIDTH: 180px" size=25 maxlength="50"></TD></TR>
        <TR>
          <TD align=right height=40>邮编</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=post class=input_m style="WIDTH: 180px" size=25 maxlength="50"></TD></TR>
        <TR>
          <TD align=right height=40>地址</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=address class=input_m size=42 maxlength="100" style="width:300px;"></TD></TR>
		<tr>
	  <td height="40" align="right">验证码</td>
      <TD height=28>&nbsp;</TD>
	  <td><input name="safecode" type="text" class="input_m" id="safecode" size="5" maxlength="4" checkStr="验证码" checkType="string,," canEmpty="N" style="float:left; margin-right:5px;"/><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" id="deo" name="deo" ></td>
	</tr>
        <TR>
          <TD height=40></TD>
          <TD></TD>
          <TD valign="bottom"></TD>
        </TR>
        <TR>
          <TD height=40>&nbsp;</TD>
          <TD height=28>&nbsp;</TD>
          <TD valign="bottom"><INPUT type=image src="images/reg.jpg"  name=Submit>
           &nbsp;&nbsp; <IMG onclick=history.back()  src="images/cancle.jpg" border=0 style="cursor:pointer;"></TD>
        </TR></TBODY></FORM></TABLE>

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
