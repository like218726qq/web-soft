<!--#include file="top.asp"-->
<%
	id=request("id")
	if id<>"" and checknum(id) then
		sql="select * from job where id="&id&""
	else
		sql="select top 1 * from job where pass='yes' order by px desc,id desc"
	end if
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if not rs.eof then
		id=rs("id")
		title=rs("title")
		z_body=rs("z_body")
		wtime=rs("wtime")
		num=rs("num")
		address=rs("address")
		
	end if
	rs.close
	set rs=nothing
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table width="980" height="154" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0px auto;">
  <tr>
    <td style="padding-top:2px; padding-bottom:1px; background:url(images/n_banner2.jpg) center center no-repeat;"></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" style="background:#9f6300;">&nbsp;</td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="170" align="center" valign="top"><!--#include file="contact_left.asp"--></td>
    <td width="810" valign="top"><table width="810" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="30" style="padding-left:20px; color:#d19231;"><div class="nei_bigclass" >招贤纳士</div></td>
      </tr>
      <tr>
        <td height="20" style="padding-left:20px;">&nbsp;</td>
      </tr>
    </table>
      <table width="810" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="ny_main_rt_f fl" valign="top"><div class="about_zbody">
          职位名称：<%=title%><br />
          发布日期：<%=wtime%><br />
          工作地点：<%=address%><br />
          招聘人数：<%=num%><br />
          职位要求：<%=z_body%><br />
         </div>
          </td>
        </tr>
    </table></td>
  </tr>
</table>


<!--#include file="foot.asp"-->