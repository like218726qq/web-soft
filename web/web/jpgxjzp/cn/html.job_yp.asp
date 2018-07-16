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
</head>

<body>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#f0f0f0" style="font-size:12px; ">
<form action="html.job_yp_add.asp" method="post" name="form1"  onSubmit=" return check()">
  <tr align="center">
    <td height="22" colspan="2"><strong style="color:#FF0000; font-size:14px; ">我要应聘</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="30%" height="22" align="right">应聘职位：</td>
    <td width="297">
    <input name="job_title" value="<%=request("job_title")%>" class="inpt">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="22" align="right">姓　　名：</td>
    <td><input name="username" type="text" id="username"  class="inpt" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="22" align="right">联系电话：</td>
    <td><input name="phone" type="text" id="phone" class="inpt" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="22" align="right">电子邮箱：</td>
    <td><input name="email" type="text" id="email"  class="inpt" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="22" align="right">备　　注：</td>
    <td><textarea name="z_body" cols="45" rows="5" id="z_body"  class="inpt" ></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="right">上传简历：</td>
    <td><input type="hidden" name="up_sl"><iframe id="frame1" name="frame1" style="margin-top:2px; "height=20 src="../admin/job/up.asp?frameid=frame1&kuang=up_sl" width="100%" frameborder=0  scrolling=no></iframe></td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="22" align="right">验 证 码：</td>
    <td><input name="safecode" type="text" id="safecode" size="5" class="inpt" style="float:left; margin-right:5px;" /><img src="../admin/getcode.asp?t=Math.random()" onClick="this.src='../admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" id="deo" name="deo"></td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="30" align="right"></td>
    <td><input name="Submit" type="submit" class="but2" value=" 提 交 " style="width:100px; height:30px; cursor:pointer;">      </td>
  </tr>
  </form>
</table>
