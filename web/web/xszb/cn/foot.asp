<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" height="2" style="background:url(images/sy_09.jpg) no-repeat; margin-top:10px;">
  <tr>
    <td height="2" style="background:url(images/sy_09.jpg) no-repeat;"></td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="387" height="48" class="db" style="padding-left:10px;"><a href="job.asp">招贤纳士</a>  <a href="messages.asp">在线留言 </a>  <a href="map.asp">网站地图</a></td>
    <td width="399">&nbsp;</td>
    <td width="194"><table width="178" border="0" cellspacing="0" cellpadding="0" style="display:block;">
    <form action="product.asp" method="get">      
    <tr>
        <td width="132" height="22" style="background:#414141; line-height:22px; "><input name="keyword" type="text" class="search_k1" id="keyword" onclick="this.value=''" value="输入产品编号" /></td>
        <td width="2">&nbsp;</td>
        <td width="43" style="background:#747474; "><input name="" type="submit" value="搜 索" class="search_k2"  /></td>
      </tr>
      </form>
    </table></td>
  </tr>
</table>

<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" height="1" style="background:#252525;">
  <tr>
    <td height="1" style="background:#252525;"></td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="35" style="color:#7f7f7f; padding-left:10px;" class="db">
    相关链接：  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,link_url from info_co where pass='yes' and lm=22 order by px desc,id desc"
	rs.open sql,conn,1,1
	i=1
	while not rs.eof 
	%>
    <%if i=1 then%><a href="<%=rs("link_url")%>" target="_blank"><%=rs("title")%></a><%else%>
     |  &nbsp;<a href="<%=rs("link_url")%>" target="_blank"><%=rs("title")%></a>
     <%end if%>
    <%
	    i=i+1
		rs.movenext
		wend
	rs.close
	set rs=nothing
%>
</td>
  </tr>
  <tr>
    <td height="30" style="color:#7f7f7f; padding-left:10px;">
   <%=site_bot%> </td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
