<!--#include file="top.asp" -->
<%
	id=request("id")
	if id<>"" and checknum(id) then
		sql="select * from tol_co where id="&id&""
	else
		sql="select top 1 * from tol_co where lm=4 order by px desc,id desc"
	end if
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if not rs.eof then
		id=rs("id")
		title=rs("title")
		z_body=rs("z_body")
	end if
	rs.close
	set rs=nothing
%>
<table width="980" height="154" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0px auto;">
  <tr>
    <td style="padding-top:2px; padding-bottom:1px; background:url(images/n_banner1.jpg) center center no-repeat;"></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" style="background:#9f6300;">&nbsp;</td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="170" align="center" valign="top"><table width="145" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="30" class="cpxl">About Us /</td>
      </tr>
      <tr>
        <td><!--#include file="search.asp"-->
</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="ny_nav">
            <ul>
            <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select lm,id,title,px from tol_co where lm=4 order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="about.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
     <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>

            </ul>
        
        </td>
      </tr>
    </table></td>
    <td width="810" valign="top"><table width="810" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="30" style="padding-left:20px; color:#d19231;"><div class="nei_bigclass" ><%=title%></div></td>
      </tr>
      <tr>
        <td height="20" style="padding-left:20px;">&nbsp;</td>
      </tr>
    </table>
      <table width="810" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="ny_main_rt_f fl" valign="top">
          <div class="about_zbody"><%=z_body%></div>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
<!--#include file="foot.asp" -->