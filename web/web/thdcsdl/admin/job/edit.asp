<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'检查sql注入
checksql

id=request("id")
if id="" or not isnumeric(id) then 
	call msg("参数错误","")
end if

'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from job where id="&id&""
rs.open sql,conn,1,1
if rs.eof then  
	call msg("该信息不存在或已删除","")
end if
title=rs("title")
z_body=rehtml(rs("z_body"))
wtime=rs("wtime")
etime=rs("etime")
px=rs("px")
rs.close
set rs=nothing

'关闭数据库
closeconn
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>招聘管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function check()
{
var title=document.form1.title;
var z_body=document.form1.z_body;
var wtime=document.form1.wtime;
var etime=document.form1.etime;
var px=document.form1.px;
if(title.value=="") 
{
alert("提示:招聘职位不能为空！");
title.focus();
return false;
}
if (z_body.value=="")
{
alert("提示:职位要求不能为空！");
z_body.focus();
return false;
}
if (wtime.value=="")
{
alert("提示:发布日期不能为空！");
wtime.focus();
return false;
}
if (etime.value=="")
{
alert("提示:结束日期不能为空！");
etime.focus();
return false;
}
if (px.value=="")
{
alert("提示:排序不能为空(只能为数字)！");
px.focus();
return false;
}
}

</script>
<script language="javascript" src="../function.js"></script>
</head>
<body >

<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td  colspan="2"  align="center">企业招聘管理----修改招聘</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td><a href="default.asp">招聘管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加招聘</a>&nbsp;| <a href="default_yp.asp">查看应聘</a></td>
  </tr>
</table>
<br />

<form method="POST" name="form1" action="editt.asp" onSubmit="return check()" >
<input type="hidden" name="id" value="<%=id%>">
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
    <tr class="title">
        <td  colspan="2" align="center">修改招聘</td>
    </tr>
    <tr class="tdbg">
        <td width="120" align="right"><strong>招聘职位：</strong></td>          
        <td ><input name="title" type="text" id="title" size="40" maxlength="50" value="<%=title%>">
          <font class="fontcolor"> *</font></td>
    </tr>        
    <tr class="tdbg" >          
        <td width="120" align="right" valign="top" ><strong>职位要求：</strong></td>
        <td ><textarea name="z_body" cols="70" rows="10" id="z_body"><%=z_body%></textarea>
          <font class="fontcolor"> *</font></td>
    </tr>          
    <tr class="tdbg">
        <td width="120" align="right"><strong>发布日期：</strong></td>
        <td ><input name="wtime" type="text" id="wtime" value="<%=wtime%>" maxlength="50"> 
          <font class="fontcolor">*</font>&nbsp;&nbsp; 结束日期：
          <input name="etime" type="text" id="etime" value="<%=etime%>" maxlength="50">
          <font class="fontcolor"> *</font>&nbsp;</td>          
    </tr>
    <tr class="tdbg">
        <td width="120" align="right"><strong>显示顺序：</strong></td>
        <td ><input name="px" type="text" id="px" value="<%=px%>" size="8" maxlength="10" ><font class="fontcolor">*&nbsp;(从大到小排序)</font></td>          
    </tr>
</table>
<p align="center">   
      <INPUT type=submit  value=" 修 改 "  name="submit1"> &nbsp;&nbsp;&nbsp;    
	  <input name="Cancel" type="button" value=" 取 消 " onClick="window.location.href='default.asp';" style="cursor:hand;">
</form>
</p>
</body>
</html>