<!--#include file="../inc.asp"-->
<%	
	'检查登录
	checklogin
	
	'禁止站外提交
	checkpost
	
	'接收传递参数
	id=bhtml(request.Form("id"))
	fid=bhtml(request.Form("fid"))
	title_lm=bhtml(request.Form("title_lm"))
	px=bhtml(request.Form("px"))
	add_xx=bhtml(request.Form("add_xx"))
	xia=bhtml(request.Form("xia"))
	uselink=bhtml(request.Form("uselink"))
	info_from=bhtml(request.Form("info_from"))
	f_body=bhtml(request.Form("f_body"))
	z_body=bhtml(request.Form("z_body"))
	img_sl=bhtml(request.Form("img_sl"))
	wtime=bhtml(request.Form("wtime"))
	s_pic=bhtml(request.Form("s_pic"))
	s_typ=bhtml(request.Form("s_typ"))
	s_wid=bhtml(request.Form("s_wid"))
	s_hei=bhtml(request.Form("s_hei"))

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
	conn.execute("update info_lm set fid="&fid&",title_lm='"&title_lm&"',px="&px&",add_xx='"&add_xx&"',xia='"&xia&"',uselink='"&uselink&"',info_from='"&info_from&"',f_body='"&f_body&"',z_body='"&z_body&"',img_sl='"&img_sl&"',wtime='"&wtime&"',s_pic='"&s_pic&"',s_typ='"&s_typ&"',s_wid='"&s_wid&"',s_hei='"&s_hei&"' where id_lm="&id&"")

	
call msg("成功修改","location='default.asp'")
%>