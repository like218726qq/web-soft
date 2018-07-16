<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table width="145" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="30" class="cpxl">产品系列 /</td>
      </tr>
      <tr>
        <td><!--#include file="search.asp"-->
</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="ny_nav">
            <ul>
            <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="product.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
   <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>

            </ul>
        
        </td>
      </tr>
    </table>