<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'验证传递参数
id=request("id")
w_url=request.ServerVariables("HTTP_REFERER")
if id="" or not checknum(id) then 
	call msg("参数错误","")
end if


'打开数据库
openconn

'提取数据
set rs=server.CreateObject("adodb.recordset")
sql="select * from person where id="&id&""
rs.open sql,conn,1,1
if rs.eof then 
	call msg("该会员不存在或已删除","")
else
	username=rs("username")
	password=rs("password")
	rename=rs("rename")
	email=rs("email")
	phone=rs("phone")
	fax=rs("fax")
	post=rs("post")
	address=rs("address")
	xingbie=rs("xingbie")
	nj=rs("nj")
	zy=rs("zy")
	xx=rs("xx")
	z_body=rehtml(rs("z_body"))
	ky=rehtml(rs("ky"))
	xz=rehtml(rs("xz"))
end if
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会员管理</title>
<link href="../css/admin_style.css"  type="text/css" rel="stylesheet">
<script src="../scripts/function.js"></script>
<script>
function check(){
	var username=document.getElementById("username");
	var password=document.getElementById("password");
	if (!(/^\w{4,20}$/.test(username.value))){
		alert("请输入正确是帐号(4-20位字母+数字_-)")
		username.focus();
		return false;
	}
	if (!(/^\w{4,20}$/.test(password.value))){
		alert("请输入正确是密码(4-20位字母+数字_-)")
		password.focus();
		return false;
	}
}

</script>
</head>

<body >
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center" class="topbg">
    <td  colspan="2" >会员管理----修改会员</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td ><a href="default.asp">管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加会员</a></td>
  </tr>
</table>
<br>
<form action="editt.asp" name="form1" method="post" onSubmit="return check()">
<input type="hidden" name="id"  id="id" value="<%=id%>">
<input  type="hidden" name="w_url" value="<%=w_url%>">
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center" class="title">
    <td colspan="2" >修改会员</td>
    </tr>
    
  <tr>
    <td width="120" align="right" class="tdbg"><strong>用户名：</strong></td>
    <td class="tdbg"><input name="username" type="text" id="username" maxlength="50" value="<%=username%>">
      <span class="fontcolor">*</span></td>
  </tr>
  <tr>
    <td  align="right" class="tdbg"><strong>密码：</strong></td>
    <td class="tdbg"><input name="password" type="text" id="password" maxlength="50"  value="<%=password%>">
      <span class="fontcolor">*</span></td>
  </tr>
  <tr>
    <td  align="right" class="tdbg"><strong>邮箱：</strong></td>
    <td class="tdbg"><input name="email" type="text" id="email" maxlength="50" value="<%=email%>"></td>
  </tr>
  <tr>
    <td  align="right" class="tdbg"><strong>姓名：</strong></td>
    <td class="tdbg"><input name="rename" type="text" id="rename" maxlength="50" value="<%=rename%>"></td>
  </tr>
  <tr>
    <td  align="right" class="tdbg"><strong>性别：</strong></td>
    <td class="tdbg"><input name="xingbie" type="text" id="xingbie" maxlength="50" value="<%=xingbie%>"></td>
  </tr>
  <tr>
    <td  align="right" class="tdbg"><strong>电话：</strong></td>
    <td class="tdbg"><input name="phone" type="text" id="phone" maxlength="50" value="<%=phone%>"></td>
  </tr>
  <tr>
    <td  align="right" class="tdbg"><strong>年级：</strong></td>
    <td class="tdbg"><input name="nj" type="text" id="nj" maxlength="50" value="<%=nj%>"></td>
  </tr>
  <tr>
    <td  align="right" class="tdbg"><strong>专业：</strong></td>
    <td class="tdbg"><input name="zy" type="text" id="zy" maxlength="50" value="<%=zy%>"></td>
  </tr>
  <tr>
    <td  align="right" class="tdbg"><strong>在读学校：</strong></td>
    <td class="tdbg"><input name="xx" type="text" id="xx" maxlength="50" value="<%=xx%>"></td>
  </tr>
    <tr>
    <td  align="right" class="tdbg"><strong>传真：</strong></td>
    <td class="tdbg"><input name="fax" type="text" id="fax" maxlength="50" value="<%=fax%>"></td>
  </tr>
  <tr>
    <td  align="right" class="tdbg"><strong>邮编：</strong></td>
    <td class="tdbg"><input name="post" type="text" id="post" maxlength="50"  value="<%=post%>"></td>
  </tr>
    <tr>
    <td  align="right" class="tdbg"><strong>地址：</strong></td>
    <td class="tdbg"><input name="address" type="text" id="address" size="50" maxlength="100" value="<%=address%>"></td>
  </tr>
    <tr>
    <td  align="right" class="tdbg"><strong>口语次数：</strong></td>
    <td class="tdbg"><input name="ky" type="text" id="ky"  maxlength="100" value="<%=ky%>">次</td>
  </tr>
    <tr>
    <td  align="right" class="tdbg"><strong>写作次数：</strong></td>
    <td class="tdbg"><input name="xz" type="text" id="xz" maxlength="100" value="<%=xz%>">次</td>
  </tr>

    
    <tr>
    <td  align="right" class="tdbg"><strong>备注：</strong></td>
    <td class="tdbg"><textarea name="z_body" cols="50" rows="6" id="z_body"><%=z_body%></textarea></td>
  </tr>
</table><p align="center">   
		<INPUT type="submit" id="b1" name="b1"   value=" 修 改 " > &nbsp;       <input name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="location='<%=w_url%>'" style="cursor:hand;">  </p>
</form>
</body>
</html>
