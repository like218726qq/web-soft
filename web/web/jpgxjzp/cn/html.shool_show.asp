<style>
.table{ width:700px; margin:20px auto;}
.link{ border-bottom:1px dotted #dcdcdc;}
.title{ font-size:15px; height:32px; line-height:32px; font-weight:bold;}
.min_width{min-width:300px;_width:expression(document.body.clientWidth < 300 ? "300px" : "auto");}
.max_width{max-width:600px;_width:expression(document.body.clientWidth > 600 ? "600px" : "auto");}
.min_height{min-height:200px;_height:expression(this.scrollHeight < 200 ? "200px" : "auto");}
.max_height{max-height:400px;_height:expression(this.scrollHeight > 400 ? "400px" : "auto");}
.min_and_max_width{min-width:300px;max-width:600px;
_width: expression(  document.body.clientWidth < 300 ? "300px" :
( document.body.clientWidth > 600 ? "600px" : "auto"));}
.min_and_max_height{min-height:200px;max-height:400px;
_height: expression(  this.scrollHeight < 200 ? "200px" :
( this.scrollHeight > 400 ? "400px" : "auto"));}  
</style>
<%
if img_sl="" then img_sl="cn/images/jsimg3.jpg"  end if 
if img_sld="" then img_sld="cn/images/jsimg3.jpg"  end if 
%>
<table class="table">
	<tr><td align="center"><div><%=title%></div></td></tr>
	<tr><td align="right"><div class="link"><%=wtime%></div></td></tr>
	<tr><td>&nbsp;</td></tr>
   
	<tr><td align="center"><div>	     
				 <img src="../<%=img_sld%>" 11onerror="img_error(this,'cn/images/jsimg3.jpg')" class="max_width"/>
	</div></td></tr>
    <tr><td align="left"><b>详细介绍:</b></td></tr>
	<tr><td align="left" style="border:1px solid #dcdcdc;"><div style="padding:20px 10px;"><%=z_body%></div></td></tr>
	<tr><td align="left"><div>
		<%if pre_id<>"" then%><a href=""></a>&nbsp;<a href="?id=<%=pre_id%>">上一篇:<%=pre_title%></a><%end if%>
		<%if next_id<>"" then%><br /><a href=""></a>&nbsp;<a href="?id=<%=next_id%>">下一篇:<%=next_title%></a><%end if%>
	</div></td>
	<tr><td align="right"><div>[ <a href="javascript:history.go(-1)">返回</a> ]</div></td></tr>
</table>