<!--#include file="conn.asp"-->
<%a=7%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Torchlite Lighting Co. LTD</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style>
body{ font-size:12px; font-family:Arial, Helvetica, sans-serif;OVERFLOW: scroll;overflow-x:hidden;}
.lyb_bor{border:1px solid #ccc;font-size:12px;}
.lyb_inp{ height:15px;}
</style>
<script language="javascript">
function check(){
	title=document.getElementById("title");
	rename=document.getElementById("rename");
	email=document.getElementById("email");
	safecode=document.getElementById("safecode");
	if (title.value==""){
		alert("Title can not be empty")
		title.focus()
		return false
	}
	if (rename.value==""){
		alert("Name can not be empty")
		person.focus()
		return false
	}
	if (email.value==""){
		alert("E-mail can not be empty")
		email.focus()
		return false
	}
	if (safecode.value==""){
		alert("Code can not be empty")
		safecode.focus()
		return false
	}
}
</script>
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="213" valign="top">
      <!--#include file="left_pro.asp"-->
	  <!--#include file="left_con.asp"-->  
    </td>
    <td width="15" height="100">&nbsp;</td>
    <td width="774" valign="top" bgcolor="#f8f8f8"><table width="774" border="0" cellpadding="0" cellspacing="0" background="images/products_03.jpg">
      <tr>
        <td width="42" height="33">&nbsp;</td>
        <td width="105" class="zhans">Feedback</td>
        <td width="627" align="right" class="weiz" style="padding-right:20px;">Location：<a href="index.asp">Home</a> &gt;&gt; Feedback</td>
      </tr>
    </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="padding:20px; line-height:180%;">
             <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="message_add.asp" onsubmit="return check()">
    <tr>
	  <td height="25" align="right">Title： </td>
	  <td height="25">
      <input name="title" type="text" id="title" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
    <tr>
	  <td height="25" align="right">Name： </td>
	  <td height="25">
      <input name="rename" type="text" id="rename" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
	<tr>
	  <td height="25" align="right">E-mail： </td>
	  <td height="25">
      <input name="email" type="text" id="email" maxlength="50" style="width:160px;" class="lyb_bor lyb_inp"  />
      <font color="#ff0000"> *</font>
      </td>	
    </tr>
	<tr>
	  <td height="25" align="right">Company Name： </td>
	  <td height="25">
<input name="compname" type="text" id="compname" maxlength="50" style="width:160px;" class="lyb_bor lyb_inp"  />
      </td>	
    </tr>
	<tr>
	  <td height="25" align="right"> Tel： </td>
	  <td height="25">
      <input name="phone" type="text" id="phone" maxlength="50" style="width:160px;" class="lyb_bor lyb_inp"  />
      </td>
    </tr>
	<tr>
	  <td height="25" align="right">Address：  </td>
	  <td height="25">
<input name="address" type="text" class="lyb_bor lyb_inp" id="address" size="50" maxlength="50" /></td>
    </tr>
	<tr>
	  <td align="right">Content：</td>
	  <td><textarea name="z_body" cols="52" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea></td>
	</tr>
	 <tr>
	  <td height="30" align="right">Code：</td>
	  <td><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style="float:left; margin-right:5px;"/><img src="../admin/getcode.asp?t=Math.random()" onClick="this.src='../admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
	</tr>
	<tr>
	  <td height="40" align="right"></td>
	  <td><input name="submit" type="submit" id="submit2" value=" Submit " class="lyb_bor lyb_btn" />
		  　<input type="reset" name="Submit" value=" Reset " class="lyb_bor lyb_btn" /></td>
	</tr>
	</form>
</table>
          </td>
        </tr>
      </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
