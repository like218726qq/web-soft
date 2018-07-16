<link rel="stylesheet" type="text/css" href="css/css.css"/>
<div class="contact">
      	<div class="conT"><img src="images/ny_12.jpg" /></div>
        <div class="conM">
        	<p style=" line-height:200%">
            <%
						set rs=server.CreateObject("adodb.recordset")
						sql="select * from info_co where id=10"
						rs.open sql,conn,1,1
						if not rs.eof then
							response.write rs("f_body")
						end if
						rs.close
						set rs=nothing
					%>
            </p>
        </div>
        <div class="conB"><img src="images/ny_18.jpg" /></div>
      </div>