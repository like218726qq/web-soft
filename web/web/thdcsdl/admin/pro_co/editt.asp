<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin

'禁止站外提交
checkpost

'获取提交参数
id=bhtml(request.Form("id"))
lm=bhtml(request.Form("lm"))
title=bhtml(request.Form("title"))
title_en=bhtml(request.Form("title_en"))
pro_guige=bhtml(request.Form("pro_guige"))
pro_danwei=bhtml(request.Form("pro_danwei"))
pro_color=bhtml(request.Form("pro_color"))
pro_money=bhtml(request.Form("pro_money"))
f_body=html(request.Form("f_body"))
z_body=request.Form("z_body")
z_body_en=request.Form("z_body_en")
img_sl=bhtml(request.Form("img_sl"))
px=bhtml(request.Form("px"))
if id="" or not isnumeric(id)  or px=""  then 
	call msg("参数错误","")
end if
if  lm="" or title="" then 
	call msg("带*号必须填写","")
end if
if  not isnumeric(px) then 
	call msg("请输入正确的输入显示顺序","")
end if
'连接数据库
openconn

'修改数据
set rs=server.CreateObject("adodb.recordset")
sql="select * from pro_co where id="&id&" "
rs.open sql,conn,1,3
if rs.eof then
	call msg("该信息不存在或已删除","")
end if
yimg_sl=rs("img_sl")
'相关参数
rs("lm")=lm
rs("title")=title
rs("title_en")=title_en
rs("pro_guige")=pro_guige
rs("pro_danwei")=pro_danwei
rs("pro_color")=pro_color
rs("pro_money")=pro_money
rs("f_body")=f_body
rs("z_body")=z_body
rs("z_body_en")=z_body_en
rs("img_sl")=img_sl
rs("px")=px
rs.update
rs.close
set rs=nothing

'删除文件
if yimg_sl<>img_sl and yimg_sl<>"" then
	call delfile(site_path&"/"&yimg_sl)
end if

call msg("成功修改内容","location='default.asp?id_lm="&request("lm")&"'")
%>

