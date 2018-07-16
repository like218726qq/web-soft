<div class="weibo">
  <div class="wbl_title">微博动态</div>
  <ul class="pic">
  	<%
		set rs=server.CreateObject("adodb.recordset")
		sql="select top 1 * from info_co where lm=49 and pass='yes' order by px desc,id desc"
		rs.open sql,conn,1,1
		if not rs.eof then
		while not rs.eof 
	%>
     <li><img src="<%=rs("img_sl")%>" /></li>
     <%
			rs.movenext
			wend
			end if	
			rs.close
			set rs=nothing
		%>
  </ul>
  <div class="clear"></div>
  <div class="news_ul mar42">
  <script type="text/javascript" src="scripts/MSClass.js"></script>
  <%if n=1 then%>
  	<table border="0" cellpadding="0" cellspacing="0" width="240" style="line-height:26px; padding-top:10px;">
    	<tr>
        	<Td>
           	 <div id="MarqueeDiv1" style="width:240px; height:202px; ">
            	<table border="0" cellpadding="0" cellspacing="0">
					<%
						set rs=server.CreateObject("adodb.recordset")
						sql="select * from info_co where lm=1 and pass='yes' order by px desc,id desc"
						rs.open sql,conn,1,1
						while not rs.eof 
					%>
                	<tR>
                    	<td><a href="<%=rs("link_url")%>" target="_blank"><%=getstr(rs("title"),36)%></a></td>
                    </tR>
					 <%
                        rs.movenext
                        wend
                        rs.close
                        set rs=nothing 
                    %>
                </table>
                </div>
			<script type="text/javascript">
                var rollBox1= new Marquee("MarqueeDiv1",0,5,240,202,180,0,0,190);
            </script>
            </Td>
        </tr>
    </table>
    <%else%>
    	<table border="0" cellpadding="0" cellspacing="0" width="240" style="line-height:26px; padding-top:10px;">
            <tr>
                <Td>
                 <div id="MarqueeDiv" style="width:240px; height:234px; ">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <%
                            set rs=server.CreateObject("adodb.recordset")
                            sql="select * from info_co where lm=1 and pass='yes' order by px desc,id desc"
                            rs.open sql,conn,1,1
                            while not rs.eof 
                        %>
                        <tR>
                            <td><a href="<%=rs("link_url")%>" target="_blank"><%=getstr(rs("title"),36)%></a></td>
                        </tR>
                         <%
                            rs.movenext
                            wend
                            rs.close
                            set rs=nothing 
                        %>
                    </table>
                    </div>
                <script type="text/javascript">
                    var rollBox= new Marquee("MarqueeDiv",0,5,240,234,180,0,0,190);
                </script>
                </Td>
            </tr>
        </table>
    <%end if%>
    
  </div>	

  <div class="don"></div>
</div>