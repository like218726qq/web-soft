<!--#include file="../admin/inc.asp"-->
<%
'连接数据库
opconn


'网站关键字，描述
	set rsb=server.CreateObject("adodb.recordset")
	sql="select * from setup where id=1"
	rsb.open sql,conn,1,1
	if not rsb.eof then
		zhong0=rsb("site_title")
		zhong1=rsb("site_key")
		zhong2=rsb("site_des")
	end if
	rsb.close
	set rsb=nothing

%>