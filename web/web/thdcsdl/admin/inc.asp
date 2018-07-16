<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%  Session.CodePage=65001
    Response.CharSet = "utf-8" 
	
	dim conn
	'后台master里的文件夹里连接数据库
	sub openconn()
		set conn=server.createobject("adodb.connection")
		connstr="DBQ="+server.mappath("../root.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
		conn.open connstr 
	end sub
	
	'后台master里的文件连接数据库(不包括master里的文件夹)
	sub opeconn()
		set conn=server.createobject("adodb.connection")
		connstr="DBQ="+server.mappath("root.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
		conn.open connstr 
	end sub
	
	'前台文件连接数据库(master外面的文件)
	sub opconn()
		set conn=server.createobject("adodb.connection")
		connstr="DBQ="+server.mappath("../admin/root.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
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
	
	'弹出式信息
	sub msg(content1,content2)
		closeconn
		if content2<>"" then
			response.write"<script>alert('提示:"&content1&"!');"&content2&"</script>"
		else
			response.write"<script>alert('提示:"&content1&"!');history.back();</script>"
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
	
	function rhtml(str)
		if str<>"" then
			str=replace(str,"&nbsp;"," ")
			str=replace(str,"&quot;",chr(34))
			str=replace(str,"&#39;","'")
			str=replace(str,"&gt;",">")
			str=replace(str,"&lt;","<")
		end if
		rhtml=str
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
		restr=rhtml(restr)
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
		getstr=bhtml(restr)
	end function
	
	'分页
	sub listpage(key)
		listp=listp&"<TABLE cellSpacing=0 cellPadding=0  align=center border=0 style='color:#666666' ><TR>"&chr(10)
		listp=listp&"<TR>"&chr(10)
		listp=listp&"<TD >第<font color='#ff0000'>"&pageno&"</font>页|共<font color='#ff0000'>"&pagezong&"</font>页|<font color='#ff0000'>"&pagenum&"</font>项/页|共<font color='#ff0000'>"&counter&"</font>项</td>"&chr(10)
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

%>
