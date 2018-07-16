<div class="banner"><div id="focus">
    <div id="focus_bg"></div>
    <div id="focus_show"></div>
    <div id="focus_img">
	<%
		
        set rs=server.CreateObject("adodb.recordset")
        sql="select top 3 id,title,img_sl from info_co where lm=4 order by px desc,id desc"
        rs.open sql,conn,1,1
		a=1
        while not rs.eof
    %>
    <div name="focus_img" id="focus_<%=a%>">../<%=rs("img_sl")%>||<%=rs("title")%></div>
	<%
		a=a+1
        rs.movenext
        wend
        rs.close
        set rs=nothing
    %>
    </div>
    <script type="text/javascript" src="js/focus.js"></script>
  </div></div>