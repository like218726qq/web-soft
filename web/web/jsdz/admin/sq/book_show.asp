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
sql="select * from sq where id="&id&""
rs.open sql,conn,1,3
if rs.eof then
	call msg("参数错误","")
else
	rs("chakan")="yes"
	rs.update
	wl=rs("wl")
	st=rs("st")
	fw=rs("fw")
	xm=rs("xm")
	tel=rs("tel")
	mail=rs("mail")
	UserName=rs("UserName")
	address=rs("address")
	link1=rs("link1")
	link2=rs("link2")
	zm1=rs("zm1")
	zm2=rs("zm2")
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
        <td  align='center'><strong>申请中心管理----</strong>查看申请</td>
    </tr>
</table>
<BR>

                  <table border="0" cellpadding="0" cellspacing="1" width="750px" style="background-color:#ebebeb; border:1px solid #000; border-bottom:none">
                    <tr>
                      <td align="center" colspan="6" style="font-size:16px" height="40px"><b>客户基本资料</b></td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                      <td height="40px" width="95" align="center">申请区域</td>
                      <td width="116">&nbsp;
                        <input type="checkbox" name="wl" value="网络销售渠道" <%if wl="网络销售渠道" then%> checked="checked"<%end if%> />
                        网络销售渠道</td>
                      <td width="108"><input type="checkbox" name="st" value="实体销售渠道" <%if st="实体销售渠道" then%> checked="checked"<%end if%> />
                        实体销售渠道</td>
                      <td width="132" align="center">区域范围</td>
                      <td colspan="2">&nbsp;
                          <input type="text" name="fanwei" value="<%=fw%>" style="width:240px" /></td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                      <td height="40px" width="95" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名</td>
                      <td width="116">&nbsp;
                      <input type="text" name="name" style="width:80px" value="<%=xm%>" /></td>
                      <td width="108" align="center">联系手机</td>
                      <td width="132">&nbsp;
                      <input type="text" name="tel" style="width:110px" value="<%=tel%>" /></td>
                      <td width="68" align="center">电子邮箱</td>
                      <td width="224">&nbsp;
                      <input type="text" name="mail" style="width:170px" value="<%=mail%>" /></td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                      <td  height="40px" width="95" align="center">客户名称</td>
                      <td colspan="5">&nbsp;
                          <input type="text" name="UserName" style="width:600px" value="<%=username%>" /></td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                      <td width="95" height="40px" align="center">通讯/收货地址</td>
                      <td colspan="5">&nbsp;
                          <input type="text" name="address" style="width:600px" value="<%=address%>" /></td>
                    </tr>
                  </table>
                  <table border="0" cellpadding="0" cellspacing="1" width="750px" style="background-color:#ebebeb; border:1px solid #000; border-top:none">
       	  <tr>
                        	<td align="center" colspan="6" style="font-size:16px" height="40px"><b>经营基本资料</b></td>
                        </tr>
                    	<tr style="background-color:#FFFFFF">
                        	<td width="14%" rowspan="4" align="center">销售渠道</td>
                          <td width="13%" rowspan="2" align="center">网络渠道</td>
                          <td width="14%" height="30" align="center">直营店</td>
                          <td width="59%">&nbsp;链接地址
                          <input type="text" name="link1" style="width:340px" value="<%=link1%>" /></td>
                    </tr>
                        <tr style="background-color:#FFFFFF">
                            <td height="30" align="center">分销店</td>
                          	<td>&nbsp;链接地址
                       	  <input type="text" name="link2" style="width:340px" value="<%=link2%>" /></td>
                    </tr>
                        <tr style="background-color:#FFFFFF">
                            <td rowspan="2" align="center">实体渠道</td>
                          <td height="30" align="center">连锁专卖</td>
                          <td>&nbsp;<input type="text" name="zm1" style="width:395px"  value="<%=zm1%>"/></td>
                        </tr>
                         <tr style="background-color:#FFFFFF">
                            <td height="30" align="center">柜台专面</td>
                           <td>&nbsp;<input type="text" name="zm2" style="width:395px"  value="<%=zm2%>"/></td>
                        </tr>
                    </table>







