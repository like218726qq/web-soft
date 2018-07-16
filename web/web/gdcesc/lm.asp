<!--#include file="conn.asp"-->
<%
lm=request("lm")
if lm<>"" and checknum(lm) then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_co_xz where lm="&lm&" order by px desc,id desc"
	rs.open sql,conn,1,1
	response.write"<select name=""title"" id=""title""  onchange=""getbody(this.value)"">"
	response.write"<option value="""" >请选课题</option>"
	while not rs.eof
		response.write"<option value="""&rs("id")&""">"&rs("title")&"</opton>"	

	rs.movenext
	wend
	response.write"</select>"
	rs.close
	set rs=nothing
end if
%>