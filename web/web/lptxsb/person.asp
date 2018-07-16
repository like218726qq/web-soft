<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<!--#include file="person_checklogin.asp"-->


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
         <%
set rs=server.CreateObject("adodb.recordset")
sql="select * from person where username='"&session("person")&"' and pass='yes'"
rs.open sql,conn,1,1
if not rs.eof then
%>  <table width="80%" border="0" align="center" cellpadding="2" cellspacing="0"  style="margin-top:15px; margin-bottom:15px;">
    <tr>
    <td width="14%" height="30" align="right" valign="middle" class="reg_ti">
    姓名：</td>
    <td width="86%" class="reg_ti"><%=rs("rename")%></td>
    </tr>
   <tr>
    <td height="30" align="right" valign="middle" class="reg_ti">
    邮箱：</td>
    <td class="reg_ti"><%=rs("email")%></td>
   </tr>
 <tr>
    <td height="30" align="right" valign="middle" class="reg_ti">
    电话：</td>
    <td class="reg_ti"><%=rs("phone")%></td>
 </tr>
 <tr>
    <td height="30" align="right" valign="middle" class="reg_ti">
    传真：</td>
    <td class="reg_ti"><%=rs("fax")%></td>
 </tr>
 <tr>
    <td height="30" align="right" valign="middle" class="reg_ti">
    邮编：</td>
    <td class="reg_ti"><%=rs("post")%></td>
 </tr>
    <tr>
    <td height="30" align="right" valign="middle" class="reg_ti">
    地址：</td>
    <td class="reg_ti"><%=rs("address")%></td>
    </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
<%
end if
rs.close
set rs=nothing
%>

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
