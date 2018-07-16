<!--#include file="top.asp"-->

	
    <div class="cont1">
    	<div class="news">
        	<h4>新闻中心</h4>
        	<ul>
            
           	<%
				 set rs=server.CreateObject("adodb.recordset")
				 rs.open "select * from info_co where lm=1 order by px desc,id desc",conn,1,1
				 if not rs.eof then
				 do while not rs.eof
			%>
			<li><a href="news_show.asp?id=<%=rs("id")%>"><%response.write left(rs("title"),10)%></a></li>
			<%
				  rs.movenext
				  loop
				  end if
				  rs.close
				  set rs=nothing
				%>
            	
               
              
            </ul>
        </div>
    
    	<div class="company">
        	<h4>公司简介</h4>
        	<div class="comcon">
            	<img src="images/comimg.jpg" width="235" height="130" />
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
                <a href="#">【详细介绍】</a>
                </p>
            
            </div>
        
        </div>
    
    
    
    	<div class="contact">
        	<h4>联系我们</h4>
            <h5>深圳市佳德清洁设备用品有限公司</h5>
        	<div class="contactcon">
            	
              <%
				set rs=server.CreateObject("adodb.recordset")
				rs.open "select z_body from tol_co where id=4",conn,1,1
				response.Write(rs("z_body"))
				rs.close
				set rs=nothing
			  %>
            
            </div>
        	
        </div>
    
    
    
    </div>



	<div class="cont2">
    
    
    	<div class="cont2_1">
        	
            <div class="c1">
            	
                <div class="c1L">
                <img src="images/cont2_1img1.jpg" width="42" height="48" />
                <img src="images/cont2_1img2_13.jpg" width="42" height="53" />
                </div>
                <div class="c1R">
                	<a href="wjxz.asp"><img src="images/wj.jpg" width="96" height="26" /></a>
                    <a href="spxz.asp"><img src="images/sp.jpg" width="96" height="26" /></a>
                    
                
                
                </div>
    
            </div>
        	
            
            <div>
            
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<form id="form2" name="form2" method="post" action="product.asp">
          <tr>
            <td><input name="keyword"  type="text" style=" border:1px solid #D0B987" class="input_1"  id="keyword" size="18" maxlength="50" /></td>
            <td width="4">&nbsp;</td>
            <td><input name="submit" class="go" type="image" src="images/serbut.jpg"/></td>
          </tr>
		  </form>
        </table>
            </div>
            
            
        
        </div>
    
    
    
    
    	<div class="listp">
        
        	<h4>产品展示</h4>
            
            <div class="pcon">
            	<ul>
                	
             <%
				 set rs=server.CreateObject("adodb.recordset")
				 rs.open "select top 3 * from pro_co where tuijian='yes' order by px desc,id desc",conn,1,1
				 if not rs.eof then
				 do while not rs.eof
			%>
					<li class="no" style="margin-left:5px;">
                        <div class="liL">
                            <h5><%response.write left(rs("title"),10)%></h5>
                            <ul>
                            	<li><%response.write left(rs("z_body"),40)%></li>
                            
                            </ul>
                            <a href="product_show.asp?id=<%=rs("id")%>"><img src="images/libut.jpg" width="85" height="34" /></a>
                        </div>
                        <div class="liimg">
                            <img src="<%=rs("img_sl")%>" border="0" width="110" height="145" />
 						</div>
                    </li>
				<%
				  rs.movenext
				  loop
				  end if
				  rs.close
				  set rs=nothing
				%>   
                    
                    
              
                
                		
                
                
                </ul>
            
            </div>
        
        
        </div>
    
    
    
    
    </div>



<!--#include file="bottom.asp"-->


</body>
</html>
