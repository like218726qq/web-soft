<!--#include file="../admin/inc.asp"-->
<%
'连接数据库
opconn


'中文网站基本配置
set rsb=server.CreateObject("adodb.recordset")
	sql="select * from setup where id=2"
	rsb.open sql,conn,1,1
	if not rsb.eof then
		ying0=rsb("site_title")
		ying1=rsb("site_key")
		ying2=rsb("site_des")
	end if
	rsb.close
	set rsb=nothing




%>