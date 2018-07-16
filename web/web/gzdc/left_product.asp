<table width="214" border="0" cellspacing="0" cellpadding="0">
  <tr>
     <td style="background-image:url(images/bj.jpg); width:214x; line-height:30px;  color:#965503; font-weight:bold; padding-left:15px; font-family:'微软雅黑'; font-size:13px;"  height="30">房源超市</td>
  </tr>
  <tr>
    <td style="padding:11px 0px;"><table width="214" border="0" cellspacing="0" cellpadding="0">
		<%
            set rs=server.CreateObject("adodb.recordset")
            sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
            rs.open sql,conn,1,1
            while not rs.eof
        %>
      <tr>
        <td>
        	<a href="product.asp?lm=<%=rs("id_lm")%>" class="pro"><%=rs("title_lm")%></a>
		</td>
      </tr>
      <%
	    rs.movenext
		wend
		rs.close
		set rs=nothing
	 %>
    </table></td>
  </tr>
</table>
  