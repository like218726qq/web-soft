<%

if session("person")="" then
	'back_url=request.ServerVariables("HTTP_REFERER")
	'response.Redirect"person_login.asp?back_url="&server.URLEncode(back_url)
	Response.write "<SCRIPT language=JavaScript>alert('sorry, please login!');"
	Response.Write "this.location.href='vbscript:history.back()';</SCRIPT>"
	Response.End
end if
%>

