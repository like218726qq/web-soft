<table width="214" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f0f0" class="bk">
    <tr>
      <td align="center" style="padding-bottom:6px; padding-top:8px; color:#a0892d;">联系我们</td>
    </tr>
    <tr>
      <td style="padding-bottom:12px;"><table width="193" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" background="images/pro_22.jpg">
        <tr>
          <td><img src="images/pro_16.jpg" width="193" height="24" /></td>
        </tr>
        <tr>
          <td style="line-height:26px; padding:30px 10px 20px 30px; color:#a0892d;background:url(images/pro_19.jpg) 3px top no-repeat;">
          	<%
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from tol_co where id=10"
				rs.open sql,conn,1,1
				if not rs.eof then
					response.write rs("z_body")
				end if
				rs.close
				set rs=nothing
			%>
          </td>
        </tr>
        <tr>
          <td><img src="images/pro_19-07.jpg" width="193" height="10" /></td>
        </tr>
      </table></td>
    </tr>
  </table>