<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->

<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/quicknav.css" />
<script type="text/javascript" src="c/common.js?v=2012081522"></script>
<style type="text/css">
<!--
.STYLE1 {
	color: #a49a9a;
	font-size: 14px;
}
.STYLE8 {
	color: #27B5A6;
	font-weight: bold;
	font-size:16px;
}
-->
</style>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><Td align="center">
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1002" height="878"><table width="1002" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46" align="center" valign="bottom" style=" background:url(images/neiye-k_11.jpg) left no-repeat "><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="216" height="40" align="center" valign="bottom"><table width="192" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="40" align="center" valign="middle" class="STYLE8" style="background:url(images/ny-zuo_12.jpg)">人才招聘</td>
              </tr>
            </table></td>
            <td width="786"><table width="780" border="0" cellspacing="0" cellpadding="0" class="line">
          <tr>
            <td width="34" height="35" align="right" valign="middle"><img src="images/ti.jpg" width="26" height="35" /></td>
            <td width="726" align="left" valign="middle" style="padding-right:30px;"><span style=" float:right">您所在的位置：首页 > 人才招聘 > 招聘信息</span>
              <span class="STYLE8">人才招聘</span></td>
          </tr>
            <tr><td colspan="2" align="left"><img src="images/neiye-zx_33.jpg" width="780" height="1" /></td>
            </tr>
        </table></td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td height="811" align="left" valign="top"  style=" background:url(images/neiye_36.jpg) left repeat-y; ">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="216" align="center" valign="top"><table width="192" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center" valign="middle">	<ul class="pro_left">
            <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title from tol_co where lm=5 order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="jobs.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
          <%
    rs.movenext
	wend
	rs.close
	set rs=nothing
%><li><a href="job.asp" class="bgdw">招聘信息</a></li>
            </ul><img src="images/ny-zuo_17.jpg" /></td>
              </tr>
            </table></td>
    <td width="786" class="line">
    <div class="show">
<%
	Set rs= Server.CreateObject("ADODB.Recordset")
	sql="select *  from job  where pass='yes' and id="&request("id")&" order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
	%><TABLE width="100%" border=0 align="center" cellPadding=0 cellSpacing=0>
	  <TR>
		<TD width="18">&nbsp;</TD>
		<TD background=images/job_line_02.gif></TD>
		<TD width="19">&nbsp;</TD>
	  </TR>
	  <TR>
		<TD background=images/job_line_04.gif>&nbsp;</TD>
		<TD vAlign=top align=middle bgColor=#ffffff>
            <TABLE cellSpacing=1 cellPadding=3 width="100%" border=0 bgColor=#cccccc>
              <TR bgColor=#ffffff>
                <TD width="15%" height="30" align=right bgColor=#f3f3f3><strong>职位名称：</strong></TD>
                <TD colSpan=2 align="left"><%=rs("title")%></TD>
                <TD onmouseover="this.bgColor='#FFDDD7';" onmouseout="this.bgColor='#f3f3f3'" align=middle width="38%"><A href="job_yp.asp?job_title=<%=escape(rs("title"))%>">应聘此岗位</A></TD>
              </TR>
              <TR bgColor=#ffffff>
                <TD height="60" align=right vAlign=middle bgColor=#f3f3f3><strong>职位要求：</strong></TD>
                <TD  colSpan=3 align="left" valign="top" style="line-height:20px;"><%=rs("z_body")%></TD>
              </TR>
              <TR bgColor=#ffffff>
                <TD align=right bgColor=#f3f3f3 height=30><strong>招聘人数：</strong></TD>
                <TD width="22%" align="left"><%=rs("num")%></TD>
                <TD align=middle width="25%"  bgColor=#f3f3f3><strong>工作地点：</strong></TD>
                <TD align="left"><%=rs("address")%></TD>
              </TR>
              <TR bgColor=#ffffff>
                <TD align=right bgColor=#f3f3f3 height=30><strong>发布日期：</strong></TD>
                <TD width="22%" align="left"><%=rs("wtime")%></TD>
                <TD align=middle width="25%"  bgColor=#f3f3f3><strong>结束日期：</strong></TD>
                <TD align="left"><%=rs("etime")%></TD>
              </TR>
             </TABLE>
		</TD>
		<TD background=images/job_line_06.gif>&nbsp;</TD></TR>
	  <TR>
		<TD>&nbsp;</TD>
		<TD background=images/job_line_08.gif></TD>
		<TD>&nbsp;</TD>
      </TR>
    </TABLE>
<%end if     
   rs.close
        set rs=nothing
     %>
       
   <div class="page" style="text-align:right;"><a href="javascript:history.back();">[返回]</a></div>   </div>
    
    
    </td>
  </tr>
</table>

         
         
         </td>
      </tr>
      <tr>
        <td height="21"><img src="images/neiye_55.jpg" width="1002" height="21" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"><img src="images/lp_17.jpg" width="1002" height="1" /></td>
  </tr>
</table><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</Td></tr></table>
</body>
</html>
