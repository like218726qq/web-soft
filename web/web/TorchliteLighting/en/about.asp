<!--#include file="conn.asp"-->
<%a=2%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Torchlite Lighting Co. LTD</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="213" valign="top">
      <!--#include file="left_pro.asp"-->
	  <!--#include file="left_con.asp"-->  
    </td>
    <td width="15" height="100">&nbsp;</td>
    <td width="774" valign="top" bgcolor="#f8f8f8"><table width="774" border="0" cellpadding="0" cellspacing="0" background="images/products_03.jpg">
      <tr>
        <td width="42" height="33">&nbsp;</td>
        <td width="105" class="zhans">About Us</td>
        <td width="627" align="right" class="weiz" style="padding-right:20px;">Location：<a href="index.asp">Home</a> &gt;&gt; About Us</td>
      </tr>
    </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="padding:20px; line-height:180%; font-size:14px;">
             <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from tol_co where id=8"
				rs.open sql,conn,1,1
				if not rs.eof then
					response.write rs("z_body")
				end if
				rs.close
				set rs=nothing
			%>
          </td>
        </tr>
      </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
