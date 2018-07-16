<!--#include file="admin/inc.asp"-->
<%
'连接数据库
opconn

set rs=server.createobject("adodb.recordset")
sql="select * from setup where id=1"
rs.open sql,conn,1,1
if not rs.eof then
  site_title=rs("site_title")
  site_key=rs("site_key")
  site_des=rs("site_des")
  site_bot=rs("site_bot")
end if
rs.close
set rs=nothing
%>