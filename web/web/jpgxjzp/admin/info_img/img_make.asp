<!--#include file="../inc.asp"-->
<!--#include file="img_con.asp"-->
<%
id=request("id")
info_id=request("info_id")
if id="" or not checknum(id) then
	call msg("参数错误","")
end if
if info_id<>"" and not checknum(info_id) then
	call msg("参数错误","")
end if
openconn
set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_img where id="&id&""
rs.open sql,conn,1,3
if not rs.eof then
	if not isnull(rs("img_sl")) and rs("img_sl")<>"" then
		call delfile("../../"&rs("img_sl"))
		if s_pic="yes" then
			call delfile("../../"&getbpic(rs("img_sl"),"d"))
		end if
	end if
	rs.delete()
	rs.update()
end if
rs.close
set rs=nothing
closeconn
response.write "<script>location='img_add.asp?info_id="&info_id&"';</script>"
%>
