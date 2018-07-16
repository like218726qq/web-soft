<!--#include file="../inc.asp"-->
  <%
  
	'禁止外部提交
	checkpost
	
	'参数传递
	id=request("id")
	ac=request("ac")
	id=replace(id," ","")
	del=replace(id,",","")
	
	if del="" or not isnumeric(del) or ac="" then
		call msg("参数错误",";")
	end if
	
	'连接数据库
	openconn
	
	select case ac
		   case"del"
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from pro_lm where id_lm="&id&""
				rs.open sql,conn,1,3
				if not rs.eof then 
					
					'删除属于该栏目的信息和该信息的图片
					set rsb=server.CreateObject("adodb.recordset")
					sql="select * from pro_co where lm="&rs("id_lm")&""
					rsb.open sql,conn,1,3
					while not rsb.eof
						'删除该信息的文件
						if rsb("img_sl")<>"" then
							delfile("../../"&rsb("img_sl"))
							delfile("../../"&mid(rsb("img_sl"),1,instrrev(rsb("img_sl"),"/"))&"d"&mid(rsb("img_sl"),instrrev(rsb("img_sl"),"/")+1))
						end if
						rsb.delete
						rsb.update
						rsb.movenext
					wend
					rsb.close
					set rsb=nothing
					
					'删除所有属于该栏目的下级栏目
					call dellm(rs("id_lm"))
					
					'删除当前栏目
					rs.delete 
					rs.update
				end if
				rs.close
				set rs=nothing

			case"px"
				shu=split(id,",")
				for a=0 to ubound(shu)
					conn.execute"update pro_lm set px="&request(shu(a))&" where id_lm="&shu(a)&" "
				next
			end select
	
	'操作成功
	call msg("成功操作","parent.location.reload(1);")
	
	'删除子栏目的过程
	sub dellm(id)
		set rsa=server.CreateObject("adodb.recordset")
		sql="select * from pro_lm where fid="&id&""
		rsa.open sql,conn,1,3
		while not rsa.eof
		
			'删除属于该栏目的信息和该信息的图片
			set rsk=server.CreateObject("adodb.recordset")
			sql="select * from pro_co where lm="&rsa("id_lm")&""
			rsk.open sql,conn,1,3
			while not rsk.eof
				'删除该信息的文件
				if rsk("img_sl")<>"" then
					delfile("../../"&rsk("img_sl"))
					delfile("../../"&mid(rsk("img_sl"),1,instrrev(rsk("img_sl"),"/"))&"d"&mid(rsk("img_sl"),instrrev(rsk("img_sl"),"/")+1))
				end if
				rsk.delete
				rsk.update
				rsk.movenext
			wend
			rsk.close
			set rsk=nothing
			
			'删除所有属于该栏目的下级栏目
			call dellm(rsa("id_lm"))
			
			'删除当前栏目
			rsa.delete
			rsa.update
			rsa.movenext
		wend
		rsa.close
		set rsa=nothing
	end sub
%>