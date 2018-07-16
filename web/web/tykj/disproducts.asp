<!--#include file="conn.asp"-->
<!--#include file="top.asp"-->
<%
	id=request("id")
	if id="" or not isnumeric(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		
		fid=rs("lm")
		title=rs("title")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from pro_lm where id_lm="&fid&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		title_lm=rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing

%>
<table width="320" border="0" cellspacing="0" cellpadding="0" align="center" style="border:1px solid #CCC">
  <tr>
    <td width="95" valign="top" style="padding-left:5px;border:1px solid #CCC"><!--#include file="left.asp"--></td>
    <td valign="top" align="center"><table width="200" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td align="center"><table width="100%" border="0" cellspacing="10" cellpadding="0">
                      <tr>
                        <td height="250" valign="top">
<%
	id=request("id")
	set rs=server.CreateObject("adodb.recordset")
	if id<>"" then
	  rs.open "select * from pro_co where id="&id&" ",conn,1,1
	  if not rs.eof then
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td align="center"><img src="<%=mid(rs("img_sl"),1,instrrev(rs("img_sl"),"/"))&"d"&mid(rs("img_sl"),instrrev(rs("img_sl"),"/")+1)%>" onload="if (this.width>300){this.height=190*this.height/this.width;this.width=190;}" /></td>
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
                    </table></td>
      </tr>
        <tr>
        <td colspan="2" height="1" align="center"></td>
      </tr>
    </table></td>
  </tr>

</table>

<!--#include file="foot.asp"-->
