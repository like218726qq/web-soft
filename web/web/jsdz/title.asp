<!--#include file="conn.asp"--> 
<%
	set rs=server.createobject("adodb.recordset") 
	sql="select * from setup where id=1"
	rs.open sql,conn,1,1
		if not rs.eof then 
			webname=rs("site_title")
			title=rs("site_title")
			Keyword=rs("site_key")
			descriptions=rs("site_des")
		end if
	rs.close
%>
<title><%=WebName%></title>
<meta name="Keywords" content="<%=Keyword%>" />
<meta name="description" content="<%=descriptions%>" />