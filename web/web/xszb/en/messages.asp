<!--#include file="top.asp"-->

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
		rename.focus()
		return false
	}
	if (email.value==""){
		alert("E-mail can not be empty")
		email.focus()
		return false
	}
	if (safecode.value==""){
		alert("Verification code can not be empty")
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
        <td height="30" style="padding-left:20px; color:#d19231;"><div class="nei_bigclass" >Feedback</div></td>
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
	  <td height="30" align="right"> Title：</td>
	  <td height="30"><input name="title" type="text" id="title" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
    <tr>
	  <td height="30" align="right"> Name：</td>
	  <td height="30"><input name="rename" type="text" id="rename" style="width:160px;" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
	<tr>
	  <td height="30" align="right">E-mail： </td>
	  <td height="30">
      <input name="email" type="text" id="email" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  /> <font color="#ff0000">*</font>
      </td>	
    </tr>
	<tr>
	  <td height="30" align="right">Company：</td>
	  <td height="30">
	  <input name="compname" type="text" id="compname" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  />
      </td>	
    </tr>
	<tr>
	  <td height="30" align="right"> Telephone： </td>
	  <td height="30">
      <input name="phone" type="text" id="phone" maxlength="50"  style="width:160px;" class="lyb_bor lyb_inp"  /></td>
    </tr>
	<tr>
	  <td height="30" align="right">Address：</td>
	  <td height="30"><input name="address" type="text" class="lyb_bor lyb_inp" id="address" size="50" maxlength="50" /></td>
    </tr>
	<tr>
	  <td align="right">Content：</td>
	  <td><textarea name="z_body" cols="50" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea></td>
	</tr>
	 <tr>
	  <td height="30" align="right">Code：</td>
	  <td style="padding-top:10px;"><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style="float:left; margin-right:5px;"/><img src="../admin/getcode.asp?t=Math.random()" onClick="this.src='../admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
	</tr>
	<tr>
	  <td height="40" align="right"></td>
	  <td  style="padding-top:10px;"><input name="submit" type="submit" id="submit2" value=" OK " class="lyb_bor lyb_btn"  style=" line-height:18px;"/>
		  　<input type="reset" name="Submit" value=" Reset " class="lyb_bor lyb_btn" style=" line-height:18px;" /></td>
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