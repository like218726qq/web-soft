<!--#include file="conn.asp"-->
<%
id=trim(request("id"))
if id="" or not isnumeric(id) then
	call msg("参数错误","")
end if
set rs=server.CreateObject("adodb.recordset")
sql="select * from info_co where id="&id&" and pass='yes' order by px desc,id desc"
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在或已删除","")
else
	rs("read_num")=rs("read_num")+1
	rs.update()
	fname=rs("dow_sl")
	fname=replace(server.MapPath(fname),"\","/")
	set fso=CreateObject("Scripting.FileSystemObject")
	if not fso.FileExists(fname) then
		call msg("文件不存在","")
	else
		filename=mid(fname,instrrev(fname,"/")+1)
		Set objAdoStream=Server.createObject("ADODB.Stream") 
		objAdoStream.Type=1 
		objAdoStream.open() 
		objAdoStream.LoadFromFile(fname) 
		strchar=objAdoStream.Read() 
		fsize=objAdoStream.size 
		objAdoStream.Close() 
		Set objAdoStream=nothing
		Response.AddHeader "content-type","application/x-msdownload" 
		response.AddHeader "Content-Disposition","attachment;filename=" & filename
		Response.AddHeader "content-length", fsize
		Response.BinaryWrite(strchar) 
		Response.Flush()
	end if
end if
rs.close
set rs=nothing
%>
