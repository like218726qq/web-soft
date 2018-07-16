<!--#include file="conn.asp"-->
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=24"
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("La información no existe o ha sido suprimido!","")
	else
		title=rs("title")
		z_body=rs("z_body")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong(0)%></title>
<meta content="<%=zhong(1)%>" http-equiv="keywords" />
<meta content="<%=zhong(2)%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header-->
<!--#include file="header.asp"-->
<!--#banner-->

<!--middle-->
<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="9" valign="top"><img src="images/product1_10.jpg" width="9" height="47" /></td>
    <td width="248" align="right" valign="top" bgcolor="#FFFFFF"><table width="248" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="47" align="center" class="nei_fenl">Lista de Productos</td>
      </tr>
    </table>
      <table width="242" border="0" cellpadding="0" cellspacing="0" background="images/product1_fenl_beij.jpg">
        <tr>
          <td valign="top" style="padding-top:12px;">
          <!--product menu-->
          <!--#include file="left_pro.asp"-->
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="35" background="images/product1_fenl_beij.jpg">&nbsp;</td>
              </tr>
            </table>
            <!--contact-->
              <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/product1_contact_tu.jpg" width="242" height="88" /></td>
              </tr>
            </table>
            </td>
        </tr>
      </table></td>
    <td width="18" height="100" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="733" valign="top" bgcolor="#FFFFFF"><table width="733" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="38" class="zhans"><%=title%></td>
      </tr>
    </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>

          <td><img src="images/product1_shang.jpg" width="733" height="4" /></td>
        </tr>
        <tr>
          <td background="images/product1_zhong.jpg" style="padding:20px 20px 10px 20px; height:390px; line-height:180%; text-align:justify" valign="top">
          <%=z_body%>
          </td>
        </tr>
        <tr>
          <td><img src="images/product1_xia.jpg" width="733" height="5" /></td>
        </tr>
    </table></td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10">&nbsp;</td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--footer-->
<!--#include file="footer.asp"-->
</body>
</html>
