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
	site_bot=rs("site_bot")
end if
rs.close
set rs=nothing

%>
  <tr>
    <td height="22" colspan="2"  align="center" class="title">英文版</td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right">网站标题：</td>
    <td><textarea name="site_title" cols="72" rows="5"  ><%=site_title%></textarea>
      </td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" >关 键 字：</td>
    <td ><textarea name="site_key" cols="72" rows="5"   ><%=site_key%></textarea></td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站描述：</td>
    <td><textarea name="site_des" cols="72" rows="5"   ><%=site_des%></textarea></td>
  </tr>
   <!-- <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站底部：</td>
    <td><!-- '#INCLUDE file="../fckeditor.asp" 
    <%
    'Dim oFCKeditor
'    Set oFCKeditor = New FCKeditor
'    oFCKeditor.Config("LinkBrowser") = "true" 
'    oFCKeditor.Config("ImageBrowser") = "true" 
'    oFCKeditor.Config("FlashBrowser") = "true" 
'    oFCKeditor.Config("LinkUpload") = "true" 
'    oFCKeditor.Config("ImageUpload") = "true" 
'    oFCKeditor.Config("FlashUpload") = "true" 
'    oFCKeditor.Value = site_bot
'    oFCKeditor.Create "site_bot"
    %>	</td>
  </tr>-->
</table><br />

<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">

<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from setup where id=2 "
rs.open sql,conn,1,1
if not rs.eof then
	site_title=rs("site_title")
	site_key=rs("site_key")
	site_des=rs("site_des")
	site_bot=rs("site_bot")
end if
rs.close
set rs=nothing

%>
  <tr>
    <td height="22" colspan="2"  align="center" class="title">日文版</td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right">网站标题：</td>
    <td><textarea name="site_title_en" cols="72" rows="5"  ><%=site_title%></textarea>
      </td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" >关 键 字：</td>
    <td ><textarea name="site_key_en" cols="72" rows="5"   ><%=site_key%></textarea></td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站描述：</td>
    <td><textarea name="site_des_en" cols="72" rows="5"   ><%=site_des%></textarea></td>
  </tr>
  <!--  <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站底部：</td>
    <td>
    <% 
   ' oFCKeditor.Value = site_bot
'    oFCKeditor.Create "site_bot_en"
    %>	</td>
  </tr>-->
</table><br/>

<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">

<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from setup where id=3 "
rs.open sql,conn,1,1
if not rs.eof then
	site_title_es=rs("site_title")
	site_key_es=rs("site_key")
	site_des_es=rs("site_des")
	site_bot_es=rs("site_bot")
end if
rs.close
set rs=nothing

'关闭数据库
closeconn
%>
  <tr>
    <td height="22" colspan="2"  align="center" class="title">西文版</td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right">网站标题：</td>
    <td><textarea name="site_title_es" cols="72" rows="5"  ><%=site_title_es%></textarea>
      </td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" >关 键 字：</td>
    <td ><textarea name="site_key_es" cols="72" rows="5"   ><%=site_key_es%></textarea></td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站描述：</td>
    <td><textarea name="site_des_es" cols="72" rows="5"   ><%=site_des_es%></textarea></td>
  </tr>
   <!-- <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站底部：</td>
    <td>
    <% 
   ' oFCKeditor.Value = site_bot_es
'    oFCKeditor.Create "site_bot_es"
    %>	</td>
  </tr>-->
</table>
<p align="left">
  <input type="submit"  style="margin-left:130px;cursor:hand; "  name="Submit" value=" 修 改 "  >
&nbsp;</p>  
</form>
</body>
</html>
