<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'参数传递
id=request("id")
ac=request("ac")
id=replace(id," ","")
del=replace(id,",","")
w_url=request.ServerVariables("HTTP_REFERER")

if del="" or not checknum(del) or ac="" then
	call msg("参数错误",";")
end if

'连接数据库
openconn

'根据ac处理操作
select case ac
		case"px"
			shu=split(id,",")
			for a=0 to ubound(shu)
				conn.execute"update pro_co1 set px="&request(shu(a))&" where id="&shu(a)&" "
			next
		case"ping1"
			conn.execute"update pro_co1 set pass='no' where id in ("&id&")"
		case"ping2"
			conn.execute"update pro_co1 set pass='yes' where id in ("&id&")"
		case"tuijian1"
			conn.execute"update pro_co1 set tuijian='no' where id in ("&id&")"
		case"tuijian2"
			conn.execute"update pro_co1 set tuijian='yes' where id in ("&id&")"
		case"hot1"
			conn.execute"update pro_co1 set hot='no' where  id in ("&id&")"
		case"hot2"
			conn.execute"update pro_co1 set hot='yes' where  id in ("&id&")"
		case"del"
			set rs=server.CreateObject("adodb.recordset")
			sql="select * from pro_co1 where id in ("&id&")"
			rs.open sql,conn,1,3
			while not rs.eof
			
				'删除信息里的图片
				if rs("img_sl")<>"" then
					delfile("../../"&rs("img_sl"))
					delfile("../../"&getbpic(rs("img_sl"),"d"))
				end if
				
				'删除多图
				set rsa=server.CreateObject("adodb.recordset")
				sql="select * from pro_img where pro_id="&rs("id")&""
				rsa.open sql,conn,1,3
				while not rsa.eof
					if rsa("img_sl")<>"" then
						call delfile("../../"&rsa("img_sl"))
						call delfile("../../"&getbpic(rsa("img_sl"),"d"))
					end if
					rsa.delete
					rsa.update
				rsa.movenext
				wend
				rsa.close
				set rsa=nothing
				
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