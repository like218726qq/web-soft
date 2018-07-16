<!--#include file="../inc.asp"-->
<%	
	'验证登录情况
	checklogin
	
	'接收传递参数
	id=html(request.Form("id"))
	fid=html(request.Form("fid"))
	title_lm=html(request.Form("title_lm"))
	img_sl=html(request.Form("img_sl"))
	add_xx=html(request.Form("add_xx"))
	xia=html(request.Form("xia"))
	px=html(request.Form("px"))
	
	'验证提交数据
	if id="" or not checknum(id) or title_lm="" or px="" or not checknum(px) then
		call msg("带*号的必须填写","")
	end if
	
	'连接数据库
	openconn
	
	'读取原来的分类fid
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_lm where id_lm="&id&""
	rs.open sql,conn,1,1
	if not rs.eof then
		fidd=rs("fid")
	end if
	rs.close
	set rs=nothing
	
	'所属分类改变了就判断
	if fidd<>fid then
	
		'列出所有属于第id的子分类
		set rs=server.CreateObject("adodb.recordset")
		lm=""
		sql="select * from pro_lm where fid="&id&""
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
		
		sub listlm(id_lm,lm)
		set rsa=server.CreateObject("adodb.recordset")
		sql="select * from pro_lm where fid="&id_lm&""
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
		
		'列出所有属于第id_lm的子分类结束
		lm=lm&id
		shu=split(lm,"|")
		ind=false
		for a=0 to ubound(shu)
			if shu(a)=fid then
				ind=true
				exit for
			end if
		next
		if ind=true then 
		call msg("当前分类不能移动到该分类下","location='edit.asp?id="&id&"'")
		end if
	end if
	
	'修改分类信息
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_lm where id_lm="&id&""
	rs.open sql,conn,1,3
		rs("fid")=fid
		rs("title_lm")=title_lm
		rs("add_xx")=add_xx
		rs("img_sl")=img_sl
		rs("xia")=xia
		rs("px")=px
	rs.update()
	rs.close()
	set rs=nothing
	
call msg("成功修改","location='default.asp'")
%>