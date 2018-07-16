<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'传递参数
id=request("id")
ac=request("ac")
id=replace(id," ","")
del=replace(id,",","")
w_url=request.ServerVariables("HTTP_REFERER")

if del="" or not checknum(del) or ac="" then
	call msg("参数错误","")
end if

'连接数据库
openconn

'根据ac处理操作
select case ac
	case"px"
		shu=split(id,",")
		for a=0 to ubound(shu)
			conn.execute"update tu_co set px="&request(shu(a))&" where id="&shu(a)&" "
		next
	case"ping1"
		conn.execute"update tu_co set pass='no' where id in ("&id&")"
	case"ping2"
		conn.execute"update tu_co set pass='yes' where id in ("&id&")"
	case"tuijian1"
		conn.execute"update tu_co set tuijian='no' where id in ("&id&")"
	case"tuijian2"
		conn.execute"update tu_co set tuijian='yes' where id in ("&id&")"
	case"hot1"
		conn.execute"update tu_co set hot='no' where  id in ("&id&")"
	case"hot2"
		conn.execute"update tu_co set hot='yes' where  id in ("&id&")"
	case"del"
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from tu_co where id in ("&id&")"
		rs.open sql,conn,1,3
		while not rs.eof
		
			'删除信息里的图片
			if rs("img_sl")<>"" then
				delfile("../../"&rs("img_sl"))
				delfile("../../"&mid(rs("img_sl"),1,instrrev(rs("img_sl"),"/"))&"d"&mid(rs("img_sl"),instrrev(rs("img_sl"),"/")+1))
			end if
			
			'文件
			if rs("dow_sl")<>"" and not (instr(rs("dow_sl"),"http://") or instr(rs("dow_sl"),"ftp://")) then
				delfile("../../"&rs("dow_sl"))
			end if
			
			'视频
			if rs("vid_sl")<>"" and not (instr(rs("vid_sl"),"http://") or instr(rs("vid_sl"),"ftp://")) then
				delfile("../../"&rs("vid_sl"))
			end if
			
			'删除信息
			rs.delete
			rs.update
			rs.movenext
		wend
		rs.close
		set rs=nothing
end select 

call msg("成功操作","location='"&w_url&"'")
%>