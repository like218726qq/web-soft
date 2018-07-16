<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

id=request("id")
w_url=request.ServerVariables("HTTP_REFERER")
if id="" or not checknum(id) then 
	call msg("参数错误","")
end if

'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from book where id="&id&""
rs.open sql,conn,1,3
if rs.eof then
	call msg("参数错误","")
else
	rs("chakan")="yes"
	rs.update
	title=rs("title")
	rename=rs("rename")
	email=rs("email")
	compname=rs("compname")
	phone=rs("phone")
	address=rs("address")
	z_body=rehtml(rs("z_body"))
	wtime=rs("wtime")
	ip=rs("ip")
	pass=rs("pass")
	chakan=rs("chakan")
	huifu=rs("huifu")
end if
rs.close
set rs=nothing

set rs=server.CreateObject("adodb.recordset")
sql="select  top 1 z_body,wtime from book where id_re="&id&" "
rs.open sql,conn,1,1
if not rs.eof then
	h_z_body=rehtml(rs("z_body"))
	h_wtime=rs("wtime")
end if 
rs.close
set rs=nothing

'关闭数据库
closeconn
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>留言簿管理</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
</head>
<body >

<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
    <tr class='topbg'>
        <td  align='center'><strong>留言簿中心管理----</strong>查看</td>
    </tr>
</table>
<BR>
		<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" border=0>
          <TR class=title >
            <TD align="right">标　　题：</TD>
            <TD  align="left"><strong><%=title%></strong></TD>
          </TR>
          <tr class="tdbg">
            <td height="20" align="right">昵　　称：</td>
            <td><%=rename%></td>
          </tr>
          <tr class="tdbg">
            <td height="20" align="right">电子邮箱：</td>
            <td><%=email%></td>
          </tr>
          <tr class="tdbg">
            <td height="20" align="right">公司名称：</td>
            <td><%=compname%></td>
          </tr>
		  <tr class="tdbg">
            <td height="20" align="right">电　　话：</td>
            <td><%=phone%></td>
          </tr>
          		  <tr class="tdbg">
            <td height="20" align="right">地　　址：</td>
            <td><%=address%></td>
          </tr>
          <tr class="tdbg">
            <td height="20" align="right">留言时间：</td>
            <td><%=wtime%></td>
          </tr>
		   <tr class="tdbg">
            <td height="20" align="right">留言　IP：</td>
            <td><%=ip%></td>
          </tr>
		  <form action="book_add.asp" method="post"  name="form1">
          <input name="id"  value="<%=id%>" type="hidden">
          <input name="w_url"  value="<%=w_url%>" type="hidden">
          <TR class="tdbg2" >
            <TD width="27%" height="40" align="right" class="tdbg2">留言内容：</TD>
            <TD width="73%" align="left" valign="top" class="tdbg2">
              <textarea name="f_body" cols="60" rows="6"><%=z_body%></textarea></TD>
          </TR> 
		      <tr class="tdbg" style="display:none;">
            <td height="20" align="right">回复时间：</td>
            <td><%=h_wtime%></td>
          </tr>
          <TR >
            <TD width="27%" height="50" align="right" valign="top" class="tdbg2"></TD>
            <TD width="73%" align="left" valign="top" class="tdbg2">
             
                <textarea name="z_body" cols="60" rows="6" style="display:none;"><%=h_z_body%></textarea>
                <br>
                <table width="364" height="26" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="26" align="center"><input type="submit" name="Submit" value="回 复" style="display:none;">
&nbsp;&nbsp;
              <input type="button" name="Submit2" value="返 回" onClick="location='<%=w_url%>'"></td>
                  </tr>
                </table>            </TD>
          </TR></form>
</TABLE>
