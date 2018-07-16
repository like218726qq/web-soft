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

Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from pro_order where id = "&id
rs.open sql,conn,1,3
if rs.eof then 
	call msg("记录不存在或已删除","")
end if
rs("chakan")="yes"
rs.update
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品订购管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<LINK href="../admin.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td colspan="2"  align="center">产品中心管理----查看产品订单</td>
  </tr>
</table>
<br>
<TABLE width="100%" border=0 cellPadding="2" cellSpacing="1" class=border>
    <tr class="title">
    <td colspan="2" align="center">查看订单</td>
    </tr>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD width="12%" height="20" align=right><strong> 产品名称： </strong></TD>
        <TD width="88%"><%=rs("title")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 量： </strong></TD>
        <TD><%=rs("order_num")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>联&nbsp;&nbsp;系&nbsp;&nbsp;人： </strong></TD>
        <TD><%=rs("rename")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 件： </strong></TD>
        <TD><%=rs("email")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 联系电话： </strong></TD>
        <TD><%=rs("phone")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 联系传真： </strong></TD>
        <TD><%=rs("fax")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 编： </strong></TD>
        <TD><%=rs("post")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 址： </strong></TD>
        <TD><%=rs("address")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 递交日期： </strong></TD>
        <TD><%=rs("wtime")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 递 交 ip： </strong></TD>
        <TD><%=rs("ip")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 简要说明：</strong></TD>
        <TD><%=rs("z_body")%></TD>
    </TR>
</TABLE>
<p align="center">
<input  type="button" name="button" value="返回" onclick="location='<%=request.ServerVariables("HTTP_REFERER")%>'"/>
</p>
<%
rs.close
set rs=nothing

'关闭数据库
closeconn
%>
</body>
</html>