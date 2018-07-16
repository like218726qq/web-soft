<!--#include file="conn.asp"-->
<%
id=request("id")

if id<>"" and checknum(id) then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_co_xz where id="&id&" order by id desc"
	rs.open sql,conn,1,1
		if not rs.eof then
		while not rs.eof
			response.Write rs("title")
		rs.movenext
		wend
		end if
	rs.close
	set rs=nothing
end if
%>