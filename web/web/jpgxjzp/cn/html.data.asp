<!--#include file="html.conn.asp"-->
<%
i=1
while i<30
'response.Write i&"<br/>"

lm=html(request.Form("lm"))
title=html(request.Form("title"))
pro_guige=html(request.Form("pro_guige"))
pro_danwei=html(request.Form("pro_danwei"))
pro_color=html(request.Form("pro_color"))
pro_money=html(request.Form("pro_money"))
f_body=html(request.Form("f_body"))
z_body=request.Form("z_body")
img_sl=html(request.Form("img_sl"))
px=html(request.Form("px"))
lm=135
title="直立式展示架"  
'img_sl="proimg/II/"&i&".jpg"
'response.Write lm&","&title&","&img_sl&"<br/>"

set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_co "
rs.open sql,conn,1,3
rs.addnew()
	rs("lm")=lm
	rs("title")=title
	rs("pro_guige")=pro_guige
	rs("pro_danwei")=pro_danwei
	rs("pro_color")=pro_color
	rs("pro_money")=pro_money
	rs("f_body")=f_body
	rs("z_body")=z_body
	rs("img_sl")=img_sl
	rs("hot")="no"
	rs("tuijian")="no"
	rs("pass")="yes"
	rs("read_num")=0
	rs("wtime")=now()
	rs("px")=px
'rs.update
response.Write"添加成功。"
rs.close
set rs=nothing

i=i+1
wend

%>