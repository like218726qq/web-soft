<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%  
'这个在套程序的conn.asp里有
Session.CodePage=65001
Response.CharSet = "utf-8" 
Response.Buffer =True
'取消缓存
Response.ExpiresAbsolute =Now() - 1
Response.Expires=0
Response.CacheControl="no-cache"

'做测试用而已，目的就是延长执行时间
for i=1 to 10000
	for j=1 to 1000
		
	next
next

if request("id")=1 then
	'循环输出20此内容
	for i=1 to 20
		response.write "clientHeight 都没有什么异议，都认为是内容可视区域的高度，也就是说页面浏览器中可以看到内容的这个区域的高度，一般是最后一个工具条以下到状态栏以上的这个区域，与页面内容无关。 "
	next
elseif request("id")=2 then
	response.write "id=2的内容"
elseif request("id")=3 then
	response.write "id=3的内容"
end if
%>