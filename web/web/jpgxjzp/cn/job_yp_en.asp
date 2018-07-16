<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>职位应聘</TITLE>
<style>
body{ margin:0px; padding:0px;font-size:12px; font-family:Arial, Helvetica, sans-serif;}
.inpt {
	font-family: "Verdana", "??ì?", "Arial", "Helvetica", "sans-serif";
	font-size: 9pt;
	border: 1px groove #CCCCCC;
	background-color: #eeeeee;
}
.but{FONT-SIZE: 9pt;
	border:#aacbe1 1px solid;
	HEIGHT:20px; }
</style>

<script>
function check(){
	job_title=document.form1.job_title;
	username=document.form1.username;
	phone=document.form1.phone;
	safecode=document.form1.safecode;
	if (job_title.value==""){
		alert("Please fill in Position")
		job_title.focus()
		return false
	}
	if (username.value==""){
		alert("Please fill in your name")
		username.focus()
		return false
	}
	if (phone.value==""){
		alert("Please fill out the Tel")
		phone.focus()
		return false
	}
	if (safecode.value==""){
		alert("Please fill out the Code")
		safecode.focus()
		return false
	}
}
</script>
</head>

<body>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#f0f0f0" style="font-size:12px; ">
<form action="job_yp_add.asp" method="post" name="form1"  onSubmit=" return check()">
  <tr align="center">
    <td height="22" colspan="2"><strong style="color:#FF0000; font-size:14px; ">I want to apply</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="30%" height="22" align="right">Position：</td>
    <td width="297">
    <input name="job_title" value="<%=request("job_title")%>" class="inpt"> <font color="#FF0000">*</font>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="22" align="right">Name：</td>
    <td><input name="username" type="text" id="username"  class="inpt" > <font color="#FF0000">*</font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="22" align="right">Tel：</td>
    <td><input name="phone" type="text" id="phone" class="inpt" > <font color="#FF0000">*</font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="22" align="right">E-mail：</td>
    <td><input name="email" type="text" id="email"  class="inpt" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="22" align="right">Remarks：</td>
    <td><textarea name="z_body" cols="45" rows="5" id="z_body"  class="inpt" ></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="right">Upload Resume：</td>
    <td><input type="hidden" name="up_sl"><iframe id="frame1" name="frame1" style="margin-top:2px; "height=20 src="admin/job/up.asp?frameid=frame1&kuang=up_sl" width="100%" frameborder=0  scrolling=no></iframe></td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="22" align="right">Code：</td>
    <td><input name="safecode" type="text" id="safecode" size="5" class="inpt" style="float:left; margin-right:5px;" /><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" id="deo" name="deo"></td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="30" align="right"></td>
    <td><input name="Submit" type="submit" class="but" value=" Send ">      </td>
  </tr>
  </form>
</table>
</body>
</html>
