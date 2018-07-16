<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

id=request("id")
if id="" or not checknum(id) then 
	call msg("参数错误","")
end if

'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from job_yp where id="&id&""
rs.open sql,conn,1,3
if rs.eof then 
	call msg("该简历不存在或已删除","")
end if
rs("chakan")="yes"
rs.update
job_title=rs("job_title")
username=rs("username")
phone=rs("phone")
email=rs("email")
z_body=rehtml(rs("z_body"))
up_sl=rs("up_sl")
wtime=rs("wtime")
ip=rs("ip")
rs.close
set rs=nothing

'关闭数据库
closeconn
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看简历</title>
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td  colspan="2"  align="center"><strong>企业招聘管理----</strong>查看简历</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="30" ><strong>管理导航：</strong></td>
    <td><a href="default.asp">招聘管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加招聘</a>&nbsp;| <a href="default_yp.asp">查看应聘</a></td>
  </tr>
</table>
<br>

<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
  <tr>
    <td colspan="2" align="center" class="title">查看简历</td>
  </tr>
  <tr class="tdbg">
    <td width="120" height="20"  align="right">应聘职位：</td>
    <td><%=job_title%></td>
  </tr>
    <tr class="tdbg">
    <td width="120" height="20"  align="right">姓　　名：</td>
    <td><%=username%></td>
  </tr>
    <tr class="tdbg">
    <td width="120" height="20"  align="right">联系电话：</td>
    <td><%=phone%></td>
  </tr>
    <tr class="tdbg">
    <td width="120" height="20"  align="right">电子邮箱：</td>
    <td><%=email%></td>
  </tr>
      <tr class="tdbg">
    <td width="120" height="20"  align="right">备　　注：</td>
    <td><textarea name="textarea" cols="45" rows="6"><%=z_body%></textarea></td>
  </tr>
     <tr class="tdbg">
    <td width="120" height="20"  align="right">上传附件：</td>
    <td>
    
    <a href="<%="../../"&up_sl%>" target="_blank">下载附件</a>
    </td>
  </tr>
     <tr class="tdbg">
    <td width="120" height="20"  align="right">应聘时间：</td>
    <td><%=wtime%></td>
  </tr>
     <tr class="tdbg">
    <td width="120" height="20"  align="right">应聘　IP：</td>
    <td><%=ip%></td>
  </tr>
</table><p align="center">
  <input type="button" name="Submit" value=" 返 回 " onClick="location='<%=request.ServerVariables("HTTP_REFERER")%>'" style="margin-left:120px; ">
</p>

</body>
</html>
