<!--#include file="../inc.asp"-->
  <%
	'检查登录
	checklogin
	
	'参数传递
	id=request("id")
	ac=request("ac")
	id=replace(id," ","")
	del=replace(id,",","")
	
	if del="" or not checknum(del) or ac="" then
		call msg("参数错误","")
	end if
	
	'连接数据库
	openconn
	
	select case ac
		   case"del"
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from pro_lm2 where id_lm="&id&""
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
							delfile("../../"&getbpic(rsb("img_sl"),"d"))
						end if
						
						'删除多图
						set rsa=server.CreateObject("adodb.recordset")
						sql="select * from pro_img where pro_id="&rsb("id")&""
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
					conn.execute"update pro_lm2 set px="&request(shu(a))&" where id_lm="&shu(a)&" "
				next
			end select
	
	'操作成功
	call msg("成功操作","location='default.asp'")
	
	'删除子栏目的过程
	sub dellm(id)
		set rsa=server.CreateObject("adodb.recordset")
		sql="select * from pro_lm2 where fid="&id&""
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
					delfile("../../"&getbpic(rsk("img_sl"),"d"))
				end if
				
				'删除多图
				set rsc=server.CreateObject("adodb.recordset")
				sql="select * from pro_img where pro_id="&rsk("id")&""
				rsc.open sql,conn,1,3
				while not rsc.eof
					if rsc("img_sl")<>"" then
						call delfile("../../"&rsc("img_sl"))
						call delfile("../../"&getbpic(rsc("img_sl"),"d"))
					end if
					rsc.delete
					rsc.update
				rsc.movenext
				wend
				rsc.close
				set rsc=nothing
				
				'删除信息
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