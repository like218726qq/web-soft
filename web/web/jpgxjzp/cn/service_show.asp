<!--#include file="../html.conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%call info()%>
<!--#include file="../html.title.asp"-->
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="1022" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:64px; margin-bottom:43px;">
  <tr>
    <td><img src="images/bj_03.jpg" width="1022" height="18" /></td>
  </tr>
  <tr>
    <td background="images/bj_05.jpg">
<!--#include file="../index.top.asp"-->
<!--#include file="../index.menu.asp"-->
<!--#include file="../index.slide.asp"-->
      <table width="988" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="243" valign="top">
		  <!--左侧-->
<!--#include file="../index.left.asp"-->
		  <!--左侧end-->
		  </td>
          <td width="17">&nbsp;</td>
          <td width="728" valign="top"><table width="724" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="31" bgcolor="#e5e5e5" style="padding-left:5px;">您现在的位置：<a href="news.asp">新闻中心</a>&gt;&gt;<%=title_lm%>&gt;&gt;<%=title%></td>
            </tr>
          </table>
            <!--#include file="../html.news_show.asp"-->
            </td>
        </tr>
      </table>
      <!--#include file="../index.end.asp"-->
      </td>
  </tr>
  <tr>
    <td><img src="images/bj_32.jpg" width="1022" height="20" /></td>
  </tr>
</table>
</body>

</html>
