<!--#include file="../inc_n.asp"-->
<%

'禁止外部提交
checkpost

username=bhtml(lcase(request.Form("username")))
password1=bhtml(lcase(request.Form("password1")))
password2=bhtml(lcase(request.Form("password2")))
rename=bhtml(request.Form("rename"))

if username="" or feifa(username) or password1="" or feifa(password1) or password1<>password2    then call msg("请正确填写管理员信息")

conn.execute"insert into master (username,password,rename,usertype,wtime,login_num,pass) values('"&username&"','"&password1&"','"&rename&"','"&now()&"',0,'yes')"

call msg("成功添加","location='default.asp'")

function feifa(str)
ind=false
ll=len(str)
string1="abcdefghijklmnopqrstuvwxyz0123456789-_"
for i=1 to ll
dange=mid(str,i,1)
if instr(string1,dange)=0 then
ind=true
exit for
end if
next
feifa=ind
end function
%>
