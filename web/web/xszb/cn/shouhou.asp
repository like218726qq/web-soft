<!--#include file="top.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table width="980" height="154" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0px auto;">
  <tr>
    <td style="padding-top:2px; padding-bottom:1px; background:url(images/n_banner1.jpg) center center no-repeat;"></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" style="background:#9f6300;">&nbsp;</td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="170" align="center" valign="top"><!--#include file="tech_left.asp"--></td>
    <td width="810" valign="top"><table width="810" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="30" style="padding-left:20px; color:#d19231;"><div style="  height:25px; line-height:25px;">售后保修网点</div></td>
      </tr>
      <tr>
        <td height="20" style="padding-left:20px;">&nbsp;</td>
      </tr>
    </table>
      <table width="810" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="ny_main_rt_f fl" valign="top">
          <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select  * from tol_co where id=11 "
        rs.open sql,conn,1,1
	if not rs.eof then
%>


          <div class="about_zbody"><%=rs("z_body")%></div>
    <%  
	end if
        rs.close
        set rs=nothing
            %>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
<div class="clear"></div>
<!--#include file="foot.asp"-->