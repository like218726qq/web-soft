<!--#include file="conn.asp"-->
<%
'中文网站基本配置
if not isarray(application("26hmlj_bl")) then
	set rsb=server.CreateObject("adodb.recordset")
	sql="select * from setup where id=2"
	rsb.open sql,conn,1,1
	if not rsb.eof then
		dim ying(3)
		ying(0)=rsb("site_title")
		ying(1)=rsb("site_key")
		ying(2)=rsb("site_des")
		ying(3)=rsb("site_bot")
	end if
	rsb.close
	set rsb=nothing
	application("26hmlj_bl")=ying
else
	ying=application("26hmlj_bl")
end if
%>
<title><%=ying(0)%></title>
<meta content="<%=ying(1)%>" http-equiv="keywords" />
<meta content="<%=ying(2)%>" http-equiv="description" />