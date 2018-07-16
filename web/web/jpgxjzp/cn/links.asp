<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="html.conn.asp"-->
<!--#include file="html.title.asp"-->
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="index.top.asp"-->
<!--#include file="index.slide.asp"-->
<table width="1203" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:20px; margin-bottom:20px;">
  <tr>
    <td width="234" valign="top"><table width="218" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="101" height="38" align="center" background="images/products_03.jpg" class="font2">友情链接</td>
        <td width="107" background="images/products_04.jpg">&nbsp;</td>
        <td width="10"><img src="images/products_05.jpg" width="9" height="39" /></td>
      </tr>
      <tr>
        <td colspan="3" align="center" bgcolor="#FFFFFF">
		<%call info_lm_nav(52,"links.asp")%>	  
		  </td>
        </tr>
    </table>
      <table width="218" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="101" height="38" align="center" background="images/products_03.jpg" class="font2">联系我们</td>
          <td width="107" background="images/products_04.jpg">&nbsp;</td>
          <td width="10"><img src="images/products_05.jpg" width="9" height="39" /></td>
        </tr>
        <tr>
          <td height="200" colspan="3" align="left" valign="top" bgcolor="#FFFFFF" style="line-height:24px; padding-left:15px;"><%call index_info_tuijian04(54,1,"contact.asp")%></td>
        </tr>
      </table></td>
    <td width="969" valign="top">
	<table width="966" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="10" align="right"><img src="images/products_10.jpg" width="8" height="37" /></td>
        <td width="473" background="images/products_12.jpg" style="font-family:'微软雅黑'; font-size:14px; color:#FF0000">友情链接</td>
        <td width="473" align="right" background="images/products_12.jpg">您现在所在的位置：<a href="index.asp">首页</a> &gt; <a href="links.asp">友情链接</a> &gt; <%=info_lm_title(lm)%></td>
        <td width="10" align="right" background="images/products_12.jpg"><img src="images/products_14.jpg" width="4" height="37" /></td>
      </tr>
    </table>
      <table width="966" border="0" cellspacing="0" cellpadding="0">
        <tr>
		
          <td>
			<!--#include file="html.links.asp"-->
            <br/>
 			<!--#include file="html.page.asp"-->
			</td>
        </tr>
      </table>
	  </td>
  </tr>
</table>
<!--#include file="index.end.asp"-->
</body>
</html>
