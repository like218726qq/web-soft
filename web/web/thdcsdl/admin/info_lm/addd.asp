<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'检查外部提交
checkpost

'接收参数
fid=bhtml(request.Form("fid"))
title_lm=bhtml(request.Form("title_lm"))
px=bhtml(request.Form("px"))
add_xx=bhtml(request.Form("add_xx"))
xia=bhtml(request.Form("xia"))
uselink=bhtml(request.Form("uselink"))
info_from=bhtml(request.Form("info_from"))
f_body=bhtml(request.Form("f_body"))
z_body=bhtml(request.Form("z_body"))
img_sl=bhtml(request.Form("img_sl"))
wtime=bhtml(request.Form("wtime"))
s_pic=bhtml(request.Form("s_pic"))
s_typ=bhtml(request.Form("s_typ"))
s_wid=bhtml(request.Form("s_wid"))
s_hei=bhtml(request.Form("s_hei"))

'检查参数
if title_lm="" or px="" or not isnumeric(px) then
call msg("带*号的必须填写",";")
end if

'连接数据库
openconn

'添加数据
conn.execute"insert into info_lm (fid,title_lm,px,add_xx,xia,uselink,info_from,f_body,z_body,img_sl,wtime,s_pic,s_typ,s_wid,s_hei) values('"&fid&"','"&title_lm&"',"&px&",'"&add_xx&"','"&xia&"','"&uselink&"','"&info_from&"','"&f_body&"','"&z_body&"','"&img_sl&"','"&wtime&"','"&s_pic&"','"&s_typ&"','"&s_wid&"','"&s_hei&"')"

'关闭数据库
closeconn

response.Write "<script language='javascript'>if (confirm('栏目添加成功,\r\n确定要继续添加吗?')) {location='add.asp'}  else {location='default.asp'}</script>"
%>