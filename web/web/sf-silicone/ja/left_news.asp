<table width="242" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <Td>
                 <ul id="menu">
        <%
			'一级开始
			set rsa=server.CreateObject("adodb.recordset")
			sql="select id_lm,title_lm from info_lm where fid=12 order by px desc,id_lm asc"
			rsa.open sql,conn,1,1
			while not rsa.eof
		%>
        <li>
        <a href="news.asp?lm=<%=rsa("id_lm")%>"><%=rsa("title_lm")%></a>
        </li>
		<%
			rsa.movenext
			wend
			rsa.close
			set rsa=nothing
			'一级结束
		%>
         </ul>
              
               </Td>
            </tr>
          </table>
           