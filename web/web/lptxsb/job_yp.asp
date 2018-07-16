<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->

<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/quicknav.css" />
<script type="text/javascript" src="c/common.js?v=2012081522"></script>
<style type="text/css">
<!--
.STYLE1 {
	color: #a49a9a;
	font-size: 14px;
}
.STYLE8 {
	color: #27B5A6;
	font-weight: bold;
	font-size:16px;
}
-->
</style>
<style>
.inpt {
	font-family: "Verdana", "??ì?", "Arial", "Helvetica", "sans-serif";
	font-size: 9pt;
	border: 1px groove #CCCCCC;
}
.but{FONT-SIZE: 9pt;border:#aacbe1 1px solid;HEIGHT:20px; }
</style>

<script>
function check(){
	job_title=document.form1.job_title;
	username=document.form1.username;
	phone=document.form1.phone;
	safecode=document.form1.safecode;
	if (job_title.value==""){
		alert("请填写应聘职位")
		job_title.focus()
		return false
	}
	if (username.value==""){
		alert("请填写姓名")
		username.focus()
		return false
	}
	if (phone.value==""){
		alert("请填写联系电话")
		phone.focus()
		return false
	}
	if (safecode.value==""){
		alert("请填写验证码")
		safecode.focus()
		return false
	}
}
</script>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><Td align="center">
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1002" height="878"><table width="1002" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46" align="center" valign="bottom" style=" background:url(images/neiye-k_11.jpg) left no-repeat "><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="216" height="40" align="center" valign="bottom"><table width="192" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="40" align="center" valign="middle" class="STYLE8" style="background:url(images/ny-zuo_12.jpg)">人才招聘</td>
              </tr>
            </table></td>
            <td width="786"><table width="780" border="0" cellspacing="0" cellpadding="0" class="line">
          <tr>
            <td width="34" height="35" align="right" valign="middle"><img src="images/ti.jpg" width="26" height="35" /></td>
            <td width="726" align="left" valign="middle" style="padding-right:30px;"><span style=" float:right">您所在的位置：首页 > 人才招聘 > 招聘信息</span>
              <span class="STYLE8">人才招聘</span></td>
          </tr>
            <tr><td colspan="2" align="left"><img src="images/neiye-zx_33.jpg" width="780" height="1" /></td>
            </tr>
        </table></td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td height="811" align="left" valign="top"  style=" background:url(images/neiye_36.jpg) left repeat-y; ">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="216" align="center" valign="top"><table width="192" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center" valign="middle">	<ul class="pro_left">
            <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title from tol_co where lm=5 order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="jobs.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
          <%
    rs.movenext
	wend
	rs.close
	set rs=nothing
%><li><a href="job.asp" class="bgdw">招聘信息</a></li>
            </ul><img src="images/ny-zuo_17.jpg" /></td>
              </tr>
            </table></td>
    <td width="786" class="line">
    <div class="show">
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#f0f0f0" style="font-size:12px; ">
<form action="job_yp_add.asp" method="post" name="form1"  onSubmit=" return check()">
  <tr align="center">
    <td height="50" colspan="2"><strong style="color:#FF0000; font-size:14px; ">我要应聘</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="30%" height="40" align="right">应聘职位：</td>
    <td width="297">
    <input name="job_title" value="<%=request("job_title")%>" class="inpt">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="40" align="right">姓　　名：</td>
    <td><input name="username" type="text" id="username"  class="inpt" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="40" align="right">联系电话：</td>
    <td><input name="phone" type="text" id="phone" class="inpt" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="40" align="right">电子邮箱：</td>
    <td><input name="email" type="text" id="email"  class="inpt" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="22" align="right">备　　注：</td>
    <td><textarea name="z_body" cols="45" rows="10" id="z_body"  class="inpt" ></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="40" align="right">上传简历：</td>
    <td><input type="hidden" name="up_sl"><iframe id="frame1" name="frame1" style="margin-top:2px; "height=20 src="admin/job/up.asp?frameid=frame1&kuang=up_sl" width="100%" frameborder=0  scrolling=no></iframe></td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="40" align="right">验 证 码：</td>
    <td><input name="safecode" type="text" id="safecode" size="5" class="inpt" style="float:left; margin-right:5px;" /><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" id="deo" name="deo"></td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="50" align="right"></td>
    <td><input name="Submit" type="submit" class="but" value=" 提 交 ">      </td>
  </tr>
  </form>
</table>
       
   <div class="page" style="text-align:right;"><a href="javascript:history.back();">[返回]</a></div>   </div>
    
    
    </td>
  </tr>
</table>

         
         
         </td>
      </tr>
      <tr>
        <td height="21"><img src="images/neiye_55.jpg" width="1002" height="21" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"><img src="images/lp_17.jpg" width="1002" height="1" /></td>
  </tr>
</table><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</Td></tr></table>
</body>
</html>
