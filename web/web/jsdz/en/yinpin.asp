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
		alert("Please fill in Your Job")
		job_title.focus()
		return false
	}
	if (username.value==""){
		alert("Please fill in your name")
		username.focus()
		return false
	}
	if (phone.value==""){
		alert("Please fill in the Tel")
		phone.focus()
		return false
	}
	if (safecode.value==""){
		alert("Please fill in the verification code")
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
               	  <b style="font-size:14px; color:#FFFFFF">Recruitment</b></td>
                </tr>
                <tr><td height="10px" colspan="2"></td></tr>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="job.asp?id=1">Social Recruitment</a></td>
              	</tr>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="job.asp?id=2">Campus Recruitment</a></td>
              	</tr>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="yinpin.asp">Online Registration</a></td>
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
                  <td height="30px" style="background-image:url(images/news1_03.jpg)">Current Location：<a href="index.asp">Home</a> > <a href="job.asp">Recruitment</a> > Candidate <%=request("job_title")%> Position</td>
                </tr>
          </table>
          <br />
         <table width="100%" border="0" cellpadding="2" cellspacing="1"  style="font-size:12px; ">
<form action="job_yp_add.asp" method="post" name="form1"  onSubmit=" return check()">
  <tr>
    <td width="30%" height="22" align="right">Position：</td>
    <td width="297">
    <select name="job_title">
    	<option value="--Select positions--">--Select positions--</option>
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
    <td height="22" align="right">Name：</td>
    <td><input name="username" type="text" id="username"  class="inpt" ></td>
  </tr>
  <tr>
    <td height="22" align="right">Phone：</td>
    <td><input name="phone" type="text" id="phone" class="inpt" ></td>
  </tr>
  <tr>
    <td height="22" align="right">Email：</td>
    <td><input name="email" type="text" id="email"  class="inpt" ></td>
  </tr>
  <tr>
    <td height="22" align="right">Remark：</td>
    <td><textarea name="z_body" cols="45" rows="5" id="z_body"  class="inpt" ></textarea></td>
  </tr>
  <tr>
    <td height="30" align="right">Upload Resume：</td>
    <td><input type="hidden" name="up_sl"><iframe id="frame1" name="frame1" style="margin-top:2px; "height=20 src="admin/job/up.asp?frameid=frame1&kuang=up_sl" width="45%" frameborder=0  scrolling=no></iframe></td>
  </tr>
    <tr>
    <td height="22" align="right">Verification Code：</td>
    <td><input name="safecode" type="text" id="safecode" size="5" class="inpt" style="float:left; margin-right:5px;" /><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" id="deo" name="deo"></td>
  </tr>
    <tr>
    <td height="30" align="right"></td>
    <td><input name="Submit" type="submit" class="but" value=" Submit "></td>
  </tr>
  </form>
</table>
    </td>
    </tr>
</table>
<!--#include file="bottom.asp"--> 
</body>
</html>
