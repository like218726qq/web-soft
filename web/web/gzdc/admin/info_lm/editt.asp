<!--#include file="../inc.asp"-->
<%	
	'检查登录
	checklogin
	
	'接收传递参数
	id=html(request.Form("id"))
	fid=html(request.Form("fid"))
	title_lm=html(request.Form("title_lm"))
	px=html(request.Form("px"))
	add_xx=html(request.Form("add_xx"))
	xia=html(request.Form("xia"))
	link_url=html(request.Form("link_url"))
	info_from=html(request.Form("info_from"))
	f_body=html(request.Form("f_body"))
	z_body=html(request.Form("z_body"))
	img_sl=html(request.Form("img_sl"))
	wtime=html(request.Form("wtime"))
	s_pic=html(request.Form("s_pic"))
	s_typ=html(request.Form("s_typ"))
	s_wid=html(request.Form("s_wid"))
	s_hei=html(request.Form("s_hei"))
	dow_sl=html(request.Form("dow_sl"))
	vid_sl=html(request.Form("vid_sl"))
	
	if id="" or not checknum(id) then 
		call msg("错误参数","")
	end if

	'连接数据库
	openconn
		
	'读取原来的栏目fid
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_lm where id_lm="&id&""
	rs.open sql,conn,1,1
	if not rs.eof then
		fidd=rs("fid")
	end if
	rs.close
	set rs=nothing
	
	'所属栏目改变了就判断
	if fidd<>fid then
	
		'列出所有属于第id_lm的子栏目
		set rs=server.CreateObject("adodb.recordset")
		lm=""
		sql="select * from info_lm where fid="&id&""
		rs.open sql,conn,1,1
		while not rs.eof
			lm=rs("id_lm")&"|"&lm
			if rs("xia")="yes" then 
				call listlm(rs("id_lm"),lm)
			end if
			rs.movenext
		wend
		rs.close
		set rs=nothing
		
		sub listlm(id,lm)
			set rsa=server.CreateObject("adodb.recordset")
			sql="select * from info_lm where fid="&id&""
			rsa.open sql,conn,1,1
			while not rsa.eof
				lm=rsa("id_lm")&"|"&lm
				if rsa("xia")="yes" then 
					call listlm(rsa("id_lm"),lm)
				end if
				rsa.movenext
			wend
			rsa.close
			set rsa=nothing
		end sub
		
		'列出所有属于第id_lm的子栏目结束
		lm=lm&id
		shu=split(lm,"|")
		ind=false
		for a=0 to ubound(shu)
			if shu(a)=fid then
				ind=true
			end if
		next
			
		if ind=true then  
			call msg("当前栏目不能移动到该栏目下","location='edit.asp?id="&id&"'")
		end if
	end if
	
	'修改栏目信息
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_lm where id_lm="&id&""
	rs.open sql,conn,1,3
		rs("fid")=fid
		rs("title_lm")=title_lm
		rs("px")=px
		rs("add_xx")=add_xx
		rs("xia")=xia
		rs("link_url")=link_url
		rs("info_from")=info_from
		rs("f_body")=f_body
		rs("z_body")=z_body
		rs("img_sl")=img_sl
		rs("s_pic")=s_pic
		rs("s_typ")=s_typ
		rs("s_wid")=s_wid
		rs("s_hei")=s_hei
		rs("dow_sl")=dow_sl
		rs("vid_sl")=vid_sl
		rs("wtime")=wtime
	rs.update()
	rs.close()
	set rs=nothing

	
call msg("成功修改","location='default.asp'")
%>