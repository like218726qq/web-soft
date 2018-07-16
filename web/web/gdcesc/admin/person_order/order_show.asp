<!--#include file="../inc.asp"-->
<%	
'检查登录
checklogin

'禁止外部提交
checkpost

'检查sql注入
checksql

q_url=request("q_url")
id=request("id")
if id="" or not isnumeric(id) then 
	call msg("参数错误","")
end if
if q_url="" then
	q_url=request.ServerVariables("HTTP_REFERER")	
end if

'连接数据库
openconn

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品订购管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../function.js"></script>
<style>
.tdbg2{ color:#666;}
</style>
</head>
<body >
<%
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from person_order where id = "&id
rs.open sql,conn,1,1
if rs.eof then 
	call msg("记录不存在或已删除","")
end if
%>
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" border=0 style=" line-height:20px;">
<TBODY>
              <TR class="topbg">
                <TD align=middle><STRONG>产品名称</STRONG></TD>
                <TD align=middle><STRONG>单价</STRONG></TD>
                <TD align=middle><STRONG>数量</STRONG></TD>
                <TD align=middle><STRONG>总价</STRONG></TD>
              </TR>
		<%
		Set rsa= Server.CreateObject("ADODB.Recordset")
		sql="select * from person_pro where order_no='"&rs("order_no")&"' "
		rsa.open sql,conn,1,1
		a=0
		while not rsa.eof 
		%>
       <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
            
<TD>
            <a href="../../product.asp?id=<%=rsa("pro_id")%>" target="_blank"><%=rsa("pro_title")%></a><span><br />
            </span>
            </TD>
            <TD align=middle>￥<%=formatnum(rsa("pro_money"))%></TD>
            <TD align=middle><%=rsa("pro_num")%></TD>
            <td align="center">￥<%=formatnum(rsa("pro_money")*rsa("pro_num"))%></td>
    </TR>
		<%
        a=a+rsa("pro_money")*rsa("pro_num")
		rsa.movenext
        wend
        rsa.close
        set rsa=nothing
        %>
            </TBODY>
          </TABLE>
     <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td style="padding-right:5px; font-family:Arial, Helvetica, sans-serif;text-align:right; font-weight:bold; height:35px;"> 商品总价:<font style="color:#FF6600;">￥<%=formatnum(a)%></font></td>
  </tr>
</table>
<form name="formm" action="order_showw.asp" method="post">
<TABLE width="100%" border=0 cellPadding="2" cellSpacing="1" class=border>
    <tr class="title">
    <td colspan="4" align="center">&nbsp;</td>
    </tr>
      <tr>
      <td colspan="4" class="tdbg3" style="padding-left:87px;"><strong>订单信息：</strong></td>
      </tr>
<TR class=tdbg  >
        <TD width="150" height="20" align=right class="tdbg2"> 单号： </TD>
        <TD><%=rs("order_no")%></TD>
        <TD width="120" align="right" class="tdbg2"> 时间： </TD>
        <TD ><%=rs("wtime")%></TD>
    </TR>
       <tr>
      <td colspan="4" class="tdbg3" style="padding-left:87px;"><strong>费用总计：</strong></td>
      </tr>
    <TR class=tdbg  >
        <TD width="150" height="20" align=right class="tdbg2"> 商品费用： </TD>
        <TD colspan="3">￥<%=formatnum(rs("total_money"))%></TD>
    </TR>
        <TR class=tdbg  >
        <TD width="150" height="20" align=right class="tdbg2"> 付款方式： </TD>
        <TD colspan="3">暂无网上支付，线下联系</TD>
    </TR>

<%
set rsb=server.CreateObject("adodb.recordset")
sql="select * from person where username='"&rs("username")&"'"
rsb.open sql,conn,1,1
jf=rs("total_money")
if not rsb.eof then
%>
 <tr>
      <td colspan="4" class="tdbg3" style="padding-left:75px;"><strong>下单人信息：</strong></td>
      </tr>
      <TR class=tdbg  >
        <TD height="20" align=right class="tdbg2"> 姓名： </TD>
        <TD colspan="3"><%=rsb("rename")%></TD>
      </TR>
        <TR class=tdbg  >
        <TD align="right" class="tdbg2"> 电话： </TD>
        <TD  colspan="3"><%=rsb("phone")%></TD>
  </TR>  
      <TR class=tdbg  >
        <TD height="20" align=right class="tdbg2"> 邮编： </TD>
        <TD colspan="3"><%=rsb("post")%></TD>
    </TR>
  <TR class=tdbg  >
        <TD height="20" align=right class="tdbg2"> 地址： </TD>
        <TD colspan="3"><%=rsb("address")%></TD>
  </TR>

<%
end if
rsb.close
set rsb=nothing
%>


      <tr>
      <td colspan="4" class="tdbg3" style="padding-left:75px;"><strong>送货信息：</strong></td>
      </tr>
      <TR class=tdbg  >
        <TD height="20" align=right class="tdbg2"> 姓名： </TD>
        <TD colspan="3"><%=rs("rename")%></TD>
    </TR>    <TR class=tdbg  >
        <TD align="right" class="tdbg2"> 电话： </TD>
        <TD  colspan="3"><%=rs("phone")%></TD>
  </TR>
    <TR class=tdbg  >
        <TD height="20" align=right class="tdbg2"> 邮编： </TD>
        <TD colspan="3"><%=rs("post")%></TD>
    </TR>
  <TR class=tdbg  >
        <TD height="20" align=right class="tdbg2"> 地址： </TD>
        <TD colspan="3"><%=rs("address")%></TD>
  </TR>


 
    <TR class=tdbg  >
        <TD height="20" align=right class="tdbg2"> 备注： </TD>
        <TD colspan="3"><textarea name="z_body" cols="50" rows="5"><%=rehtml(rs("z_body"))%></textarea></TD>
  </TR>
      <tr>
      <td colspan="4" class="tdbg3" style="padding-left:87px;"><strong>订单处理：</strong></td>
      </tr>
       <tr class="tdbg">
         <td width="150" align="right" bgcolor="#E3EAED" class="tdbg2">订单状态:</td>
         <td colspan="3" class="tdbg">
         <input type="radio" name="order_zt" value="nno" <%if rs("order_zt")="nno" then response.write " checked=""checked""" end if%>/> 未受理
         <input type="radio" name="order_zt" value="yes" <%if rs("order_zt")="yes" then response.write " checked=""checked""" end if%>/> 已受理<input type="radio" name="order_zt" value="no" <%if rs("order_zt")="no" then response.write " checked=""checked""" end if%>/> 已取消</td>
       </tr>
       <tr >
         <td width="150" align="right" bgcolor="#E3EAED" class="tdbg2">付款状态:</td>
         <td colspan="3" class="tdbg"><input type="radio" name="pay_zt" value="no" <%if rs("pay_zt")="no" then response.write " checked=""checked""" end if%>/> 未付款
<input type="radio" name="pay_zt" value="yes" <%if rs("pay_zt")="yes" then response.write " checked=""checked""" end if%>/> 已付款         </td>
       </tr>
  
          <TR class=tdbg  >
        <TD height="20" align=right class="tdbg2"> 订单回复： </TD>
        <TD colspan="3"><textarea cols="50" rows="5" name="h_body" id="h_body"><%=rehtml(rs("h_body"))%></textarea></TD>
  </TR>
</TABLE>
<input type="hidden" name="id" value="<%=rs("id")%>" />
<input type="hidden" name="q_url" value="<%=q_url%>" />
<br />



<p align="center">
  <label>
  <input type="submit" name="button2" id="button" value=" 提 交 " />&nbsp;
  </label>
<input  type="button" name="button" value=" 返 回 " onclick="location='<%=q_url%>'"/>
</p>
</form>
<%
rs.close
set rs=nothing

'关闭数据库
closeconn
%>
</body>
</html>