<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网站基本配置</title>
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
	 <tr class="topbg">
		 <td   align="center">网站基本配置</td>
	 </tr>
</table>
<br />
<form action="editt.asp" method="post" name="form1" >
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">

<%
'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from setup where id=1 "
rs.open sql,conn,1,1
if not rs.eof then
	site_title=rs("site_title")
	site_key=rs("site_key")
	site_des=rs("site_des")
	site_bot=rehtml(rs("site_bot"))
	email=rs("email")
end if
rs.close
set rs=nothing

'关闭数据库
closeconn
%>
<input type="hidden" name="id"  value="1">
  <tr>
    <td height="22" colspan="2"  align="center" class="title">&nbsp;</td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right">网站标题：</td>
    <td><textarea name="site_title" cols="80" rows="5"  ><%=site_title%></textarea>
      </td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" >关 键 字：</td>
    <td ><textarea name="site_key" cols="80" rows="5"   ><%=site_key%></textarea></td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站描述：</td>
    <td><textarea name="site_des" cols="80" rows="5"   ><%=site_des%></textarea></td>
  </tr>
    <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站底部：</td>
    <td><textarea name="site_bot" cols="80" rows="5"   ><%=site_bot%></textarea></td>
  </tr>
    <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">收件箱：</td>
    <td><input name="email" type="text" value="<%=email%>" size="80" maxlength="200" /></td>
  </tr>
</table>
<p align="left">
  <input type="submit"  style="margin-left:130px;cursor:hand; "  name="Submit" value=" 修 改 "  >
&nbsp;</p>  
</form>
</body>
</html>
