<!--#include file="conn.asp"-->
<%
'中文网站基本配置
if not isarray(application("26jcgj_cn")) then
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
	application("26jcgj_cn")=zhong
else
	zhong=application("26jcgj_cn")
end if
%>
<title><%=zhong(0)%></title>
<meta name="keywords" content="<%=zhong(1)%>" />
<meta name="description" content="<%=zhong(2)%>" />