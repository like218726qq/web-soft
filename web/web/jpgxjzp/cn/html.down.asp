<br/>
<style>
table tr td{ padding:3px 5px;}
</style>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=650>
	<TBODY>
		<TR bgColor="#0089">
			<TD style="color:#fff;"><STRONG>文件名称</STRONG></TD>
			<TD style="COLOR: #ffffff" ><STRONG>文件大小</STRONG></TD>
			<TD style=" COLOR: #ffffff" ><STRONG>更新时间</STRONG></TD>
			<TD style=" COLOR: #ffffff" ><STRONG>文件类型</STRONG></TD>
		</TR>
 <%
 		lm=request.QueryString("fid")
		set rs=server.CreateObject("adodb.recordset")
		if lm<>"" and isnumeric(lm) then
		  sql="select * from info_co where pass='yes' and lm="&lm&" order by px desc,id desc"
		else
		  sql="select * from info_co where pass='yes' and (lm in(select id_lm from info_lm where fid=47 ) or lm=47) order by px desc,id desc"
		end if
		'response.Write sql
		rs.open sql,conn,1,1
		if not rs.eof then
			pagenum=12
			rs.pagesize=pagenum
			counter=rs.recordcount
			pagezong=rs.pagecount
			pageno=trim(request.querystring("page"))
			if pageno="" or not isnumeric(pageno) then 
				pageno=1
			end if
			if pageno<1 then
				pageno=1
			end if
			if pageno-pagezong>0 then 
				pageno=pagezong
			end if
			rs.absolutepage=pageno
			a=1
			while not rs.eof and a<=pagenum
			img_sl=rs("img_sl")
			if img_sl="" then img_sl="default.jpg" end if
			dow_sl=rs("dow_sl")
	%>
    <% 
	fileurl=dow_sl
	file_type=""
	file_size=""
	file_updatedate=""
	set fso=CreateObject("Scripting.FileSystemObject")
	fileurl=server.mappath("../"&fileurl)
	if fso.FileExists(fileurl) then
		set Delf=Fso.GetFile(fileurl)
		file_type=Delf.type
		file_size=Delf.size
		file_updatedate=Delf.datelastmodified
	end if
	set Delf=nothing
	Set fso = nothing
%>

		<TR>
			<TD><A href="../<%=dow_sl%>" target=_blank><%=rs("title")%></A></TD>
			<TD><%=file_size%>K</TD>
			<TD><%=file_updatedate%></TD>
			<TD><%=file_type%></TD>
		</TR>
	<%	
			if a mod 4=0 then 
			end if
            a=a+1
            rs.movenext
			wend
		else	
	%>
    <td colspan="4">没有相关信息</td>
	<%
		end if	
		rs.close
		set rs=nothing
 %>       
		
        
	</TBODY>
</TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" align=left>
	<TBODY>
			<TR>
				<TD height=40 align=middle>
				<P align=center>
                <%
				if pagenum<>"" then 
				if ntype<>"" then pra="ntype="&lm
					call listpage(pra)
				end if
				%>
                 </P>
				</TD>
			</TR>
	</TBODY>
</TABLE>