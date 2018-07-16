<!--#include file="conn.asp"-->
<!--#include file="top.asp"-->

<table width="320" border="0" cellspacing="0" cellpadding="0" align="center" style="border:1px solid #CCC">
  <tr>
    <td width="95" valign="top" style="padding-left:5px;border:1px solid #CCC"><!--#include file="left.asp"--></td>
    <td valign="top" ><table width="190" cellspacing="0" cellpadding="0">
      <tr>
       <%
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from tol_co where id=10"
		rs.open sql,conn,1,1
		z_body=rs("z_body")
		rs.close
		set rs=nothing
      %>
        <td><div style="padding:5px 10px 5px 10px;width:180px;"><%=z_body%></div></td>
      </tr>
        <tr>
        <td colspan="2" height="1" align="center"></td>
      </tr>
    </table></td>
  </tr>

</table>

<!--#include file="foot.asp"-->
