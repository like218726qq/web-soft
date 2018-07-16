<% 
	fileurl=dow_sl
	file_type=""
	file_size=""
	file_updatedate=""
	set fso=CreateObject("Scripting.FileSystemObject")
	fileurl=server.mappath(fileurl)
	if fso.FileExists(fileurl) then
		set Delf=Fso.GetFile(fileurl)
		file_type=Delf.type
		file_size=Delf.size
		file_updatedate=Delf.datelastmodified
	end if
	set Delf=nothing
	Set fso = nothing
%>
<table width=100% border=0 cellspacing=0 cellpadding=0 style="border:#B7CDF2 1px solid">
<tr>
	<td width="80%" >
		<table width="100%" border=0 cellspacing=0 cellpadding=0>
			<tr>
				<td height=30 width=80 bgcolor=#0089CA style="border-bottom:#B7CDF2 1px solid;color:#ffffff;font-weight:600">&nbsp;文件名称</td>
				<td style="padding-left:10px;border-bottom:#B7CDF2 1px solid" align=left><%=title%></td>
			</tr>
			<tr>
				<td height=30 style="border-bottom:#B7CDF2 1px solid;color:#ffffff;font-weight:600" bgcolor=#0089CA>&nbsp;文件大小</td>
				<td style="padding-left:10px;border-bottom:#B7CDF2 1px solid" align=left><%=file_size%>K</td>
			</tr>
			<tr>
				<td height=30 style="border-bottom:#B7CDF2 1px solid;color:#ffffff;font-weight:600" bgcolor=#0089CA>&nbsp;文件类型</td>
				<td style="padding-left:10px;border-bottom:#B7CDF2 1px solid" align=left><%=file_type%></td>
			</tr>
			<tr>
				<td height=30 style="border-bottom:#B7CDF2 1px solid;color:#ffffff;font-weight:600" bgcolor=#0089CA>&nbsp;上传时间</td>
				<td style="padding-left:10px;border-bottom:#B7CDF2 1px solid" align=left><%=wtime%></td>
			</tr>
			<tr>
				<td height=30  bgcolor=#0089CA style="color:#ffffff;font-weight:600">&nbsp;更新时间</td>
				<td style="padding-left:10px;" align=left><%=file_updatedate%></td>
			</tr>
		</table>
	</td>
	<td width=20% bgcolor=#ffffff align=center style="border-left:#B7CDF2 1px solid;">
		<a href="<%=dow_sl%>" target=_blank><img src=images/download15.gif border=0 /></a>
		<br/>
		<a href="<%=dow_sl%>" target=_blank>立即下载</a>
	</td>
</tr>
</table>