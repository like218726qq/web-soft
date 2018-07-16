<!--#include file="conn.asp"-->
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
			call msg("修改成功","location=""person_pwd_edit.asp""")
		end if
	end if
	rs.close
	set rs=nothing
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>密码修改</title>
<link href="css/person.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
</head>

<body>

     <table width="60%" border="0" align="center" cellpadding="2" cellspacing="0"  >
      <form  id=forn name=forn onSubmit="return checkForm('forn')" action=person_pwd_edit.asp?act=post method=post style="margin:0px; padding:0px;" >
       <tr>
         <td class="reg_ti">旧密码</td>
                </tr>
       <tr>
         <td><input  name="y_password" type="password" class="input_m"  size="25" maxlength="20" style="WIDTH: 180px" canEmpty="N" checkType="password,4,20" checkStr="旧密码"  checkMsg="请输入 4-20 数字、字母"/></td>
       </tr>
       <tr>
         <td class="reg_ti">新密码</td>       
       </tr>
       <tr>
         <td><input  name="password" type="password" class="input_m"  size="25" maxlength="20" style="WIDTH: 180px" canEmpty="N" checkType="password,4,20" checkStr="新密码"  checkMsg="请输入 4-20 数字、字母"/></td>
       </tr>

       <tr>
         <td class="reg_ti">确认密码</td>       
       </tr>
       <tr>
         <td><input  name="confirmpassword" type="password" class="input_m"  size="25" maxlength="20" style="WIDTH: 180px" canEmpty="N" checkType="password,4,20" checkStr="确认密码" equal="password" /></td>
       </tr>
  <tr>
    <td><input name="subm" type="image" src="images/edit.jpg"  ></td>
  </tr>
  </form> 
</table>
    

</body>
</html>
