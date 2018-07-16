<div class="listL">
        	<div class="listcontact">
                <h4>联系我们</h4>
                <h5>深圳市佳德清洁设备用品有限公司</h5>
                <div class="contactcon">
                 <%
				set rs=server.CreateObject("adodb.recordset")
				rs.open "select z_body from tol_co where id=5",conn,1,1
				response.Write(rs("z_body"))
				rs.close
				set rs=nothing
			    %>
                
                </div>
        	
       		 </div>
             
             
             
             
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
            
            
            
            
        </div>