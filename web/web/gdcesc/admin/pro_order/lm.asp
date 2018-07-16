<!--#include file="../inc.asp"-->
<%

'连接数据库
openconn
lm=request("lm")
if lm<>"" and checknum(lm) then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from person1 where dj="&lm&" order by id desc"
	rs.open sql,conn,1,1
	response.write"<select name=""person_jss"" id=""person_jss""  >"
	response.write"<option value="""" >选择教师</option>"
	while not rs.eof
		response.write"<option value="""&rs("id")&""">"&rs("rename")&"</opton>"	
	rs.movenext
	wend
	rs.close
	set rs=nothing
end if
%>