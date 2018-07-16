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
<LINK href="../admin.css" rel="stylesheet" type="text/css">
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
	 <tr class="topbg">
		 <td   align="center">网站基本配置</td>
	 </tr>
</table>
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
	site_title_en=rs("site_title_en")
	site_key_en=rs("site_key_en")
	site_des_en=rs("site_des_en")
	site_bot_en=rs("site_bot_en")
	site_count=rs("site_count")
	site_can1=rs("site_can1")
	site_can2=rs("site_can2")
	site_can3=rs("site_can3")
	site_can4=rs("site_can4")
	site_can5=rs("site_can5")
	site_can6=rs("site_can6")
	site_can7=rs("site_can7")
	site_can8=rs("site_can8")
	site_can9=rs("site_can9")
	site_can10=rs("site_can10")
		site_can1_en=rs("site_can1_en")
	site_can2_en=rs("site_can2_en")
	site_can3_en=rs("site_can3_en")
	site_can4_en=rs("site_can4_en")
	site_can5_en=rs("site_can5_en")
	site_can6_en=rs("site_can6_en")
	site_can7_en=rs("site_can7_en")
	site_can8_en=rs("site_can8_en")
	site_can9_en=rs("site_can9_en")
	site_can10_en=rs("site_can10_en")
end if
rs.close
set rs=nothing
'关闭数据库
closeconn
%>
<input type="hidden" name="id"  value="1">
  <tr class="tdbg">
    <td width="120" height="22" align="right">网站标题：</td>
    <td><textarea name="site_title" cols="120" rows="1"  ><%=site_title%></textarea>
      </td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" >关 键 字：</td>
    <td ><textarea name="site_key" cols="120" rows="1"   ><%=site_key%></textarea></td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站描述：</td>
    <td><textarea name="site_des" cols="120" rows="1"   ><%=site_des%></textarea></td>
  </tr>
    <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">网站底部：</td>
    <td>
    <!-- #INCLUDE file="../kd4.asp" -->
    <textarea name="site_bot" style="width:600px;height:200px;visibility:hidden;" class="kindeditor4"><%=tohtml(site_bot)%></textarea>   
    </td>
  </tr>
  </table>
  <table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border" style="display:none;">
   <tr>
    <td height="22" colspan="2"  align="center" class="title">&nbsp;</td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right">site title:</td>
    <td><textarea name="site_title_en" cols="120" rows="1"  ><%=site_title_en%></textarea>
      </td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" >site keyword:</td>
    <td ><textarea name="site_key_en" cols="120" rows="1"   ><%=site_key_en%></textarea></td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">site Describe</td>
    <td><textarea name="site_des_en" cols="120" rows="1"   ><%=site_des_en%></textarea></td>
  </tr>
    <tr class="tdbg">
    <td width="120" height="22" align="right" class="tdbg">site bottom:</td>
    <td>
    <textarea name="site_bot_en" style="width:600px;height:200px;visibility:hidden;" class="kindeditor4"><%=tohtml(site_bot_en)%></textarea>   
    </td>
  </tr>
  </table>
  <br/>
  <table  width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
<tr class="tdbg2" 11style="display:none;">
    <td align="right" width="80" ><b>其他设置：</b></td>
    <td>
        <table width="100%">
        <%
        attrs=Array("服务热线","首页公司简介","首页联系我们")
        attrs_value=Array(site_can1,site_can2,site_can3,site_can4,site_can5,site_can6,site_can7,site_can8,site_can9,site_can10)
        attrs_value_en=Array(site_can1_en,site_can2_en,site_can3_en,site_can4_en,site_can5_en,site_can6_en,site_can7_en,site_can8_en,site_can9_en,site_can10_en)
       For j = 0 To UBound(attrs)
        %>
         <tr>
         <td width=120 align="right"><b><%=attrs((j))%>:</b></td><td width="400">
          <textarea name="<%="site_can"&(j+1)%>" style="width:400px;height:200px;visibility:hidden;" class="kindeditor4"><%=tohtml(attrs_value(j))%></textarea> 
         </td>
          <!--<td width=60 align="right">英文版</td><td width="400">
          <textarea name="<%="site_can"&(j+1)&"_en"%>" style="width:400px;height:200px;visibility:hidden;" class="kindeditor4"><%=tohtml(attrs_value_en(j))%></textarea> 
          </td>-->
          <td>&nbsp;</td>
         </tr>
        <%
		next
        %>
        </table>
    </td>
</tr>
</table>
<p align="left">
  <input type="submit"  style="margin-left:130px;cursor:hand; "  name="Submit" value=" 修 改 "  >
&nbsp;</p>  
</form>
</body>
</html>
