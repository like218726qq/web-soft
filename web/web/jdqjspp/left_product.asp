<script LANGUAGE="JavaScript">
function iEsc(){ return false; }
function iRec(){ return true; }
function DisableKeys() {
if(event.ctrlKey || event.shiftKey || event.altKey)  {
window.event.returnValue=false;
iEsc();}
}
document.ondragstart=iEsc;
document.onkeydown=DisableKeys;
document.oncontextmenu=iEsc;
if (typeof document.onselectstart !="undefined")
document.onselectstart=iEsc;
else{//qsyz.net
document.onmousedown=iEsc;
document.onmouseup=iRec;
}
function DisableRightClick(www_qsyz_net){
if (window.Event){
if (www_qsyz_net.which == 2 || www_qsyz_net.which == 3)
iEsc();}
else
if (event.button == 2 || event.button == 3){
event.cancelBubble = true
event.returnValue = false;
iEsc();}
}
</script>
<style>
a:link.product {color: #1b5988; text-decoration:none}		/* 未访问的链接 */
a:visited.product {color: #1b5988; text-decoration:none}	/* 已访问的链接 */
a:hover.product {color: #999999;text-decoration:none}
</style>
<div class="listL">
     <div class="listcontact" style="float:left;">
                <h4>产品中心</h4>
       <%
      set rs=server.CreateObject("adodb.recordset")
      rs.open "select * from pro_lm where fid=0 and id_lm<>2 order by px desc,id_lm desc",conn,1,1
      if not rs.eof then
      do while not rs.eof
      %>
      <table cellpadding="0" cellspacing="0" style="border-bottom:1px #666666 dashed;" width="180" height="30px">
<tr>
<td><font style="font-size:11px; font-family:'宋体';"> >&nbsp;&nbsp;</font><a class=product href="product.asp?fid=<%=rs("id_lm")%>"><font style="font-size:12px; font-family:'宋体';"><%=rs("title_lm")%></font></a></td>
</tr>
</table>
	<div id="left1" <% fid=request("fid")  
	if int(fid)=int(rs("id_lm")) then 
	response.write ("style='display:block;'") 
	else 
	response.write ("style='display:none;'") 
	end if
	%>> 
    
	 <%
      set rsa=server.CreateObject("adodb.recordset")
      rsa.open "select * from pro_lm where fid="&rs("id_lm")&" order by px desc,id_lm desc",conn,1,1
      if not rsa.eof then
      do while not rsa.eof
      %>
    <table cellpadding="0" cellspacing="0" style="border-bottom:1px #666666 dashed;" width="180" height="30px">
    <tr>
    <td style="padding-left:15px;"><font style="font-size:11px; font-family:'宋体';"> >&nbsp;&nbsp;</font></td><td width="80%"><a class=product href="product.asp?id=<%=rsa("id_lm")%>&fid=<%=rs("id_lm")%>"><font style="font-size:12px; font-family:'宋体';"><%=rsa("title_lm")%></font></a></td>
    </tr>
    </table> 
    <%
      rsa.movenext
      loop
      end if
      rsa.close
      set rsa=nothing
    %>	 
    </div>
      
<%
  rs.movenext
  loop
  end if
  rs.close
  set rs=nothing
%>	 
          <div class="clear"></div>       
     </div>  
     <div class="listcontact cont2_1">
                <h4>联系我们</h4>
                <h5>深圳市佳德清洁设备用品有限公司</h5>
                <div class="contactcon">
                 <%
				set rs=server.CreateObject("adodb.recordset")
				rs.open "select z_body from tol_co where id=5",conn,1,1
				response.Write(rs("z_body"))
				rs.close
				set rs=nothing
			    %>
                
                </div>
        	
       		 </div>
</div>