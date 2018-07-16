<!--#include file="top.asp"-->

	
    
    
    <div class="listcon">
    	
        <!--#include file="left.asp"-->
    
    	 <div class="listR">
         	
            <div class="R1">
            	<h4>关于石得士</h4>
            	<p>
                 			<%
								set rs=server.CreateObject("adodb.recordset")
								sql="select * from tol_co where id=1"
								rs.open sql,conn,1,1
								if not rs.eof then
									response.write rs("z_body")
								end if
								rs.close
								set rs=nothing
							%>
                
                </p>
                  </div>
                  
                  
                <div class="licon">
                	<ul>
						<%	
                            set rs=server.CreateObject("adodb.recordset")
                            sql="select id,title,img_sl from pro_co where pass='yes' and lm=2 "&sq&" order by px desc,id desc"
                            rs.open sql,conn,1,1
                            if not rs.eof then
                                pagenum=12
                                rs.pagesize=pagenum
                                counter=rs.recordcount
                                pagezong=rs.pagecount
                                pageno=trim(request.querystring("page"))
                                if pageno="" or not isnumeric(pageno) then 
                                    pageno=1
                                end if
                                if pageno<1 then
                                    pageno=1
                                end if
                                if pageno-pagezong>0 then 
                                    pageno=pagezong
                                end if
                                pageno=clng(pageno)
                                rs.absolutepage=pageno
                                a=1
                                while not rs.eof and a<=pagenum
                        %>
                        <li><img src="<%=rs("img_sl")%>" width="164" height="125" />
                        	<br />
                            <%=getstr(rs("title"),70)%>
                        	<a href="product_show.asp?id=<%=rs("id")%>">READ　MORE  >></a>
                        </li>                   
                        <%
                                    if a mod 4 = 0 then response.Write("</tr><tr>")
                                    a=a+1
                                rs.movenext
                                wend
                            end if	
                            rs.close
                            set rs=nothing
                        %>
                        
                    </ul>
        
            </div>
         
         
         
         </div>
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   

	<div class="clear"></div>
	<!--#include file="bottom.asp"-->



</body>
</html>
