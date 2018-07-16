<!--#include file="conn.asp"-->
<%
'中文网站基本配置
if not isarray(application("26lptx")) then
	set rsb=server.CreateObject("adodb.recordset")
	sql="select * from setup where id=1"
	rsb.open sql,conn,1,1
	if not rsb.eof then
		dim zhong(3)
		zhong(0)=rsb("site_title")
		zhong(1)=rsb("site_key")
		zhong(2)=rsb("site_des")
		zhong(3)=rsb("site_bot")
	end if
	rsb.close
	set rsb=nothing
	application("26lptx")=zhong
else
	zhong=application("26lptx")
end if
%>
<title><%=zhong(0)%></title>
<meta content="<%=zhong(1)%>" http-equiv="keywords" />
<meta content="<%=zhong(2)%>" http-equiv="description" />