
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<table border="0" cellpadding="0" cellspacing="0">
     <tr><td style=" width:288px; height:424px; background:url(images/ny1_09.jpg) left top no-repeat; " valign="top">
	
     <table border="0" cellpadding="0" cellspacing="0">
     <tr><td style=" width:288px; height:26px; ">&nbsp;</td></tr>
     <tr><td style=" width:288px; padding-bottom:30px;" valign="top">
     <div class="pro-Main-list">
	 <table border="0" cellpadding="0" align="left" cellspacing="0">
		<tr><td style=" width:200px; height:15px;">&nbsp;</td></tr>
		<!--循环-->
		<%
			'一级分类
			set rsa=server.CreateObject("adodb.recordset")
			sql="select id_lm,title_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
			rsa.open sql,conn,1,1
			while not rsa.eof
		%>
		<tr><td style=" width:200px; height:25px; text-indent:1em; background:url(images/leftbg.png) left top no-repeat;"><a href="categry_view.asp?dlm=<%=rsa("id_lm")%>"><%=rsa("title_lm")%></a></td></tr>
		<tr><td style=" width:200px; padding:10px;">
		<!--耳机-->
		<ul  class="n-list123">
            <%
		'二级分类
        set rsb=server.CreateObject("adodb.recordset")
        sql="select id_lm,title_lm,title_lm from pro_lm where fid="&rsa("id_lm")&" order by px desc,id_lm desc"
        rsb.open sql,conn,1,1
        if not rsb.eof then
	%>
		<%
			while not rsb.eof
		%>
            <li><a href="product.asp?dlm=<%=rsa("id_lm")%>&id_lm=<%=rsb("id_lm")%>" class="p1"><%=rsb("title_lm")%></a></li>
            <%
			rsb.movenext
			wend
		%>
           <%
        end if
        rsb.close
        set rsb=nothing
    %>
            </ul>
		<!--二级-->
		</td></tr>
		   <%
		rsa.movenext
		wend
		rsa.close
		set rsa=nothing
	%>
		<!--循环-->
		</table>
      <div class="clear"></div>
	   
	  </div>
     </td></tr>
     <tr><td style=" width:288px; height:6px;"></td></tr>
     </table></td></tr>
	  <tr><td style=" width:288px; height:6px;"><img src="images/ny1_23.jpg" alt="" /></td></tr>
	 </table>
