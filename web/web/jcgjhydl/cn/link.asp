<div id="yq">
        <div id="yqIN"><img src="images/yq_96.jpg" /></div>
        <div id="yqIMID">
            <div id="demo" style="overflow:hidden; width:854px; float:left">
       <table cellpadding="0" cellspacing="0" border="0" class="new">
         <tr>
           <td id="demo1" valign="top" align="center">
		   <table cellpadding="2" cellspacing="0" border="0" align="center">
               <tr>
                 <td><table><tr>
            <%
sql="select top 20 id,title,link_url,img_sl from info_co where pass='yes' and lm in(4) order by px desc,id desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof 
	   %>
              <td> <ul> <li><A href="<%=rs("link_url")%>" target="_blank"><img src="../<%=rs("img_sl")%>" height="65" /></A></li></ul> </td>
                 <%rs.movenext     
	  loop
	end if
	rs.close
	set rs=nothing%>
</tr>
</table>
</td>
</tr>
           </table>		   </td>
           <td id="demo2" valign="top"></td>
         </tr>
       </table>
       </div>
            <div class="clear"></div>
        </div>
        <script>
var speed=1//速度数值越大速度越慢
demo2.innerHTML=demo1.innerHTML
function Marquee(){
if(demo.scrollLeft>=demo2.offsetWidth)
demo.scrollLeft-=demo2.offsetWidth
else{
demo.scrollLeft++
}
}
var MyMar=setInterval(Marquee,speed)
demo.onmouseover=function() {clearInterval(MyMar)}
demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
</script>
        <div id="yqBOT"><img src="images/index_101.jpg" /></div>
        <div class="clear"></div>
    </div>