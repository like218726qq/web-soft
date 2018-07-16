<!--#include file="conn.asp"-->
<!--#include file="top.asp"-->

<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" >
  <tr>
    <td background="images/new_bg.gif" style="height:19px;lin-height:19px;width:35px;"><span style="padding-left:3px;color:#FFF;font-weight:bold;">News:</span></td>
    <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select top 1 id,title,img_sl,z_body from info_co where id=26 order by px desc,id desc"
	rs.open sql,conn,1,1
%>
   <td background="images/new_bg.gif" style="height:19px;lin-height:19px;"><span style="font-size:11px;color:#FFF;"><%=rs("z_body")%></span></td>
</table>
<table width="320" border="0" cellpadding="0" cellspacing="0" bgcolor="#F3F3F3">
  <tr>
    <td valign="top"><table width="103"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" height="20"><span style="color:#F00;">天云产品</span></td>
  </tr>
  <tr>
    <td align="center" height="60"><img src="images/lanmu1.gif" width="45" height="45" /></td>
  </tr>
  <%
  set rs=server.CreateObject("adodb.recordset")
  rs.open "select id_lm,title_lm from pro_lm where fid=41 order by px desc,id_lm desc",conn,1,1
  if not rs.eof then
  do while not rs.eof
%>
  <tr>
    <td><a href="product.asp?id_lm=<%=rs("id_lm")%>"><span style="height:18px;line-height:18px;">&nbsp;<img src="images/lanmu_li.gif" border="0"  align="middle" />&nbsp;<%=left(rs("title_lm"),6)%></span></a></td>
  </tr>
<%
  rs.movenext
  loop
  end if
  rs.close
  set rs=nothing
%>  
</table>
</td>
    <td valign="top"><table width="103" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" height="20"><span style="color:#F00;">天云解决方案</span></td>
      </tr>
      <tr>
        <td align="center" height="60"><img src="images/lanmu2.gif" width="48" height="47" /></td>
      </tr>
      <%
  set rs=server.CreateObject("adodb.recordset")
  rs.open "select id_lm,title_lm from pro_lm where fid=40 order by px desc,id_lm desc",conn,1,1
  if not rs.eof then
  do while not rs.eof
%>
  <tr>
    <td><a href="product.asp?id_lm=<%=rs("id_lm")%>"><span style="height:18px;line-height:18px;">&nbsp;<img src="images/lanmu_li.gif" border="0"  align="middle" />&nbsp;<%=left(rs("title_lm"),6)%></span></a></td>
  </tr>
<%
  rs.movenext
  loop
  end if
  rs.close
  set rs=nothing
%>  
    </table></td>
    <td valign="top"><table width="103" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" height="20"><span style="color:#F00;">经典案例</span></td>
      </tr>
      <tr>
        <td align="center" height="60"><img src="images/lanmu3.gif" width="48" height="48" /></td>
      </tr>
      <%
  set rs=server.CreateObject("adodb.recordset")
  rs.open "select id_lm,title_lm from pro_lm where fid=39 order by px desc,id_lm desc",conn,1,1
  if not rs.eof then
  do while not rs.eof
%>
  <tr>
    <td><a href="product.asp?id_lm=<%=rs("id_lm")%>"><span style="height:18px;line-height:18px;">&nbsp;<img src="images/lanmu_li.gif" border="0"  align="middle" />&nbsp;<%=left(rs("title_lm"),6)%></span></a></td>
  </tr>
<%
  rs.movenext
  loop
  end if
  rs.close
  set rs=nothing
%>  
    </table></td>
  </tr>
</table>

<!--#include file="foot.asp"-->

