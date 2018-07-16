<!--#include file="conn.asp"-->
<%
    id=request("id")
	if id="" then
	call msg("参数错误","")
	end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong(0)%></title>
<meta content="<%=zhong(1)%>" http-equiv="keywords" />
<meta content="<%=zhong(2)%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header-->
<!--#include file="header.asp"-->
<!--#banner-->

<!--middle-->
<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="9" valign="top"><img src="images/product1_10.jpg" width="9" height="47" /></td>
    <td width="248" align="right" valign="top" bgcolor="#FFFFFF"><table width="248" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="47" align="center" class="nei_fenl">Centro de noticias</td>
      </tr>
    </table>
      <table width="242" border="0" cellpadding="0" cellspacing="0" background="images/product1_fenl_beij.jpg">
        <tr>
          <td valign="top" style="padding-top:12px;">
          <!--product menu-->
          <!--#include file="left_news.asp"-->
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="35">&nbsp;</td>
              </tr>
            </table>
            <!--contact-->
            <!--#include file="left_cont.asp"-->
          </td>
        </tr>
      </table></td>
    <td width="18" height="100" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="733" valign="top" bgcolor="#FFFFFF"><table width="733" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="38" class="zhans"><a href="job.asp">trabajo</a></td>
      </tr>
    </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>

          <td><img src="images/product1_shang.jpg" width="733" height="4" /></td>
        </tr>
        <tr>
          <td background="images/product1_zhong.jpg" style="height:435px;" valign="top">
            <div style="padding:10px; width:690px; margin:0 auto">
            <%
     Set rs= Server.CreateObject("ADODB.Recordset")
	sql="select *  from job  where pass='yes' and id="&id&" order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
%>
	<TABLE width="100%" border=0 align="center" cellPadding=0 cellSpacing=0>
	  <TR>
		<TD width="18"><IMG height=17 alt="" src="images/job_line_01.gif" width=18></TD>
		<TD background=images/job_line_02.gif></TD>
		<TD width="19"><IMG height=17 alt="" src="images/job_line_03.gif"  width=19></TD>
	  </TR>
	  <TR>
		<TD background=images/job_line_04.gif>&nbsp;</TD>
		<TD vAlign=top align=middle bgColor=#ffffff>
            <TABLE cellSpacing=1 cellPadding=3 width="100%" border=0 bgColor=#cccccc>
              <TR bgColor=#ffffff>
                <TD align=right width="18%" bgColor=#f3f3f3><strong><span id="result_box" lang="en" xml:lang="en">Título del trabajo</span>：</strong></TD>
                <TD colSpan=3 align="left"><%=rs("title")%></TD>
               <!-- <TD onmouseover="this.bgColor='#FFDDD7';" onmouseout="this.bgColor='#f3f3f3'" align=middle width="24%"><A href="job_yp.asp?job_title=<%=escape(rs("title"))%>">应聘此岗位</A></TD>--></TR>
              <TR bgColor=#ffffff>
                <TD height="60" align=right vAlign=top bgColor=#f3f3f3><strong><span id="result_box2" lang="en" xml:lang="en">Requisitos</span>：</strong></TD>
                <TD  colSpan=3 align="left" valign="top" style="line-height:20px; "><%=rs("z_body")%></TD>
              </TR>
              <TR bgColor=#ffffff>
                <TD align=right bgColor=#f3f3f3 height=18><strong><span id="result_box3" lang="en" xml:lang="en">número</span>：</strong></TD>
                <TD width="33%" align="left"><%=rs("num")%></TD>
                <TD align=middle width="22%"  bgColor=#f3f3f3><strong><span id="result_box5" lang="en" xml:lang="en">lugar de trabajo</span>：</strong></TD>
                <TD width="27%" align="left"><%=rs("address")%></TD>
              </TR>
              <TR bgColor=#ffffff>
                <TD align=right bgColor=#f3f3f3 height=18><strong><span id="result_box4" lang="en" xml:lang="en">Fecha de inicio</span>：</strong></TD>
                <TD width="33%" align="left"><%=rs("wtime")%></TD>
                <TD align=middle width="22%"  bgColor=#f3f3f3><strong>Fecha de finalización：</strong></TD>
                <TD align="left"><%=rs("etime")%></TD>
              </TR>
             </TABLE>
		</TD>
		<TD background=images/job_line_06.gif>&nbsp;</TD></TR>
	  <TR>
		<TD><IMG height=18 alt="" src="images/job_line_07.gif"  width=18></TD>
		<TD background=images/job_line_08.gif></TD>
		<TD><IMG height=18 alt="" src="images/job_line_09.gif"  width=19></TD>
      </TR>
    </TABLE>
<%
      end if
        rs.close
        set rs=nothing
     %>
            </div>
            </td>
        </tr>
        <tr>
          <td><img src="images/product1_xia.jpg" width="733" height="5" /></td>
        </tr>
      </table></td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10">&nbsp;</td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--footer-->
<!--#include file="footer.asp"-->
</body>
</html>
