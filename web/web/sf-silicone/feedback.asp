<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong(0)%></title>
<meta content="<%=zhong(1)%>" http-equiv="keywords" />
<meta content="<%=zhong(2)%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function check(){
	title=document.getElementById("title");
	rename=document.getElementById("rename");
	compname=document.getElementById("compname");
	phone=document.getElementById("phone");
	z_body=document.getElementById("z_body");
	
	safecode=document.getElementById("safecode");
	if (title.value==""){
		alert("Title can not be empty!")
		title.focus()
		return false
	}
	if (rename.value==""){
		alert("Name can not be empty!")
		rename.focus()
		return false
	}
	if (compname.value==""){
		alert("Company name can not be empty!")
		compname.focus()
		return false
	}
	if (phone.value==""){
		alert("Tel can not be empty!")
		phone.focus()
		return false
	}
	if (z_body.value==""){
		alert("Content can not be empty!")
		z_body.focus()
		return false
	}
	if (safecode.value==""){
		alert("The verification code can not be empty!")
		safecode.focus()
		return false
	}
}
</script>
<style>
.lyb_bor{border:1px solid #ccc;font-size:12px;}
.lyb_inp{ height:15px;}
</style>
</head>

<body>
<!--header-->
<!--#include file="header.asp"-->
<!--#banner-->

<!--middle-->
<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="9" valign="top"><img src="images/product1_10.jpg" width="9" height="47" /></td>
    <td width="248" align="right" valign="top" bgcolor="#FFFFFF"><table width="248" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="47" align="center" class="nei_fenl">Product List</td>
      </tr>
    </table>
      <table width="242" border="0" cellpadding="0" cellspacing="0" background="images/product1_fenl_beij.jpg">
        <tr>
          <td valign="top" style="padding-top:12px;">
          <!--product menu-->
          <!--#include file="left_pro.asp"-->
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="35">&nbsp;</td>
              </tr>
            </table>
           <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/product1_contact_tu.jpg" width="242" height="88" /></td>
              </tr>
            </table>
            </td>
        </tr>
      </table></td>
    <td width="18" height="100" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="733" valign="top" bgcolor="#FFFFFF"><table width="733" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="38" class="zhans"><a href="feedback.asp">Feedback</a></td>
      </tr>
    </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>

          <td><img src="images/product1_shang.jpg" width="733" height="4" /></td>
        </tr>
        <tr>
          <td background="images/product1_zhong.jpg" style="padding:20px 20px 10px 20px; height:415px; line-height:180%; text-align:justify" valign="top">
         <Div style="width:680px;line-height:180%; font-family:Arial; text-align:left">
          <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="message_add.asp" onsubmit="return check()">
    <tr>
	  <td width="29%" height="32" align="right">Title： </td>
	  <td width="71%" height="32">
      <input name="title" type="text" id="title" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font></td>
    </tr>
    <tr>
	  <td height="32" align="right"> Name：</td>
	  <td height="32"><input name="rename" type="text" id="rename" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
	<tr>
	  <td height="32" align="right">Email： </td>
	  <td height="32">
      <input name="email" type="text" id="email" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  />
      </td>	
    </tr>
	<tr>
	  <td height="32" align="right">Company Name：</td>
	  <td height="32">
	  <input name="compname" type="text" id="compname" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  />
      <font color="#ff0000">*</font>      </td>	
    </tr>
	<tr>
	  <td height="32" align="right"> Tel： </td>
	  <td height="32">
      <input name="phone" type="text" id="phone" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  />
      <font color="#ff0000">*</font></td>
    </tr>
	<tr>
	  <td height="32" align="right">Address：</td>
	  <td height="32"><input name="address" type="text" class="lyb_bor lyb_inp" id="address" size="50" maxlength="50" /></td>
    </tr>
	<tr>
	  <td align="right">Content：</td>
	  <td style="padding-top:8px"><textarea name="z_body" cols="50" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea>
        <font color="#ff0000">*</font></td>
	</tr>
	 <tr>
	  <td height="30" align="right">Verification Code：</td>
	  <td><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style="float:left; margin-right:5px;"/><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
	</tr>
	<tr>
	  <td height="32" align="right"></td>
	  <td><input name="submit" type="submit" id="submit2" value=" Submit " class="lyb_bor lyb_btn" />
		  　<input type="reset" name="Reset" value=" Reset " class="lyb_bor lyb_btn" /></td>
	</tr>
	</form>
</table>
           </Div>
          </td>
        </tr>
        <tr>
          <td><img src="images/product1_xia.jpg" width="733" height="5" /></td>
        </tr>
    </table></td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10">&nbsp;</td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--footer-->
<!--#include file="footer.asp"-->
</body>
</html>
