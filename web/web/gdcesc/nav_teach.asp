<div  style="width:1001px; height:43px; line-height:43px; margin:10px auto; font-size:14px; ">
  <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center" class="nav" style="background:url(images/nav_bj.jpg) no-repeat;">
  	<tr>
    	<td align="center"><%if session("person")<>"" then%><a href="person_home.asp" <%if t=1 then%> class="cur" <%end if%>>口语1对1学习</a><%else%><span style="color:#999999">口语1对1学习</span><%end if%></td>
    	<td align="center"><%if session("person")<>"" then%><a href="read.asp"  <%if t=2 then%> class="cur" <%end if%>>写作学习及在线修改</a><%else%><span style="color:#999999">写作学习及在线修改</span><%end if%></td>
        <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select id_lm,title_lm from teach_lm where fid=0 order by px desc,id_lm desc"
			rs.open sql,conn,1,1
			while not rs.eof
		%>
    	<td align="center"><a href="teaching.asp?lm=<%=rs("id_lm")%>" <%if lm=rs("id_lm") then%> class="cur"<%end if%>><%=rs("title_lm")%></a></td>
       <%  rs.movenext
			wend
			rs.close
			set rs=nothing
		%>
    </tr>
  </table>
</div>