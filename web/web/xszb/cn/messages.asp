<!--#include file="top.asp"-->

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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table width="980" height="154" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0px auto;">
  <tr>
    <td style="padding-top:2px; padding-bottom:1px; background:url(images/n_banner2.jpg) center center no-repeat;"></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" style="background:#9f6300;">&nbsp;</td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="170" align="center" valign="top"><!--#include file="contact_left.asp"--></td>
    <td width="810" valign="top"><table width="810" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="30" style="padding-left:20px; color:#d19231;"><div class="nei_bigclass" >在线留言</div></td>
      </tr>
      <tr>
        <td height="20" style="padding-left:20px;">&nbsp;</td>
      </tr>
    </table>
      <table width="810" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="ny_main_rt_f fl" valign="top"><div class="about_zbody">
         <table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="message_add.asp" onsubmit="return check()">
      <tr>
	  <td height="30" align="right"> 标　　题：</td>
	  <td height="30"><input name="title" type="text" id="title" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
    <tr>
	  <td height="30" align="right"> 姓　　名：</td>
	  <td height="30"><input name="rename" type="text" id="rename" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
	<tr>
	  <td height="30" align="right">电子邮箱： </td>
	  <td height="30">
      <input name="email" type="text" id="email" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  /> <font color="#ff0000">*</font>
      </td>	
    </tr>
	<tr>
	  <td height="30" align="right">公司名称：</td>
	  <td height="30">
	  <input name="compname" type="text" id="compname" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  />
      </td>	
    </tr>
	<tr>
	  <td height="30" align="right"> 电　　话： </td>
	  <td height="30">
      <input name="phone" type="text" id="phone" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  /></td>
    </tr>
	<tr>
	  <td height="30" align="right">地　　址：</td>
	  <td height="30"><input name="address" type="text" class="lyb_bor lyb_inp" id="address" size="50" maxlength="50" /></td>
    </tr>
	<tr>
	  <td align="right">留言内容：</td>
	  <td><textarea name="z_body" cols="50" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea></td>
	</tr>
	 <tr>
	  <td height="30" align="right">验 证 码：</td>
	  <td style="padding-top:10px;"><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style="float:left; margin-right:5px;"/><img src="../admin/getcode.asp?t=Math.random()" onClick="this.src='../admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
	</tr>
	<tr>
	  <td height="40" align="right"></td>
	  <td  style="padding-top:10px;"><input name="submit" type="submit" id="submit2" value=" 发 表 " class="lyb_bor lyb_btn"  style=" line-height:18px;"/>
		  　<input type="reset" name="Submit" value=" 重 置 " class="lyb_bor lyb_btn" style=" line-height:18px;" /></td>
	</tr>
	</form>
</table>
         </div>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->