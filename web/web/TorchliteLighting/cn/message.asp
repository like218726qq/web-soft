<!--#include file="conn.asp"-->
<%a=7%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>钜丰源灯饰有限公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function check(){
	title=document.getElementById("title");
	rename=document.getElementById("rename");
	email=document.getElementById("email");
	safecode=document.getElementById("safecode");
	if (title.value==""){
		alert("标题不能为空")
		title.focus()
		return false
	}
	if (rename.value==""){
		alert("姓名不能为空")
		rename.focus()
		return false
	}
	if (email.value==""){
		alert("电子邮箱不能为空")
		email.focus()
		return false
	}
	if (safecode.value==""){
		alert("验证码不能为空")
		safecode.focus()
		return false
	}
}
</script>
<style>
body{ font-size:12px;}
.lyb_bor{border:1px solid #ccc;font-size:12px;}
.lyb_inp{ height:15px;}
</style>
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
        <td width="105" class="zhans">客户留言</td>
        <td width="627" align="right" class="weiz" style="padding-right:20px;">当前位置：<a href="index.asp">首页</a> &gt;&gt; 客户留言</td>
      </tr>
    </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="padding:20px; line-height:180%;">
             <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="message_add.asp" onsubmit="return check()">
    <tr>
	  <td height="25" align="right">标　　题： </td>
	  <td height="25">
      <input name="title" type="text" id="title" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font></td>
    </tr>
    <tr>
	  <td height="25" align="right"> 姓　　名：</td>
	  <td height="25"><input name="rename" type="text" id="rename" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
	<tr>
	  <td height="25" align="right">电子邮箱： </td>
	  <td height="25">
      <input name="email" type="text" id="email" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  />
      </td>	
    </tr>
	<tr>
	  <td height="25" align="right">公司名称：</td>
	  <td height="25">
	  <input name="compname" type="text" id="compname" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  />
      </td>	
    </tr>
	<tr>
	  <td height="25" align="right"> 电　　话： </td>
	  <td height="25">
      <input name="phone" type="text" id="phone" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  /></td>
    </tr>
	<tr>
	  <td height="25" align="right">地　　址：</td>
	  <td height="25"><input name="address" type="text" class="lyb_bor lyb_inp" id="address" size="50" maxlength="50" /></td>
    </tr>
	<tr>
	  <td align="right">留言内容：</td>
	  <td><textarea name="z_body" cols="50" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea></td>
	</tr>
	 <tr>
	  <td height="30" align="right">验 证 码：</td>
	  <td><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style="float:left; margin-right:5px;"/><img src="../admin/getcode.asp?t=Math.random()" onClick="this.src='../admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
	</tr>
	<tr>
	  <td height="40" align="right"></td>
	  <td><input name="submit" type="submit" id="submit2" value=" 发 表 " class="lyb_bor lyb_btn" />
		  　<input type="reset" name="Submit" value=" 重 置 " class="lyb_bor lyb_btn" /></td>
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
