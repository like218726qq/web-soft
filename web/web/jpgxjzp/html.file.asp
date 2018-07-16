<!--#include file="conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<% 
Dim fso,objfolder,objfile,strpath 
set fso=server.createobject("Scripting.FileSystemObject") 

strpath="proimg\1" 
call bl(strpath)
 
function bl(strpath) 
set objfolder=fso.getfolder(server.mappath(strpath)) 

for each objsubfolder in objfolder.subfolders 
img_sl=strpath & "\" & objsubfolder.name
title= objsubfolder.name

'lm=124
'px=100
'if title<>"GC 2001" or title<>"TEA-1155 1K起7元" or title<>"4针加厚内胆包7寸4元" then
%>

<%
'response.Write img_sl&","&title&"<br/>"  
'getfiles(img_sl)
call bl(strpath & "\" & objsubfolder.name) 
next 
End function 
%> 
<%
getfiles("proimg/7/")
function getfiles(url)
set FileSystem=server.CreateObject("scripting.filesystemobject")
folderpath=server.MapPath(url )
set sfolder=Filesystem.GetFolder(folderpath).SubFolders
for each FolderItem in sfolder
	set Files=FolderItem.Files
	for each FileItem in Files
	    temp="" & FolderItem.Name & "/" & FileItem.Name
		img_sl="proimg/7/"&temp
		
		str=FileItem.Name
		title=left(str,instrrev(str,".")-1)
		response.Write img_sl&","&title&"<br/>"
		'fname=server.MapPath(temp)
		'set File=FileSystem.OpenTextFile(fname,1,false)
		'while File.AtEndofStream <> True
			'record=split(File.Readline,"~")
		'wend
		'File.close
		'response.write(fname&"<br>")
		%>
        <%
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from pro_co "
		rs.open sql,conn,1,3
		rs.addnew()
			rs("lm")=195
			rs("title")=title
			rs("pro_guige")=pro_guige
			rs("pro_danwei")=pro_danwei
			rs("pro_color")=pro_color
			rs("pro_money")=pro_money
			rs("f_body")=f_body
			rs("z_body")=z_body
			rs("img_sl")=img_sl
			rs("hot")="no"
			rs("tuijian")="no"
			rs("pass")="yes"
			rs("read_num")=0
			rs("wtime")=now()
			rs("px")=100
		'rs.update
		response.Write"添加成功。"
		rs.close
		set rs=nothing
		
		%>
        <%
	next
next
end function
%>
