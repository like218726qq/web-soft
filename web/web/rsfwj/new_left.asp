<table width="239" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="106" height="30" align="left" ><table width="106" border="0" cellpadding="0" cellspacing="0" background="images/products_fenl.jpg">
          <tr>
            <td height="30" class="fenl_font" style="padding-left:12px;">新闻中心</td>
          </tr>
        </table></td>
        <td background="images/products_fenl_beij.jpg">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      
    </table>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=6 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
    <table width="239" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="35" align="left" class="fenl_beij"><a href="news.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></td>
        </tr>
      </table>
<%  rs.movenext
    wend
	rs.close
	set rs=nothing
%>
