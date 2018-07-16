<!--#include file="top.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="9" valign="top">&nbsp;</td>
    <td width="312" valign="top"><table width="312" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30"><span class="biaot">公司简介</span> /About us</td>
      </tr>
      
    </table>
      <table width="312" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="about_font"><img src="images/about.jpg" width="74" height="137" class="about_tu" /><a href="about.asp"><%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=20"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.write rs("z_body")
	end if
	rs.close
	set rs=nothing
%></a><br />
            <span class="about_gengd"><a href="about.asp">查看详细&gt;&gt;</a></span></td>
        </tr>
      </table></td>
    <td width="20" height="100">&nbsp;</td>
    <td width="344" valign="top"><table width="344" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30"><span class="biaot">新品推荐 </span>/New Products</td>
      </tr>
    </table>
      <table width="344" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
<!--#include file="in_pro.asp"--></td>
        </tr>
      </table></td>
    <td width="25">&nbsp;</td>
    <td width="292" valign="top"><table width="292" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30"><span class="biaot">联系我们 </span>/Contact us</td>
      </tr>
    </table>
      <table width="292" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="contact_font"><img src="images/contact.jpg" width="74" height="137" class="contact_tu" /><%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=21"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.write rs("z_body")
	end if
	rs.close
	set rs=nothing
%></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->