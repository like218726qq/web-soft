<!--#include file="conn.asp"-->
<% 
	id=request("id")
	b1=request("b1")
	title=request("title")
	title_lm=request("title_lm")
	z_body=request("z_body")
	z_body1=request("z_body1")
	send_zt=request("send_zt")
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select * from person where username='"&session("person")&"'"
	rsa.open sql,conn,1,3
		if rsa("xz")<1 then
			call msg("您现在的写作次数为0次，需要购买才能添加","")
		end if
	rsa.close
	set rsa=nothing
	
	
	if b1<>"" then
		'添加信息
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from pro_order_xz "
		rs.open sql,conn,1,3
		rs.addnew()
			rs("title")=title
		'	if title="" then
'				call msg("请选择写作标题","")
'			end if
			rs("person_xs")=session("person")
			rs("z_body")=z_body
			if z_body="" then
				call msg("内容不能为空","")
			end if
			z_body1=z_body
			rs("z_body1")=z_body1
			rs("wtime")=now()
			rs("send_zt")="no"
			rs("taolun")="no"
		rs.update
		rs.close
		set rs=nothing
		
		
		set rsa=server.CreateObject("adodb.recordset")
		sql="select * from person where username='"&session("person")&"'"
		rsa.open sql,conn,1,3
			rsa("xz")=rsa("xz")-1
		rsa.update
		rsa.close
		set rsa=nothing
		
		call msg("成功修改","location='write_xz.asp'")
	end if
%>
