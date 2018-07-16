<%
if session("person1")=""  then
	back_url=request.ServerVariables("HTTP_REFERER")
	response.Redirect"person_login.asp?back_url="&server.URLEncode(back_url)
	response.End()
end if
%>


