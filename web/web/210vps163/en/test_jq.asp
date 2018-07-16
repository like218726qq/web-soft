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
		w_url="categry_view.asp"
	end if
	call msg("","location='"&w_url&"'")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link href="css/person.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
<style type="text/css">
body,div{ margin:0px; padding:0px;}
.pop_box{ width:350px; height: 200px; margin-left:auto; margin-right:auto;}
.pop_box2{ width:322px; height:200px; border:1px solid #cccccc; margin-left:3px; margin-top:3px; margin-bottom:3px;text-align:center; font-size:13px; font-weight:bold; padding:15px 10px;}
</style>
</head>

<body>
<div class="pop_box">
  <div class="pop_box2">Member Login<br /> 
   <br />
 <TABLE cellSpacing=3 cellPadding=0 width="95%" align=left border=0>
              <FORM id="frmlogin" name="frmlogin" onSubmit="return checkForm('frmlogin')"  action="test_jq.asp?act=post" method="post">
              <TR>
                <TD class=font_bot width=77 height=35>user name </TD>
                <TD width=200 height=35 colspan="2"><INPUT name="username" class="input_s" style="WIDTH: 180px" size="25" maxlength="20" checkStr="用户名" checkType="string,4,20" canEmpty="N"></TD>
                <TD width=40>&nbsp;</TD>
              </TR>
              <TR>
                <TD class=font_bot height=35>password</TD>
                <TD height=35 colspan="2"><input name="password"  type="password" class="input_s" style="WIDTH: 180px" size="25" maxlength="20" checkstr="密码" checktype="string,4,20" canempty="N" /></TD>
                <TD>&nbsp;</TD>
              </TR>
              <TR>
                <TD class=font_bot height=35> verification</TD>
                <TD height=35 align="left">
                <input name="safecode" type="text" class="input_s" style=" width:40px;" id="safecode" size="5" maxlength="4" checkStr="验证码" checkType="string,," canEmpty="N"/>
                
                </TD><td><img src="../admin/getcode.asp?t=Math.random()" onclick="this.src='../admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" id="deo" name="deo" /></td>
                <TD>&nbsp;</TD>
              </TR>
              <TR>
                <TD height=35>&nbsp;</TD>
                <TD  height=35 colspan="2">
                <table border="0" cellpadding="0" cellspacing="0">
                <tr><td style="width:69px; height:23px"> <INPUT id=back_url type=hidden name=back_url value="<%=request("back_url")%>"><INPUT type=image src="images/login .jpg" value=提交 name=Submit></td><td style=" width:10px;"></td>
                <td style="width:69px; height:23px"><INPUT type="reset" style=" background:url(images/reset.jpg); width:69px; height:23px; border:none;" value=""></td></tr>
                </table>
                </TD>
      <TD align=right>&nbsp;</TD></TR></FORM></TABLE>
</div>

</div>
</body>
</html>
