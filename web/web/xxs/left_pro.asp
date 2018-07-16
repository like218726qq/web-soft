<div class="listL">
            	<h4>产品分类</h4>
                <ul id="menu">
                <li>
               <%
	'一级分类
	set rsa=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
	rsa.open sql,conn,1,1
	while not rsa.eof
%>

    <h5><a href="pro.asp?dlm=<%=rsa("id_lm")%>"><%=rsa("title_lm")%></a></h5>
    
    
	<%
		'二级分类
        set rsb=server.CreateObject("adodb.recordset")
        sql="select id_lm,title_lm from pro_lm where fid="&rsa("id_lm")&" order by px desc,id_lm desc"
        rsb.open sql,conn,1,1
        if not rsb.eof then
	%>
		<%
			while not rsb.eof
		%>

            <h6 <%if dlm<>rsa("id_lm") then response.write" style=""display:none""" end if%>><a href="pro.asp?dlm=<%=rsa("id_lm")%>&xlm=<%=rsb("id_lm")%>"><%=rsb("title_lm")%></a></h6>
            
		<%
			rsb.movenext
			wend
		%>
    <%
        end if
        rsb.close
        set rsb=nothing
    %>

<%
	rsa.movenext
	wend
	rsa.close
	set rsa=nothing
%>
                    </li>
                </ul>
            </div>