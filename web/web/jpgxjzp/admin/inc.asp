<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%  Session.CodePage=65001
    Response.CharSet = "utf-8" 
	
	dim conn
	'后台master里的文件夹里连接数据库
	sub openconn()
		set conn=server.createobject("adodb.connection")
		connstr="DBQ="+server.mappath("../root.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
		connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+server.mappath("../root.asp")
		connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+server.mappath("../root.asp.mdb")
		conn.open connstr 
	end sub
	
	'后台master里的文件连接数据库(不包括master里的文件夹)
	sub opeconn()
		set conn=server.createobject("adodb.connection")
		connstr="DBQ="+server.mappath("root.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
		connstr="DBQ="+server.mappath("root.asp.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
		conn.open connstr 
	end sub
	
	'前台文件连接数据库(master外面的文件)
	sub opconn()
		set conn=server.createobject("adodb.connection")
		connstr="DBQ="+server.mappath("admin/root.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
		connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+server.mappath("admin/root.asp")
		connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+server.mappath("admin/root.asp.mdb")
		conn.open connstr 
	end sub
	sub openenconn()
		set conn=server.createobject("adodb.connection")
		connstr="DBQ="+server.mappath("admin/root.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
		connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+server.mappath("../admin/root.asp")
		connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+server.mappath("../admin/root.asp.mdb")
		'response.Write connstr
		conn.open connstr 
	end sub
	'关闭数据库
	sub closeconn()
		if isobject(conn) then
			if conn.state=1 then
				conn.close
			end if
			set conn=nothing
		end if
	end sub
	
	'弹出式信息
	sub msg(content1,content2)
		closeconn
		if content1<>"" then
			if content2<>"" then
				response.write"<script>alert('"&content1&"');"&content2&"</script>"
			else
				response.write"<script>alert('"&content1&"');history.back();</script>"
			end if
		else
			if content2<>"" then
				response.write"<script>"&content2&"</script>"
			else
				response.write"<script>history.back();</script>"
			end if
		end if
		response.End()
	end sub
	
	'以html方式编码字符函数=====================================
	function html(fString)
		if fString<>"" then
			fString = replace(fString,">","&gt;")
			fString = replace(fString,"<","&lt;")
			fString = replace(fString,chr(32)&chr(32),"&nbsp;&nbsp;")
			fString = replace(fString,chr(34),"&quot;")
			fString = replace(fString,chr(39),"&rsquo;")
			fString = replace(fString,chr(10),"<br>")'一个换行
		end if
		html = fString
	end function 
		
		
	'rehtml还原字符函数===============================================
	function rehtml(fString)
		if fString<>"" then
			fString = replace(fString,"&gt;",">")
			fString = replace(fString,"&lt;","<")
			fString = replace(fString,"&nbsp;",chr(32))
			fString = replace(fString,"&quot;",chr(34))
			fString = replace(fString,"&rsquo;",chr(39))
			fString = replace(fString,"<br>",chr(10))
		end if
		rehtml = fString
	end function
	
	'防止sql注入
	function bsql(str)
		if str<>"" then
			str=replace(str,"'","&#39;")
			str=replace(str,chr(34),"&quot;")
			str=replace(lcase(str)," select ","&nbsp;select&nbsp;")
			str=replace(lcase(str)," update ","&nbsp;update&nbsp;")
			str=replace(lcase(str)," delete ","&nbsp;delete&nbsp;")
			str=replace(lcase(str)," insert ","&nbsp;union&nbsp;")
			str=replace(lcase(str)," or ","&nbsp;or&nbsp;")
			str=replace(lcase(str)," and ","&nbsp;and&nbsp;")
			str=replace(lcase(str)," union ","&nbsp;union&nbsp;")
		end if
		bsql=str
	end function
	
	'得到真正的ip地址
	Function GetIP()
		Dim sIP
		If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then
			sIP = Request.ServerVariables("REMOTE_ADDR")
		ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then
			sIP = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1)
		ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then
			sIP = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1)
		Else
			sIP = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
		End If
		GetIP = CheckIP(sIP)
		If sIP = "" Then sIP = "0.0.0.0"
	End Function
	
	Function CheckIP(sIP)
		sIP=Trim(sIP)
		sIP=Replace(sIP,".",",")
		sIP=ChkIDs(sIP)
		If sIP<>"" Then sIP=Replace(sIP,",",".")
		CheckIP=sIP
	End Function
	
	Function ChkIDs(byval sIDs)
		Dim aIDs,i,sReturn
		sIDs=Trim(sIDs)
		If Len(sIDs)=0  Then Exit Function
		aIDs=Split(sIDs,",")
		For i=0 To Ubound(aIDs)
			'发现任意不符合的字符，直接跳出
			If Not IsNumeric(aIDs(i)) Then
				Exit Function
			Else
				sReturn=sReturn & "," & CLng (aIDs(i))
			End If
		Next
		If Left(sReturn,1)="," Then sReturn=Right(sReturn,Len(sReturn)-1)
		ChkIDs=sReturn
		sReturn=""
	End Function

	'删除文件
	sub delfile(fileurl)
		if fileurl<>"" then
			set fso=CreateObject("Scripting.FileSystemObject")
			fileurl=server.mappath(fileurl)
			if fso.FileExists(fileurl) then
				set Delf=Fso.GetFile(fileurl)
				Delf.delete
			end if
			set Delf=nothing
			Set fso = nothing
		end if
	end sub
	
	'检查非法字符
	function feifa(str)
		ind=false
		ll=len(str)
		string1="abcdefghijklmnopqrstuvwxyz0123456789-_"
		for i=1 to ll
		dange=mid(str,i,1)
		if instr(string1,dange)=0 then
		ind=true
		exit for
		end if
		next
		feifa=ind
	end function
	
	'截取字符长度函数
	function getstr(restr,ll)
		restr=rehtml(restr)
		relen=len(restr)
		if restr<>"" and relen>ll\2 then
			k=0
			for i=1 to relen
				dange=ascw(mid(restr,i,1))
				if dange<0 or dange>255 then
					k=k+2
				else
					k=k+1
				end if
				if k>=ll then exit for end if
			next
			if i<relen then
				restr=left(restr,i)
			end if
		end if
		getstr=html(restr)
	end function
	
	'普通分页
	sub listpage(key)
		listp=listp&"<TABLE cellSpacing=0 cellPadding=0  align=center border=0 style='color:#666666;'><TR>"&chr(10)
		listp=listp&"<TR>"&chr(10)
		listp=listp&"<TD>第<font color='#ff0000'>"&pageno&"</font>页|共<font color='#ff0000'>"&pagezong&"</font>页|<font color='#ff0000'>"&pagenum&"</font>项/页|共<font color='#ff0000'>"&counter&"</font>项</td>"&chr(10)
		listp=listp&"<td width='100'>&nbsp;</td>"&chr(10)
		listp=listp&"<td>"
		if pageno=1 then
		listp=listp&"[首页][上一页]&nbsp;"
		else
		listp=listp&"[<a href='?page=1"&key&"'>首页</a>][<a href='?page="&pageno-1&key&"'>上一页</a>]&nbsp;"       
		end if
		if cint(pageno)=cint(pagezong) then
		listp=listp&"[下一页][尾页]"
		else
		listp=listp&"[<a href='?page="&pageno+1&key&"'>下一页</a>][<a href='?page="&pagezong&key&"'>尾页</a>]"        
		end if 
		listp=listp&"</td>"&chr(10)
		listp=listp&"<td width='10'></td>"&chr(10)
		listp=listp&"<td><input type='text' name='pagee' id='pagee' maxlength='6' style='width:35px;BORDER: #aacbe1 1px solid; font-size:12px;' value='"&pageno&"'></td><td width='5'></td>"&chr(10)
		listp=listp&"<td ><input type='button' name='buttonn' value='转到' onclick=""location='?page='+document.getElementById('pagee').value+'"&key&"'"" style='BORDER: #aacbe1 1px solid; font-size:12px;'></td>"&chr(10)
		listp=listp&"</tr>"&chr(10)
		listp=listp&"</table>"&chr(10)
		response.write listp
	end sub
	'普通分页
	sub listpage_en(key)
		listp=listp&"<TABLE cellSpacing=0 cellPadding=0  align=center border=0 style='color:#666666' ><TR>"&chr(10)
		listp=listp&"<TR>"&chr(10)
		listp=listp&"<TD>NO:<font color='#ff0000'>"&pageno&"</font>Page|Total:<font color='#ff0000'>"&pagezong&"</font>Page|<font color='#ff0000'>"&pagenum&"</font>Record/Page|Total:<font color='#ff0000'>"&counter&"</font>Record</td>"&chr(10)
		listp=listp&"<td width='100'>&nbsp;</td>"&chr(10)
		listp=listp&"<td>"
		if pageno=1 then
		listp=listp&"[Home][Pre]&nbsp;"
		else
		listp=listp&"[<a href='?page=1"&key&"'>Home</a>][<a href='?page="&pageno-1&key&"'>Pre</a>]&nbsp;"       
		end if
		if cint(pageno)=cint(pagezong) then
		listp=listp&"[Next][End]"
		else
		listp=listp&"[<a href='?page="&pageno+1&key&"'>Next</a>][<a href='?page="&pagezong&key&"'>End</a>]"        
		end if 
		listp=listp&"</td>"&chr(10)
		listp=listp&"<td width='10'></td>"&chr(10)
		listp=listp&"<td><input type='text' name='pagee' id='pagee' maxlength='6' style='width:35px;BORDER: #aacbe1 1px solid; font-size:12px;' value='"&pageno&"'></td><td width='5'></td>"&chr(10)
		listp=listp&"<td ><input type='button' name='buttonn' value='TO' onclick=""location='?page='+document.getElementById('pagee').value+'"&key&"'"" style='BORDER: #aacbe1 1px solid; font-size:12px;'></td>"&chr(10)
		listp=listp&"</tr>"&chr(10)
		listp=listp&"</table>"&chr(10)
		response.write listp
	end sub
	'数字分页
	%>
    <style>
.pages {font-family:Verdana;font-size:12px; line-height:normal; margin:10px 0 10px;}
.pages ul{list-style:none;margin:0px;padding:0px;}
.pages li {float:left;margin:0 5px 0 0;display:block; background-color:#FFFFFF;white-space:nowrap;}
.pages li a {float:left;color:#333;padding:1px 5px 2px 5px;border:1px solid #ddd;text-decoration:none;}
.pages li a:hover {color:#000;background:#f2f2f2;border:1px solid #999;}
.pages li.current {color:#000;border:1px solid #f2f2f2;padding:1px 5px 2px;background:#f2f2f2;}
.pages li.nolink {color:#999;border:1px solid #F0F0F0;padding:1px 5px 2px;}
.p_clear{ clear:both;}
</style>
    <%
	pagnum=9
	sub listpage_num(pra)
		
		htm = "<div class=""pages"" id='pagelist'><ul>"
		if pageno>1 then
			htm = htm & "<li><a href=""?page="&pageno-1&pra&""" >上一页</a></li>"
		else
			htm = htm & ""
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
				htm = htm & "<li><a class=""current"">&nbsp;"&i&"&nbsp;</a></li>"
			else
				htm = htm & "<li><a href=""?page="&i&pra&""">&nbsp;"&i&"&nbsp;</a></li>"
			end if
		next
		htm = htm & e_str
		
			if pageno<>pagezong then
				htm = htm &"<li><a href=""?page="&pageno+1&pra&""">下一页</a></li>"
			else
				htm = htm &""
			end if
		htm = htm &"<div class=""p_clear""></div></ul></div>"
		if pagezong=1 then htm="" end if
		response.write htm
	end sub
	'''
	'数字分页
	pagnum=9
	sub listpage_num_en(pra)
		htm = "<div class=""pages"" id='pagelist'><ul>"
		if pageno>1 then
			htm = htm & "<li><a href=""?page="&pageno-1&pra&""" >previous</a></li>"
		else
			htm = htm & ""
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
				htm = htm & "<li><a class=""current"">"&i&"</a></li>"
			else
				htm = htm & "<li><a href=""?page="&i&pra&""">"&i&"</a></li>"
			end if
		next
		htm = htm & e_str
		
			if pageno<>pagezong then
				htm = htm &"<li><a href=""?page="&pageno+1&pra&""">next</a></li>"
			else
				htm = htm &""
			end if
		htm = htm &"<div class=""p_clear""></div></ul></div>"
		if pagezong=1 then htm="" end if
		response.write htm
	end sub
	'检查后台首页的登陆是否登陆
	sub checklogin_default()
		if session("pyadmin")<>"" and session("yzpysm")="#@yz123pysm@#" then 
			response.write"<script>location='system.asp';</script>"
			response.End()
		end if
	end sub
	
	'检查其他地方登陆
	sub checklogin
		if session("pyadmin")="" or session("yzpysm")<>"#@yz123pysm@#" then 
			Response.CharSet = "utf-8" 
			response.write"<script>alert('未登录或登录已超时');location='../default.asp';</script>"
			response.End()
		end if
	end sub
	
	'检查其他地方登陆
	sub chklogin
		if session("pyadmin")="" or session("yzpysm")<>"#@yz123pysm@#" then 
			Response.CharSet = "utf-8" 
			response.write"<script>alert('未登录或登录已超时');location='default.asp';</script>"
			response.End()
		end if
	end sub
	
	'获取大图地址
	function getbpic(surl,dicon)
		if surl<>"" then
			getbpic=mid(surl,1,instrrev(surl,"/"))&dicon&mid(surl,instrrev(surl,"/")+1)
		end if
	end function
	
	'验证是否是数字，采用正则表达式
	function checknum(str)
		if str<>"" then
			Set regEx = New RegExp
			regEx.Pattern ="^[0-9]+$"
			regEx.IgnoreCase = false
			regEx.Global = True
			checknum=regEx.test(str)
		end if
	end function
	
	'格式日期
	function formatdate(str)
		if str<>"" then
			formatdate=year(str)&"-"&right("0"&month(str),2)&"-"&right("0"&day(str),2)
		end if
	end function
	function fdate(str)
		if str<>"" then
			fdate=year(str)&"-"&right("0"&month(str),2)&"-"&right("0"&day(str),2)
		end if
	end function
	'检查email
	function isemail(email)   
		dim names, name, i, c   
		isemail = true  
		names = Split(email, "@")   
		if UBound(names) <> 1 then   
			isemail = false  
			exit function   
		end if  
		for each name in names   
			if Len(name) <= 0 then   
				isemail = false  
				exit function   
			end if  
		for i = 1 to Len(name)   
			c = Lcase(Mid(name, i, 1))   
			if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then   
				isemail = false  
				exit function   
			end if  
		next   
		if Left(name, 1) = "." or Right(name, 1) = "." then   
			isemail = false  
			exit function   
			end if  
		next   
		if InStr(names(1), ".") <= 0 then   
			isemail = false  
			exit function   
		end if  
		i = Len(names(1)) - InStrRev(names(1), ".")   
		if i <> 2 and i <> 3 then   
			isemail = false  
			exit function   
		end if  
		if InStr(email, "..") > 0 then   
			isemail = false  
		end if  
	end function
'防GET方式的sql注入===============================
	sub checksql()
		dim sql_injdata 
		dim sql_ind
		SQL_injdata ="'|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
		SQL_inj = split(SQL_Injdata,"|") 
		If Request.QueryString<>"" Then 
			For Each SQL_Get In Request.QueryString 
				 For SQL_Data=0 To Ubound(SQL_inj) 
					if instr(lcase(Request.QueryString(SQL_Get)),Sql_Inj(Sql_DATA))>0 Then
						call msg("Internet Explorer发生错误,\n\n即将关闭后重启","window.opener='null';window.close()")
						exit for
						sql_ind="yes"
					end if 
				next 
				if sql_ind="yes" then
					exit for
				end if
			Next 
		End If
	end sub
	
	'禁止外部提交
	sub checkpost()	
		server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
		server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
		if mid(server_v1,8,len(server_v2))<>server_v2 then 
			call msg("禁止外部提交","window.opener=null;window.close();")
		end if
	end sub
	'提交的时候,把特殊字符转换
	function bhtml(str)
		if str<>"" then
			str=replace(str,"<","&lt;")
			str=replace(str,">","&gt;")
			str=replace(str,"'","&#39;")
			str=replace(str,chr(34),"&quot;")
			str=replace(str,"  ","&nbsp;&nbsp;")
		end if
		bhtml=str
	end function
%>
<%
'练锦辉添加
'后台左侧菜单导航
function admin_left_nav(table,fid,table2)
	set rs = server.createobject("adodb.recordset")
	sql="select  * from "&table&" where (fid="&fid&" or fid in (select id_lm from "&table&" where fid="&fid&")) and add_xx<>'no' order by px desc,id_lm desc "
	rs.open sql,conn,1,1
	if not  rs.eof then
	while not rs.eof
		%>
		 <li><a href="<%=table2%>/default.asp?id_lm=<%=rs("id_lm")%>" target="mainFrame"><%=rs("title_lm")%></a>&nbsp;|&nbsp;<a href="<%=table2%>/add.asp?id_lm=<%=rs("id_lm")%>"  target="mainFrame">添加</a></li>
		<%
	rs.movenext
	wend
	end if
	rs.close
	set rs=nothing
end function
%>
