<div class="banner">
<%
	slide(16)
	if slide_img_sl="" then
	%>
	<img src="images/banner_28.jpg" width="960" height="247" />
	<%
	else 
	%>
	<script>slide(960,247,"<%=slide_img_sl%>","","");</script>
	<%end if%> 

</div>