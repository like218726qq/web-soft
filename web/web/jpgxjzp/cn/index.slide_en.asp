<div class="banner">
  <%
	slide(15)
	if slide_img_sl="" then
	%>
	<img src="images/banner1.jpg" width="995" height="446" /> 
	<%
	else 
	%>
	<script>slide(995,446,"<%=slide_img_sl%>","","");</script>
	<%end if%>   
</div>