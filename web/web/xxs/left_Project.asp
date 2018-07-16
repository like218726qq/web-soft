<div class="listL">
            	<h4>服务项目</h4>
                <ul>
                <li>
        <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select * from tol_lm where id_lm=5 order by px desc"
			rs.open sql,conn,1,1
			if not rs.eof then
		%>         
    <h5><%=rs("title_lm")%></h5>
    <%  
		end if
		rs.close
		set rs=nothing
	%>
    <%
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from tol_co where lm=5 order by px desc,id desc"
		rs.open sql,conn,1,1
		while not rs.eof
	%>
<h6><a href="project.asp?id=<%=rs("id")%>"><%=rs("title")%></a></h6>
<%  rs.movenext
    wend
	rs.close
	set rs=nothing
%>
 </li>
                </ul>
            </div>