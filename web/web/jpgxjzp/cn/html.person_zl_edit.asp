<!--#include file="conn.asp"-->
<!--#include file="person_checklogin.asp"-->
<%
act=trim(request("act"))
if act="post" then
	rename=html(trim(request.Form("rename")))
	email=html(trim(request.Form("email")))
	phone=html(trim(request.Form("phone")))
	fax=html(trim(request.Form("fax")))
	post=html(trim(request.Form("post")))
	address=html(trim(request.Form("address")))
	
	if rename="" or email="" or phone=""  then
		call msg("带*号的必须填写","")
	end if
	
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from person where username='"&session("person")&"' and pass='yes'"
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该用户已被屏蔽或已删除","location='person_loginout.asp'")
	else
		rs("rename")=rename
		rs("email")=email
		rs("phone")=phone
		rs("fax")=fax
		rs("post")=post
		rs("address")=address
		rs.update()
	end if
	rs.close
	set rs=nothing
	call msg("修改成功","location=""person_zl_edit.asp""")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资料修改</title>
<link href="css/person.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
</head>

<body>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from person where username='"&session("person")&"' and pass='yes'"
rs.open sql,conn,1,1
if not rs.eof then
%>

<table width="60%" border="0" align="center" cellpadding="2" cellspacing="0"  style="margin-top:15px; margin-bottom:15px;">
<FORM id=zlfrm name=zlfrm onSubmit="return checkForm('zlfrm')" action=person_zl_edit.asp?act=post method=post>
    <tr>
    <td class="reg_ti">
    姓名 <span class="font_8">*</span>    </td>
   </tr>
    <tr>
    <td class="reg_ti">
    <input name=rename class=input_m id="rename"  value="<%=rs("rename")%>" style="WIDTH: 180px"  size=25 maxlength="50" canEmpty="N" checkType="string,," checkStr="姓名">    </td>
   </tr>
   <tr>
    <td class="reg_ti">
    邮箱 <span class="font_8">*</span>   </td>
    </tr>
  <tr>
  <td><input name=email class=input_m  size=25 maxlength="50"  value="<%=rs("email")%>" style="WIDTH: 180px"  canEmpty="N" checkType="string,," checkStr="邮箱"></td>
  </tr>
 <tr>
    <td class="reg_ti">
    电话  <span class="font_8">*</span></td>
    </tr>
    <tr>
    <td>
    <input name=phone class=input_m  size=25 maxlength="50"  value="<%=rs("phone")%>" style="WIDTH: 180px"  canEmpty="N" checkType="string,," checkStr="电话"></td>
    </tr>
 <tr>
    <td class="reg_ti">
    传真</td>
    </tr>
    <tr>
    <td>
    <input name=fax class=input_m  size=25 maxlength="50"  value="<%=rs("fax")%>" style="WIDTH: 180px" ></td>
    </tr>
 <tr>
    <td class="reg_ti">
    邮编 </td>
    </tr>
    <tr>
    <td>
    <input name=post class=input_m id="post"  value="<%=rs("post")%>" style="WIDTH: 180px"  size=25 maxlength="50"></td>
    </tr>
    <tr>
    <td class="reg_ti">
    地址</td>
    </tr>
    <tr>
    <td class="reg_ti">
    <input name="address" class=input_m id="address"  value="<%=rs("address")%>"  size=50 maxlength="150">    </td>
    </tr>
  <tr>
    <td><input name="subm" type="image" src="images/edit.jpg"  ></td>
  </tr></FORM>
</table>
<%
end if
rs.close
set rs=nothing
%>

</body>
</html>
