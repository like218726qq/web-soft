
	<%
	Set rs= Server.CreateObject("ADODB.Recordset")
	sql="select *  from job  where pass='yes' and lang='cn' order by px desc,id desc"
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
		<TD width="18"></TD>
		<TD background=images/job_line_02.gif></TD>
		<TD width="19"></TD>
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
		<TD></TD>
		<TD background=images/job_line_08.gif></TD>
		<TD></TD>
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

