<!--
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单系统</title>-->
<script language="javascript">
function check(){
	var title=document.form1.title;
	var order_num=document.form1.order_num;
	var rename=document.form1.rename;
	var email=document.form1.email;
	var phone=document.form1.phone;
	var safecode=document.form1.safecode;
	if (title.value==""){
		alert("产品名称不能为空")
		title.focus()
		return false
	}
	if (order_num.value==""){
		alert("订购数量不能为空")
		order_num.focus()
		return false
	}
	if (rename.value==""){
		alert("联系人不能为空")
		rename.focus()
		return false
	}
	if (email.value==""){
		alert("电子邮箱不能为空")
		email.focus()
		return false
	}
	if (phone.value==""){
		alert("电话号码不能为空")
		phone.focus()
		return false
	}
	if (safecode.value==""){
		alert("验证码不能为空")
		safecode.focus()
		return false
	}
}
</script>
</head>

<body>



<table width="100%" border="0" cellpadding="3" cellspacing="1" style="font-size:12px; ">
<form action="html.order_add.asp" method="post" name="form1"  onSubmit="return check()">
  <tr >
    <td width="30%" height="22" align="right">产品名称：</td>
    <td width="297">
    <input name="title" class="input_m"  size="30" maxlength="50" value="<%'=title%>">
    <font color="#FF0000">*</font>    </td>
  </tr>
  <tr >
    <td height="22" align="right">订购数量：</td>
    <td><input name="order_num" type="text" class="input_m" id="order_num" size="30" maxlength="50" >
      <font color="#FF0000">*</font></td>
  </tr>
  <tr >
    <td height="22" align="right">联系人：</td>
    <td><input name="rename" type="text" class="input_m" id="rename" size="30" maxlength="50" >
      <font color="#FF0000">*</font></td>
  </tr>  
  <tr>
    <td height="22" align="right">邮箱：</td>
    <td><input name="email" type="text" class="input_m" id="email" size="30" maxlength="50" >
      <font color="#FF0000">*</font></td>
  </tr>
  <tr>
    <td height="22" align="right">电话：</td>
    <td><input name="phone" type="text" class="input_m" id="phone" size="30" maxlength="50" >
      <font color="#FF0000">*</font></td>
  </tr>
  <tr>
    <td height="22" align="right">传真：</td>
    <td><input name="fax" type="text" class="input_m" id="fax" size="30" maxlength="50" ></td>
  </tr>
  <tr>
    <td height="22" align="right">邮编：</td>
    <td><input name="post" type="text" class="input_m" id="post" size="30" maxlength="50" ></td>
  </tr>
  <tr>
    <td height="22" align="right">地址：</td>
    <td><input name="address" type="text" class="input_m" id="address" size="30" maxlength="50" ></td>
  </tr>

  <tr>
    <td height="22" align="right">备注：</td>
    <td><textarea name="z_body" cols="45" rows="5" id="z_body" class="input_m" ></textarea></td>
  </tr>
<tr>
	  <td height="22" align="right">验证码：</td>
	  <td><input name="safecode" type="text" id="safecode" size="5" class="input_m" style="float:left; margin-right:5px;"/><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
	</tr>
    <tr>
    <td height="30" align="right"></td>
    <td><input name="Submit" type="submit" class="but" value=" 提 交 ">      </td>
  </tr>
  </form>
</table>
<!--</body>
</html>-->
