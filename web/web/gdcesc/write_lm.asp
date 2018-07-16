<!--#include file="../inc.asp"-->
<%
lm=request("lm")
if lm<>"" and checknum(lm) then
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,px from info_co_xz where lm="&lm&" order by px desc,id desc"
	rs.open sql,conn,1,1
	response.write"<select name=""title"" id=""title""  onchange=""getbody(this.value)"" onchange=""getbody(this.value)"">"
	response.write"<option value="""" >请选择市</option>"
	while not rs.eof
		response.write"<option value="""&rs("id")&""" style=""width:280px; float:left;"">"&rs("title")&"</opton>"			
	rs.movenext
	wend
	response.write"</select>"
	rs.close
	set rs=nothing
end if
%>
