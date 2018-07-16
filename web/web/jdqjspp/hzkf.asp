<!--#include file="top.asp"-->
    <div class="listcon">
        <!--#include file="left.asp"-->
    	 <div style="float:right; width:770px;">
            <div class="R1">
            	<h4>合作客户</h4>
            	<p>
                 			<%
								set rs=server.CreateObject("adodb.recordset")
								sql="select * from tol_co where id=8"
								rs.open sql,conn,1,1
								if not rs.eof then
									response.write rs("z_body")
								end if
								rs.close
								set rs=nothing
							%>
                </p>
                 </div>     
         </div>
    </div>
	<div class="clear"></div>
	<!--#include file="bottom.asp"-->
</body>
</html>
