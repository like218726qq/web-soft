<table width="302" border="0" cellpadding="0" cellspacing="0" class="bk">
    <tr>
      <td><img src="images/jmwy_31.jpg" width="301" height="28" border="0" usemap="#Map1" /></td>
    </tr>
    <tr>
      <td style="padding-bottom:12px; padding-top:15px;"><table width="275" border="0" align="center" cellpadding="0" cellspacing="0" style="line-height:25px; color:#525353;" class="lj">
		  <%
            set rs=server.CreateObject("adodb.recordset")
            sql="select top 10 id,title,color_font,wtime from info_co where lm=3 and pass='yes' order by px desc,id desc"
            rs.open sql,conn,1,1
            while not rs.eof 
         %>
        <tr>
          <td><a href="news_show.asp?id=<%=rs("id")%>"><font style="color:<%=rs("color_font")%>;"><%=getstr(rs("title"),25)%></font></a></td>
          <td>[<%=formatdate(rs("wtime"))%>]</td>
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
<map name="Map1">
<area shape="rect" coords="241,5,297,23" href="news.asp">
</map>