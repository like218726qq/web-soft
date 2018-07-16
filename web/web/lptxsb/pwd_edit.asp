<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<!--#include file="person_checklogin.asp"-->
<%
act=trim(request("act"))
if act="post" then
	y_password=html(lcase(trim(request.Form("y_password"))))
	password=html(lcase(trim(request.Form("password"))))
	confirmpassword=html(lcase(trim(request.Form("confirmpassword"))))
	
	if y_password="" or password="" or confirmpassword="" then
		call msg("带*号的必须填写","")
	end if
	
	if len(y_password)<4 or len(y_password)>20 or feifa(y_password) or len(password)<4 or len(password)>20 or feifa(password) or confirmpassword<>password then
		call msg("错误的密码格式","")
	end if
	
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from person where username='"&session("person")&"' and pass='yes'"
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该用户不存在或已删除","location='person_loginout.asp'")
	else
		if rs("password")<>y_password then
			call msg("旧密码错误","")
		else
			rs("password")=password
			rs.update()
			call msg("修改成功","location=""pwd_edit.asp""")
		end if
	end if
	rs.close
	set rs=nothing
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
<li><a href="pwd_edit.asp" class="">修改密码</a></li>
<li><a href="zl_edit.asp">修改信息</a></li>
<li><a href="loginout.asp">退出</a></li>
            </ul><img src="images/ny-zuo_17.jpg" /></td>
              </tr>
            </table></td>
    <td width="786" class="line">
    <div class="show">
        <table width="80%" border="0" align="center" cellpadding="2" cellspacing="0"  style="margin-top:15px; margin-bottom:15px;">
 <form  id=forn name=forn onSubmit="return checkForm('forn')" action=pwd_edit.asp?act=post method=post style="margin:0px; padding:0px;" >
    <tr>
    <td width="33%" height="30" align="right" valign="middle" class="reg_ti">旧密码：</td>
    <td width="67%" class="reg_ti"><input  name="y_password" type="password" class="input_m"  size="25" maxlength="20" style="WIDTH: 180px" canEmpty="N" checkType="password,4,20" checkStr="旧密码"  checkMsg="请输入 4-20 数字、字母"/></td>
    </tr>
   <tr>
    <td height="30" align="right" valign="middle" class="reg_ti">新密码：</td>
    <td class="reg_ti"><input  name="password" type="password" class="input_m"  size="25" maxlength="20" style="WIDTH: 180px" canEmpty="N" checkType="password,4,20" checkStr="新密码"  checkMsg="请输入 4-20 数字、字母"/></td>
   </tr>
 <tr>
    <td height="30" align="right" valign="middle" class="reg_ti">确认密码：</td>
    <td class="reg_ti"><input  name="confirmpassword" type="password" class="input_m"  size="25" maxlength="20" style="WIDTH: 180px" canEmpty="N" checkType="password,4,20" checkStr="确认密码" equal="password" /></td>
 </tr>
  <tr>
    <td colspan="2" align="center"><input name="subm" type="image" src="images/edit.jpg"  ></td>
  </tr></FORM>
</table>
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
