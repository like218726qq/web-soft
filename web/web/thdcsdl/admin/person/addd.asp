<!--#include file="../inc_n.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
'禁止外部提交
checkpost	
 	
if  not isdate(request("wtime")) then call msg("请正确填写注册时间","")
if not isdate(request("etime")) then call msg("请正确填写最近登陆时间","")
if request("login_num")="" or not isnumeric(request("login_num")) then call msg("请填写登陆次数","")
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from person where username='"&bhtml(trim(request("username")))&"'"
rs.open sql,conn,1,3
if not rs.eof then
call msg("帐号已经存在,请重新填写","")
else
rs.addnew()
rs("username")=bhtml(request("username"))
rs("password")=bhtml(request("password"))
rs("rename")=bhtml(request("rename"))
rs("sex")=request("sex")
rs("age")=bhtml(request("age"))
rs("phone")=bhtml(request("phone"))
rs("addr")=bhtml(request("addr"))
rs("email")=bhtml(request("email"))
rs("wtime")=bhtml(request("wtime"))
rs("etime")=bhtml(request("etime"))
rs("login_num")=bhtmlrequest("login_num"))
rs("ip")=bhtml(request("ip"))
rs("pass")="yes"
rs.update
end if
rs.close
set rs=nothing

call msg("添加成功","location='default.asp'")
%>
