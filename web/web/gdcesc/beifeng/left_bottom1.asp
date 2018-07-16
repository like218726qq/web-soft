<div class="picshow1">
	<table border="0" cellpadding="0" cellspacing="0">
    	<tr><td><img src="images/r1.jpg" /></td></tr>
    	<tr>
        	<td width="260" background="images/r2.jpg">
            <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from tol_co where id=5"
				rs.open sql,conn,1,1
				if not rs.eof then
					response.write rs("z_body")
				end if
				rs.close
				set rs=nothing
			%>
            </td>
        </tr>
    	<tr><td><img src="images/r3.jpg" /></td></tr>
    </table>
</div>