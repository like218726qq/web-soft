<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from setup where id=2 "
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
<title><%=site_title%></title>
<meta name="keywords" content="<%=site_key%>" />
<meta name="description" content="<%=site_des%>" />