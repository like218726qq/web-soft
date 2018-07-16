<div class="listL">
            	<h4>联系我们</h4>
                <ul>
                	<!--<li>
                    	<h5><a href="contact.asp">联系方式</a></h5>
                    </li>
                    <li>
                    	<h5><a href="ditu.asp">电子地图</a></h5>
                    </li>-->
					<%
                        set rs=server.CreateObject("adodb.recordset")
                        sql="select id,title from tol_co where lm=1 and id<>5 order by px asc,id asc"
                        rs.open sql,conn,1,1
                        while not rs.eof
                    %> 
                    <li>
                    	<h5><a href="contact.asp?id=<%=rs("id")%>"><%=rs("title")%></a></h5>
                    </li>
					<%
                        rs.movenext
                        wend
                        rs.close
                        set rs=nothing
                    %>                   
                    <li>
                    	<h5><a href="message.asp">在线留言</a></h5>
                    </li>
                </ul>
            </div>