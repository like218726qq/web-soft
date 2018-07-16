<!--#include file="../inc.asp"-->
<%
'验证登录情况
checklogin

'禁止站外提交
checkpost

'提交参数
fid=bhtml(request.form("fid"))
title_lm=bhtml(request.Form("title_lm"))
title_lm_en=bhtml(request.Form("title_lm_en"))
add_xx=bhtml(request.Form("add_xx"))
xia=bhtml(request.Form("xia"))
px=bhtml(request.Form("px"))

'验证提交数据
if title_lm=""  or px="" or not isnumeric(px) then
	call msg("带*号的必须填写","")
end if

 '是否有下级分类
if fid=0 then
	add_xx="yes"
	xia="yes"
else
	add_xx="yes"
	xia="no"
end if

'连接数据库
openconn

'添加数据
conn.execute"insert into pro_lm (fid,title_lm,title_lm_en,add_xx,xia,px) values("&fid&",'"&title_lm&"','"&title_lm_en&"','"&add_xx&"','"&xia&"',"&px&")" 

'关闭数据库
closeconn

response.Write "<script language='javascript'>if (confirm('分类添加成功,\r\n确定要继续添加吗?')) {location='add.asp'}  else {location='default.asp'}</script>"
%>