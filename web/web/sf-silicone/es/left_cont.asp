
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="35" align="center" class="contact">Contáctenos</td>
              </tr>
              <tr>
                <td><img src="images/product1_contact.jpg" width="242" height="94" /></td>
              </tr>
            </table>
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" class="news_font" style="padding-left:8px;">
                <%
				   set rs=server.CreateObject("adodb.recordset")
				   sql="select z_body from tol_co where id=20" 
				   rs.open sql,conn,1,1
				   if not rs.eof then
				   response.Write(rs("z_body"))
				   end if
				   rs.close
				   set rs=nothing
				%>
                </td>
              </tr>
            </table>
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/product1_contact_tu.jpg" width="242" height="88" /></td>
              </tr>
            </table>