<div class="body_bg">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<link href="3d/css/case_style.css" rel="stylesheet" type="text/css" />
<div class="slide-banner">
    <div id="slider" class="slide-wp">
      <ul>
      <%
	  set rs = server.createobject("adodb.recordset")
		  sql="select  * from info_co where lm=16 order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  a=0
			while not rs.eof
			%>
             <li><img src="../<%=rs("img_sl")%>" border="0"></li>
            <%
				a=a+1
			rs.movenext
			wend
		  end if
		  rs.close
		set rs=nothing
	  %>
      </ul>
    </div>
    <div class="nav-wp">
      <ul id="nav_tx" class="nav_tx">
      <%
	  set rs = server.createobject("adodb.recordset")
		  sql="select  * from info_co where lm=16 order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  a=0
			while not rs.eof
			%>
            <li onclick="mySlider.pos(<%=a%>)">●</li>
            <%
				a=a+1
			rs.movenext
			wend
		  end if
		  rs.close
		set rs=nothing
	  %>      
      </ul>
    </div>
    <div style="clear:both;"></div>
</div>
<!--以下脚本要放到Bnaner的下面-->
<script type="text/javascript" src="3d/scripts/case_script.js"></script>
<!--<p style=" font-size:12px; line-height:180%;width:1002px; margin:30px auto;">
<strong>说明：</strong><br />
1.如果该特效的父标签是表格的话，ie6会不兼容<br />
2.如要修改尺寸，只要修改样式表里的尺寸就可以了
</p>-->
</div>
