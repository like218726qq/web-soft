<!--#include file="../inc_n.asp"-->
<%	
'��ֹ�ⲿ�ύ
checkpost	

id=request("id")
id=replace(id," ","")
id=replace(id,","," or id=")
if id="" then call msg("��������","")
if request("ac")="del" then
sql="DELETE  FROM person WHERE id = "&id
elseif request("ac")="ping1" then
sql="update person set pass='no' where id="&id&""
elseif request("ac")="ping2" then
sql="update person set pass='yes' where id="&id&""
end if
conn.execute(sql)
call msg("�����ɹ�","parent.location.reload(1)")
%>