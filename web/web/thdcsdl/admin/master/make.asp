<!--#include file="../inc_n.asp"-->
<%

'禁止外部提交
checkpost
id=request("id")
id=replace(id," ","")
id=replace(id,","," or id=")
if id=""  then call msg("参数错误","")
if request("ac")="del" then
sql="DELETE  FROM master WHERE id = "&id
elseif request("ac")="ping1" then
sql="update master set pass='no' where id="&id&""
elseif request("ac")="ping2" then
sql="update master set pass='yes' where id="&id&""
end if
conn.execute sql

call msg("成功操作","parent.location.reload(1)")
%>
