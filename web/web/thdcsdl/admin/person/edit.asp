<!--#include file="../inc_n.asp"-->
<html>
<head><title>修改会员</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<script>
function check()
{
if (document.form1.username.value=="")
{
alert("提示:帐号必须填写!")
document.form1.username.focus();
return false;
}

if (document.form1.password.value=="")
{
alert("提示:密码必须填写!")
document.form1.password.focus();
return false;
}

if (document.form1.wtime.value=="")
 {
	alert("提示:请填写注册时间!")
	document.form1.wtime.focus();
	return false;
}

 if (document.form1.login_num.value=="")
{
alert("提示:请填写登陆次数!")
document.form1.login_num.focus();
return false;
}


if (document.form1.etime.value=="")
 {
	alert("提示:请填写最近登陆时间!")
	document.form1.etime.focus();
	return false;
 }

}



</script>
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #000000;
	font-weight: bold;
}
-->
</style>
</head>
<body leftmargin='2' topmargin='1' marginwidth='0' marginheight='0'>
<%
id=request("id")
if id=""  or  not isnumeric(id) then call  msg("参数错误","")
set rs=server.CreateObject("adodb.recordset")
sql="select * from person where id="&id&""
rs.open sql,conn,1,1
if rs.eof then call msg("该信息不存在或已删除","")
%>
<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>  <tr class='topbg'>    <td height='22' colspan='2'  align='center'><strong>会员中心管理----</strong>修改资料</td>  
</tr>  <tr class='tdbg'>    <td width='70' height='30' ><strong>管理导航：</strong></td>
<td><a href='default.asp'>会员管理首页</a>&nbsp;|&nbsp;<a href='add.asp'>添加会员</a>&nbsp;</td>
</tr>
</table>
<form method='POST' name='form1' action="editt.asp" onSubmit="return check()" >  
<input name="id" value="<%=id%>" type="hidden">
<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0' class='border'>   
 <tr class='title'>
 <td height='22' align='center'><b>添加资料</b></td>    
</tr>
<tr align='center'>
<td>
	<table width='100%' border='0' cellpadding='2' cellspacing='1'>
	<tr class='tdbg'><td width='120' align='right'><strong><font color="#FF0000">登录设置：</font></strong></td>          
  <td><table width="500" height="20"  border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="38">帐号：          </td>
      <td width="144"><input name="username" type="text" id="username2" style=" background-color:#CCCCCC" size=" " maxlength="20" value="<%=rs("username")%>"></td>
      <td width="45" align="right">密码： </td>
      <td><input name="password" type="text" id="passwd2" style=" background-color:#CCCCCC" maxlength="20" value="<%=rs("password")%>"></td>
    </tr>
  </table>
    </td>
</tr>   
	<tr class='tdbg'>
	<td width='120' align='right'><span class="style1">基本资料：</span></td>
	<td><table width="500"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="38" height="22" >姓名：</td>
        <td width="144"><input name="rename" type="text" id="name3" maxlength="20" value="<%=rs("rename")%>"></td>
        <td width="45" align="right">姓别：</td>
        <td width="43"><select name="sex" id="sex">
            <option value="男" <%if rs("sex")="男" then response.write" selected"%>>男</option>
            <option value="女"  <%if rs("sex")="女" then response.write" selected"%>>女</option>
        </select></td>
        <td width="40">年龄：</td>
        <td><input name="age" type="text" id="age4" size="6" maxlength="20" value="<%=rs("age")%>"></td>
      </tr>
    </table>
	</td> 
	    </tr>  
		<tr class='tdbg'>
	<td width='120' align='right'><span class="style1">联系方式：</span></td>
	<td><table width="500" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="38">电话：</td>
        <td width="144"><input name="phone" type="text" id="phone" maxlength="50"  value="<%=rs("phone")%>"></td>
        <td width="45" align="right">email：</td>
        <td><input name="email" type="text" id="email" maxlength="50"  value="<%=rs("email")%>"></td>
      </tr>
      <tr>
        <td colspan="4"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38">地址：</td>
            <td><input name="addr" type="text" id="addr" size="45" maxlength="100" value="<%=rs("addr")%>" ></td>
          </tr>
        </table></td>
        </tr>
    </table>
	</td>
		</tr> 
        <tr class='tdbg'>             <td width='120' align='right'><strong>登陆情况：</strong></td>            
          <td><table width="500"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="60">注册时间：</td>
              <td width="144"><input name="wtime" type="text" id="wtime" value="<%=rs("wtime")%>" maxlength="50">                </td>
              <td width="65">登陆次数：</td>
              <td width="231">                <input name="login_num" type="text" id="login_num2"  style="ime-mode:disabled" onKeyPress="return event.keyCode>=48&&event.keyCode<=57"  onkeyup="if(/(^0+)/.test(value))value=value.replace(/^0*/, '')" value="<%=rs("login_num")%>" size="10" maxlength="50"  onpaste="var s=clipboardData.getData('text'); if(!/\D/.test(s)) value=s.replace(/^0*/,''); return false;" ondragenter="return false"></td>
              </tr>
            <tr>
              <td>最近登陆：</td>
              <td><input name="etime" type="text" id="etime2" maxlength="50" value="<%=rs("etime")%>"></td>
              <td>注册IP：</td>
              <td><input name="ip" type="text" id="ip2" maxlength="50" value="<%=rs("ip")%>"></td>
            </tr>
          </table></td>          
        </tr>      </table></td>    </tr>  </table>
		<%
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		%>  <p align='center'>   
      <INPUT type=submit id=b1 name=b1  value=" 修 改 " > &nbsp;    <input name='Cancel' type='button' id='Cancel' value=' 取 消 ' onClick="window.location.href='default.asp';" style='cursor:hand;'>  </p><br></form></body></html>
