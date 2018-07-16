<table width="213" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="32" background="images/products_11.jpg" class="font_" style="padding-left:55px;">Contact Us</td>
        </tr>
        <tr>
          <td class="ney_cont_beij" style="padding-top:8px; padding-left:23px;">
			 <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select * from tol_co where id=11"
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
<table width="213" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><a href="message.asp"><img src="images/liuy.jpg" width="213" height="66" border="0" /></a></td>
        </tr>
      </table>
<table width="213" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td background="images/fenl_beij.jpg">&nbsp;</td>
        </tr>
      </table>
<table width="213" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><a href="job.asp"><img src="images/zhaop.jpg" width="213" height="51" border="0" /></a></td>
        </tr>
      </table>
<table width="213" height="48" border="0" cellpadding="0" cellspacing="0" background="images/fenl_beij.jpg">
        <tr>
          <td height="25" valign="bottom"><img src="images/fenl_di.jpg" width="213" height="4" /></td>
        </tr>
    </table>