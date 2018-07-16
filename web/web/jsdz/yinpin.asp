<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<%
	id=request("id")
%>
<style>
body{ margin:0px; padding:0px;}
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
<body>
<!--#include file="top.asp"--> 
<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center" style="margin-top:10px">
<tr>
    	<td valign="top" style="background:url(images/news_06.jpg) bottom repeat-x;border:1px solid #CCCCCC; border-top:none">
        	<table border="0" cellpadding="0" cellspacing="0" width="100%">
  				<tr style="background-image:url(images/ind_42.jpg)">
               	  <td width="5%">
               	  <img src="images/ind_39.jpg" />                    </td>
                    <td width="95%">
               	  <b style="font-size:14px; color:#FFFFFF">雅镭招聘</b></td>
                </tr>
                <tr><td height="10px" colspan="2"></td></tr>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="job.asp?id=1">社会招聘</a></td>
              	</tr>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="job.asp?id=2">校园招聘</a></td>
              	</tr>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="yinpin.asp">在线注册</a></td>
              	</tr>
                <tr>
                	<td height="142px"></td>
                    <td height="142px"></td>
                </tr>
          </table>
   	  	</td>
   	  <td width="20px"></td>
      	<td valign="top" width="760px">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:0px">
                <tr>
                  <td height="30px" style="background-image:url(images/news1_03.jpg)">当前位置：<a href="index.asp">首页</a> > <a href="job.asp">雅镭招聘</a> > 应聘<%=request("job_title")%>职位</td>
                </tr>
          </table>
          <br />
         <table width="100%" border="0" cellpadding="2" cellspacing="1"  style="font-size:12px; ">
<form action="job_yp_add.asp" method="post" name="form1"  onSubmit=" return check()">
  <tr>
    <td width="30%" height="22" align="right">应聘职位：</td>
    <td width="297">
    <select name="job_title">
    	<option value="--请选择职位--">--请选择职位--</option>
    	<%
			sql="select *  from job  where pass='yes' order by px desc,id desc"
			set rs=conn.execute(sql)
			do while not rs.eof 
		%>
    	<option value="<%=rs("title")%>" <%if request("job_title") = cstr(rs("title")) then%> selected="selected"<%end if%>><%=rs("title")%></option>
        <%
			rs.movenext
			loop
			rs.close
		%>
    </select>
    </td>
  </tr>
  <tr>
    <td height="22" align="right">姓　　名：</td>
    <td><input name="username" type="text" id="username"  class="inpt" ></td>
  </tr>
  <tr>
    <td height="22" align="right">联系电话：</td>
    <td><input name="phone" type="text" id="phone" class="inpt" ></td>
  </tr>
  <tr>
    <td height="22" align="right">电子邮箱：</td>
    <td><input name="email" type="text" id="email"  class="inpt" ></td>
  </tr>
  <tr>
    <td height="22" align="right">备　　注：</td>
    <td><textarea name="z_body" cols="45" rows="5" id="z_body"  class="inpt" ></textarea></td>
  </tr>
  <tr>
    <td height="30" align="right">上传简历：</td>
    <td><input type="hidden" name="up_sl"><iframe id="frame1" name="frame1" style="margin-top:2px; "height=20 src="admin/job/up.asp?frameid=frame1&kuang=up_sl" width="45%" frameborder=0  scrolling=no></iframe></td>
  </tr>
    <tr>
    <td height="22" align="right">验 证 码：</td>
    <td><input name="safecode" type="text" id="safecode" size="5" class="inpt" style="float:left; margin-right:5px;" /><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" id="deo" name="deo"></td>
  </tr>
    <tr>
    <td height="30" align="right"></td>
    <td><input name="Submit" type="submit" class="but" value=" 提 交 "></td>
  </tr>
  </form>
</table>
    </td>
    </tr>
</table>
<!--#include file="bottom.asp"--> 
</body>
</html>
