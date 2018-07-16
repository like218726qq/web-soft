<!--#include file="top.asp"-->
    <div class="listcon">
        <!--#include file="left_product.asp"-->
    	 <div style="float:right; width:770px;">
            <div class="R1">
            	<h4>产品介绍</h4>
            	<table width="100%" border="0" cellspacing="10" cellpadding="0">
                      <tr>
                        <td height="250" valign="top">
<%
	id=request("id")
	set rs=server.CreateObject("adodb.recordset")
	if id<>"" then
	  rs.open "select * from pro_co where id="&id&" ",conn,1,1
	  if not rs.eof then
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:12px;">
  <tr>
	<td align="center"><img src="<%=mid(rs("img_sl"),1,instrrev(rs("img_sl"),"/"))&"d"&mid(rs("img_sl"),instrrev(rs("img_sl"),"/")+1)%>" onload="if (this.width>550){this.height=550*this.height/this.width;this.width=550;}" /></td>
  </tr>
  <tr><td height="40" align="center" valign="bottom"><%=rs("title")%></td></tr>
  <tr><td height="20"></td></tr>
  <%if rs("z_body") <> "" then%>
	<div>
	  <tr><td valign="top" style="padding-left:10px;">产品详细介绍：</td></tr>
	  <tr>
		<td style="padding-left:20px; line-height:22px;"><%=rs("z_body")%></td>
	  </tr>
	</div>
  <%end if%>
  <tr>
	<td height="30" align="right" style="padding-right:20px;">[ <a href="javascript:history.go(-1)" style="color:#666666;">返回</a> ]</td>
  </tr>
  <tr><td height="15">&nbsp;</td></tr>
</table>
<%
	  rs.close
	  set rs=nothing
	  end if
	end if
%>
                        </td>
                      </tr>
                    </table>
                 </div>     
         </div>
    </div>
	<div class="clear"></div>
	<!--#include file="bottom.asp"-->
</body>
</html>
