<!--#include file="conn.asp"-->
<%
	id=request("id")
	if id<>"" and checknum(id) then
		sql="select * from tol_co where id="&id&""
	else
		sql="select top 1 * from tol_co where lm=2 order by px desc,id desc"
	end if
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if not rs.eof then
		id=rs("id")
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
<title>港置地产代理(深圳)有限公司桂芳园分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
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
<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#fffefa">
  <tr>
    <td width="11">&nbsp;</td>
    <td width="214" valign="top">
		<!--#include file="left_lx.asp"-->
		<!--#include file="left_contact.asp"-->
    </td>
    <td width="27">&nbsp;</td>
    <td width="737" valign="top"><table width="737" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:28px;">
      <tr>
         <td style="background:url(images/pro_06.jpg); width:715px; height:23px; color:#a18307; font-size:14px; font-weight:bold; padding:6px 0 0 22px;" valign="middle"> 留言板</td>
      </tr>
      <tr>
        <td style="line-height:26px; padding:10px 5px; color:464646; font-weight:500;">
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
                  <td><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style="float:left; margin-right:5px;"/><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
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
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="botton.asp"-->
</body>
</html>
