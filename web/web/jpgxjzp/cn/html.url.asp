
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
Function GetUrl(action)
GetUrl=request.servervariables("script_name") '赋目录及文件名
if action="div" then exit Function
GetUrl=Mid(Request.ServerVariables("script_name"),InstrRev(Replace(Request.ServerVariables("script_name"),"\","/"),"/")+1) '赋文件名
if action="page" then exit Function
GetUrl=request.servervariables("QUERY_STRING") '赋地址栏参数
if action="action" then exit Function
GetUrl="http://" '赋http://
GetUrl=GetUrl&request.servervariables("HTTP_HOST") '+赋域名
if action="http" then exit Function
GetUrl=GetUrl&request.servervariables("script_name")'+赋目录及文件名
if action="alldiv" then exit Function
if request.servervariables("QUERY_STRING")<>"" then GetUrl=GetUrl&"?"&request.servervariables("QUERY_STRING") '+赋地址栏参数
End Function
''Response.Write "参数：http<br>值："&GetUrl("http")&"<br><br>"
'Response.Write "参数：alldiv<br>值："&GetUrl("alldiv")&"<br><br>"
'Response.Write "参数：all 或空<br>值："&GetUrl("all")&"<br><br>"
'Response.Write "参数：action<br>值："&GetUrl("action")&"<br><br>"
'Response.Write "参数：div<br>值："&GetUrl("div")&"<br><br>"
'Response.Write "参数：page<br>值："&GetUrl("page")
'response.write "<br><br>"
'response.write request.servervariables("script_name")
str=GetUrl("all")
str=right(str,len(str)-instrrev(str,"/"))
if instrrev(str,"?")>1 then
str=left(str,instrrev(str,"?")-1)
end if
'response.Write str
url_filename=str
%>
