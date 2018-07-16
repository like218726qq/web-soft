<!--#include file="conn.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>港置地产代理(深圳)有限公司桂芳园分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#fffefa">
  <tr>
    <td width="11">&nbsp;</td>
    <td width="214" valign="top">
		<!--#include file="left_job.asp"-->
		<!--#include file="left_contact.asp"-->
    </td>
    <td width="27">&nbsp;</td>
    <td width="737" valign="top"><table width="737" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:28px;">
      <tr>
         <td style="background:url(images/pro_06.jpg); width:715px; height:23px; color:#a18307; font-size:14px; font-weight:bold; padding:6px 0 0 22px;" valign="middle"> 职位招聘</td>
      </tr>
      <tr>
        <td style="line-height:26px; padding:10px 5px; color:464646; font-weight:500;">
          	<%
				Set rs= Server.CreateObject("ADODB.Recordset")
				sql="select *  from job  where pass='yes' order by px desc,id desc"
				rs.open sql,conn,1,1
				if not rs.eof then
					pagenum=5
					rs.pagesize=pagenum
					counter=rs.recordcount
					pagezong=rs.pagecount
					pageno=replace(trim(request.querystring("page")),"'","")
					if pageno="" or not isnumeric(pageno) then 
						pageno=1
					end if
					if pageno<1 then
						pageno=1
					end if
					if pageno-pagezong>0 then 
						pageno=pagezong
					end if
					pageno=clng(pageno)
					rs.absolutepage=pageno
					a=1
				while not rs.eof and a<=pagenum
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
							<TD align=right width="15%" bgColor=#f3f3f3><strong>职位名称：</strong></TD>
							<TD colSpan=2 align="left"><%=rs("title")%></TD>
							<TD onmouseover="this.bgColor='#FFDDD7';" onmouseout="this.bgColor='#f3f3f3'" align=middle width="24%"><A href="job_yp.asp?job_title=<%=escape(rs("title"))%>">应聘此岗位</A></TD></TR>
						  <TR bgColor=#ffffff>
							<TD height="60" align=right vAlign=top bgColor=#f3f3f3><strong>职位要求：</strong></TD>
							<TD  colSpan=3 align="left" valign="top" style="line-height:20px; "><%=rs("z_body")%></TD>
						  </TR>
						  <TR bgColor=#ffffff>
							<TD align=right bgColor=#f3f3f3 height=18><strong>招聘人数：</strong></TD>
							<TD width="45%" align="left"><%=rs("num")%></TD>
							<TD align=middle width="16%"  bgColor=#f3f3f3><strong>工作地点：</strong></TD>
							<TD align="left"><%=rs("address")%></TD>
						  </TR>
						  <TR bgColor=#ffffff>
							<TD align=right bgColor=#f3f3f3 height=18><strong>发布日期：</strong></TD>
							<TD width="45%" align="left"><%=rs("wtime")%></TD>
							<TD align=middle width="16%"  bgColor=#f3f3f3><strong>结束日期：</strong></TD>
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
					a=a+1
					rs.movenext
					wend
					rs.close
					set rs=nothing
				 %>
				<br>
				<TABLE width="98%" border=0 align="center" cellPadding=1 cellSpacing=1 bgColor=#CCCCCC>
				  <TR>
					<TD align=middle bgColor="#f4f4f4"><%call listpage(key) %></TD>
				  </TR>
				</TABLE>
				<%
				end if
				%>
        </td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="botton.asp"-->
</body>
</html>
