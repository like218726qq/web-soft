<!--#include file="conn.asp"-->
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
		w_url="product.asp"
	end if
	call msg("","location='"&w_url&"'")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员登录</title>
<link href="css/person.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
</head>

<body>
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

</body>
</html>
