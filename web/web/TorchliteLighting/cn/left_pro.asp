<table width="213" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="32" background="images/fenl.jpg" class="font_" style="padding-left:55px;">产品分类</td>
      </tr>
      <tr>
        <td background="images/fenl_beij.jpg" style="padding-top:6px; padding-left:22px;">
          <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
				rs.open sql,conn,1,1
				while not rs.eof
			%>
          <table width="173" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="22" class="fenl"><a href="product.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></td>
          </tr>
          <tr>
            <td height="12"></td>
          </tr>
        </table>
		<%	rs.movenext
			wend
			rs.close
			set rs=nothing
		%>
		<table width="173" height="43" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td>&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
    </table>