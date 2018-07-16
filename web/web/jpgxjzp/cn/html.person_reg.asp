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
	call msg("注册成功，请登录","location=""index.asp""")
	response.End()
end if
%>
<link href="css/person.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript src="js/personscripts/checkform.js"></SCRIPT>
<style>
body{ font-size:12px;}
.input_m {BORDER: #b0b0b0 1px solid; FONT-SIZE: 12px;  COLOR: #333;  HEIGHT: 16px}
.font_8{ color:#FF0000;}
.bian {BORDER: #c9c9c9 1px solid;}
.input_s {BORDER: #e4e4e4 1px double;  HEIGHT: 16px; BACKGROUND-COLOR: #e4e4e4}
</style>
</head>

<body>
<TABLE cellSpacing=0 cellPadding=2 width=560 border=0 align="center">
        <FORM id=frm name=frm onSubmit="return checkForm('frm')" action=person_reg.asp?act=post method=post>
        <TBODY>
        <TR>
          <TD align=right width=100 height=25>用户名</TD>
          <TD width=5 height=28>&nbsp;</TD>
          <TD width=460><INPUT  name=username class=input_m style="WIDTH: 180px" size=25 maxlength="20" canEmpty="N" checkType="string,4,20" checkStr="用户名">  <SPAN class=font_8>*</SPAN>&nbsp;用户名必须是英文字母,数字，长度4-20位之间</TD></TR>
        <TR>
          <TD align=right height=25>密码</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=password type=password class=input_m style="WIDTH: 180px" size=25 maxlength="20" canEmpty="N" checkType="string,4,20" checkStr="密码">  <SPAN class=font_8>*</SPAN>&nbsp;密码必须是英文字母,数字，长度4-20位之间</TD>
        </TR>
        <TR>
          <TD height="25" align=right>确认密码</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=confirmpassword type=password class=input_m style="WIDTH: 180px" size=25 maxlength="20" canEmpty="N" checkType="string,," checkStr="确认密码" equal="password"> <SPAN class=font_8>*</SPAN></TD></TR>
        <TR>
          <TD align=right height=25>姓名</TD>
          <TD height=28 align=right>&nbsp;</TD>
          <TD align=left><INPUT  name=rename class=input_m style="WIDTH: 180px" size=25 maxlength="50" canEmpty="N" checkType="string,," checkStr="姓名">  <span class="font_8">*</span> </TD>
        </TR>
        <TR>
          <TD align=right height=25>邮箱</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=email class=input_m style="WIDTH: 180px" size=25 maxlength="50" canEmpty="N" checkType="email" checkStr="邮箱">
           <SPAN class=font_8>*</SPAN></TD></TR>
        <TR>
          <TD align=right height=25>联系电话</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=phone class=input_m style="WIDTH: 180px" size=25 maxlength="50" canEmpty="N" checkType="string,," checkStr="联系电话">
           <SPAN class=font_8>*</SPAN></TD></TR>
        <TR>
          <TD align=right height=25>传真</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=fax class=input_m style="WIDTH: 180px" size=25 maxlength="50"></TD></TR>
        <TR>
          <TD align=right height=25>邮编</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=post class=input_m style="WIDTH: 180px" size=25 maxlength="50"></TD></TR>
        <TR>
          <TD align=right height=25>地址</TD>
          <TD height=28>&nbsp;</TD>
          <TD><INPUT name=address class=input_m size=42 maxlength="100" style="width:300px;"></TD></TR>
		<tr>
	  <td height="25" align="right">验证码</td>
      <TD height=28>&nbsp;</TD>
	  <td><input name="safecode" type="text" class="input_m" id="safecode" size="5" maxlength="4" checkStr="验证码" checkType="string,," canEmpty="N" style="float:left; margin-right:5px;"/><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" id="deo" name="deo" ></td>
	</tr>
        <TR>
          <TD height=5></TD>
          <TD></TD>
          <TD valign="bottom"></TD>
        </TR>
        <TR>
          <TD height=25>&nbsp;</TD>
          <TD height=28>&nbsp;</TD>
          <TD valign="bottom">
          <table><tr><td style="height:23px; overflow:hidden;">
          <INPUT type="image" src="js/personimages/reg.jpg"  name="Submit" style=" float:left;" height="23">
          </td><td style="height:23px; overflow:hidden;"><IMG onclick=history.back()  src="js/personimages/cancle.jpg" border=0 style="cursor:pointer; float:left;" height="23">
           </td></tr></table>
           </TD>
        </TR></TBODY></FORM></TABLE>

