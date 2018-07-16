<liNK type=text/css href="css/case_style.css" rel=stylesheet>
<SCRIPT src="scripts/jquery-1.7.1.min.js"></SCRIPT>
<SCRIPT src="scripts/case_script.js"></SCRIPT>
<div class="banner">
            <div class=bannerBox>
	<div class=slideBoxNav>
        <a href="javascript:void(0)">●</a>
        <a href="javascript:void(0)">●</a>
        <a href="javascript:void(0)">●</a>
    </div>
    <div class=slideBox>
        <ul>
							<%
							set rs=server.CreateObject("adodb.recordset")
							sql="select top 3 * from info_co where lm=4 order by px desc,id asc"
							rs.open sql,conn,1,1
							while not rs.eof 
				           %>
          <li style="background: url(<%=rs("img_sl")%>) no-repeat center top"></li>
					  <%
					rs.movenext
					wend
					rs.close
					set rs=nothing 
					%>
          <div style="clear:both;"></div>
        </ul>
    </div>
</div>
        </div>