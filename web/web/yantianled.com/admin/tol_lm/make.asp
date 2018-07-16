<!--#include file="../inc.asp"-->
<%
'验证登录
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
	'删除栏目
	case"del"
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from tol_lm where id_lm="&id&""
		rs.open sql,conn,1,3
		if not rs.eof then 
		
			'把值保存到变量中
			fid=rs("fid")
			id=rs("id_lm")
			xia=rs("xia")
			add_xx=rs("add_xx")
			
			'删除属于该栏目的信息
			conn.execute "delete from tol_co where lm="&id&""
			
			'删除子栏目
			call dellm(id)
			
			'删除当前栏目
			rs.delete 
			rs.update
		end if
		rs.close
		set rs=nothing
	
	'修改排序
	case"px"  
		shu=split(id,",")
		for a=0 to ubound(shu)
		conn.execute"update tol_lm set px="&request(shu(a))&" where id_lm="&shu(a)&" "
		next
end select

call msg("成功操作","location='default.asp'")

	
'删除子栏目和
sub dellm(id) 
	set rsa=server.CreateObject("adodb.recordset")
	sql="select * from tol_lm where fid="&id&""
	rsa.open sql,conn,1,3
	while not rsa.eof
		conn.execute "delete from tol_co where lm="&rsa("id_lm")&""
		call dellm(rsa("id_lm"))
		rsa.delete
		rsa.update
		rsa.movenext
	wend
	rsa.close
	set rsa=nothing
end sub
%>