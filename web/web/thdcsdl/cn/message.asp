<!--#include file="conn.asp"-->
              <%		
				
				  set rs=server.CreateObject("adodb.recordset")
				  rs.open "select * from tol_co where ID=3",conn,1,1
				  if not rs.eof then
				  title=rs("title")					 
				  z_body=rs("z_body")
				  end if
				  rs.close
				  set rs=nothing
				  %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>深圳市泰恒达财税代理有限公司</title>
<style type="text/css">
<!--
body {
	background: url(images/bg_.jpg) repeat-x bottom;
	background-color:#F4F4F4;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/syle.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	
	<tr><td align="center" valign="top">
	<!--#include file="top1.asp"-->
	  </td></tr>
	  
	  
	  <!--main-->
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
		  <!--left-->
            <td width="207" valign="top">
              <!--#include file="c_left.asp"-->
			</td>
			
            <td width="10">&nbsp;</td>
			
			<!--right-->
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              
			   <tr><td height="30" style="background:url(images/pro_03.jpg) no-repeat; font-size:12px; padding-left:35px;" valign="middle" colspan="2">
		<div style="padding-top:5px;" class="Products">	  首页 >> 客户留言</div>
			  </td></tr>
			  
			  <!--main-->
			   <tr>
                <td height="380" colspan="2" bgcolor="#FFFFFF" valign="top" style="padding-left:10px; padding-top:10px; line-height:24px; font-size:12px;">	
				<script language="javascript">
	function check()
	{
	title=document.getElementById("title");
	person=document.getElementById("person");
	email=document.getElementById("email");
	safecode=document.getElementById("safecode");
	if (title.value=="")
		{
			alert("提示：标题不能为空！")
			title.focus()
			return false
		}
	if (person.value=="")
		{
			alert("提示：姓名不能为空！")
			person.focus()
			return false
		}
	if (email.value=="")
		{
			alert("提示：电子邮箱不能为空！")
			email.focus()
			return false
		}

	if (safecode.value=="")
		{
			alert("提示：验证码不能为空！")
			safecode.focus()
			return false
		}
	}
</script>
				<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="message_add.asp" onsubmit="return check()">
    <tr>
	  <td height="25" align="right">标　　题： </td>
	  <td height="25">
      <input name="title" type="text" id="title" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      　　姓　　名： 
	  <input name="person" type="text" id="person" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
	<tr>
	  <td height="25" align="right">电子邮箱： </td>
	  <td height="25">
      <input name="email" type="text" id="email" maxlength="50"class="lyb_bor lyb_inp"  />
      <font color="#ff0000">*</font>
      　　公司名称： 
	  <input name="compname" type="text" id="compname" maxlength="50"class="lyb_bor lyb_inp"  />
      </td>	
    </tr>

	<tr>
	  <td height="25" align="right"> 电　　话： </td>
	  <td height="25">
      <input name="phone" type="text" id="phone" maxlength="50" class="lyb_bor lyb_inp"  />&nbsp;&nbsp;　　 地　　址： 
          <input name="addr" type="text" id="addr" maxlength="50" class="lyb_bor lyb_inp" /></td>
    </tr>
	<tr>
	  <td align="right">留言内容：</td>
	  <td><textarea name="z_body" cols="50" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea></td>
	</tr>
	 <tr>
	  <td height="30" align="right">验 证 码：</td>
	  <td><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01"/> 　<img src="../admin/getcode.asp" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer;" id="deo" name="deo" alt="看不清，换一张"></td>
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
			  
              <tr>
                <td height="30" colspan="2"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
	  
        <td height="80" class="boby">
		<!--#include file="bottom.asp"-->
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
