<!--#include file="../admin/inc.asp"-->
<%
'连接数据库
opconn

	pagnum=9
	sub listpage_num(pra)
		htm = "<div class=""pages""><ul>"
		if pageno>1 then
			htm = htm & "<li><a href=""?page="&pageno-1&pra&""" >Anterior</a></li>"
		else
			htm = htm & "<li class=""nolink"">Anterior</li>"
		end if
		
		if pagnum mod 2 = 0 then
			step2 = pagnum / 2
			step1 = step2 - 1
		else
			step1 = int(pagnum / 2)
			step2 = step1
		end if
		p_start = pageno - step1
		p_end = pageno + step2
		s_str = "<li><a href=""?page=1"&pra&""">1...</a></li>"
		e_str = "<li><a href=""?page="&pagezong&pra&""">..."&pagezong&"</a></li>"
		if pagezong <= pagnum or pagezong <= step2 then
			p_start = 1
			p_end = pagezong
			s_str = ""
			e_str = ""
		else
			if p_start <= 1 then
				s_str = ""
				p_start = 1
				p_end = pagnum
			end if
			if p_end >= pagezong then
				p_end = pagezong
				p_start = pagezong - pagnum + 1
				e_str = ""
			end if
		end if
		htm = htm & s_str
		for i = p_start to p_end
			if i = pageno then
				htm = htm & "<li class=""current"">"&i&"</li>"
			else
				htm = htm & "<li><a href=""?page="&i&pra&""">"&i&"</a></li>"
			end if
		next
		htm = htm & e_str
		
			if pageno<>pagezong then
				htm = htm &"<li><a href=""?page="&pageno+1&pra&""">Próximo</a></li>"
			else
				htm = htm &"<li class=""nolink"">Próximo</li>"
			end if
		htm = htm &"</ul><div class=""p_clear""></div></div>"
		response.write htm
	end sub
	
	'普通分页
	sub listpage(key)
		listp=listp&"<TABLE cellSpacing=0 cellPadding=0  align=center border=0 style='color:#666666' ><TR>"&chr(10)
		listp=listp&"<TR>"&chr(10)
		listp=listp&"<TD >Page<font color='#ff0000'>"&pageno&"</font>|Total<font color='#ff0000'>"&pagezong&"</font>Page|<font color='#ff0000'>"&pagenum&"</font>Item/Page|Total<font color='#ff0000'>"&counter&"</font>Item</td>"&chr(10)
		listp=listp&"<td width='100'>&nbsp;</td>"&chr(10)
		listp=listp&"<td>"
		if pageno=1 then
		listp=listp&"[&nbsp;Home&nbsp;][&nbsp;Previous&nbsp;]&nbsp;"
		else
		listp=listp&"[&nbsp;<a href='?page=1"&key&"'>Home</a>&nbsp;][&nbsp;<a href='?page="&pageno-1&key&"'>Previous</a>&nbsp;]&nbsp;"       
		end if
		if cint(pageno)=cint(pagezong) then
		listp=listp&"[&nbsp;Next&nbsp;][&nbsp;Last&nbsp;]"
		else
		listp=listp&"[&nbsp;<a href='?page="&pageno+1&key&"'>Next</a>&nbsp;][&nbsp;<a href='?page="&pagezong&key&"'>Last</a>&nbsp;]"        
		end if 
		listp=listp&"</td>"&chr(10)
		listp=listp&"<td width='10'></td>"&chr(10)
		listp=listp&"</tr>"&chr(10)
		listp=listp&"</table>"&chr(10)
		response.write listp
	end sub

'中文网站基本配置
'if not isarray(application("setup")) then
	set rsb=server.CreateObject("adodb.recordset")
	sql="select * from setup where id=1"
	rsb.open sql,conn,1,1
	if not rsb.eof then
		dim zhong(3)
		zhong(0)=rsb("site_title")
		zhong(1)=rsb("site_key")
		zhong(2)=rsb("site_des")
		zhong(3)=rsb("site_bot")
	end if
	rsb.close
	set rsb=nothing
	'application("setup")=zhong
'else
	'zhong=application("setup")
'end if
%>