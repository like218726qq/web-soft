<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'检查sql注入
checksql

'提取和验证传递参数
keyword=trim(replace(request("keyword"),"'",""))
person_dj=request("person_dj")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品订购管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script src="../scripts/function.js" language="javascript"></script>
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
    <tr class="topbg">
    <td colspan="2"  align="center">产品中心管理----管理产品订单</td>  
    </tr>
</table><br />

<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
  <TBODY>
    <TR class="tdbg3" >
      <TD width="70"  valign="top"><strong>会员检索：</strong></TD>
      <TD>
      <form id="sform" name="sform" method="get" action="default.asp">
         <input name="keyword" type="text" id="keyword" maxlength="50"  value="<%=keyword%>"/>
        <!-- <select name="person_dj">
         <option value="">会员等级</option>
         <option value="p">普通会员</option>
         <option value="v">VIP会员</option>
         </select>-->
         <input type="submit" name="button" id="button" value="检索" />
        </form>
      </TD>
    </TR>
  </TBODY>
</TABLE>
<br />
<FORM name="form1"   action="make.asp" method="post" target="theBlank" onsubmit="return checkyes(form1)">
		<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" border=0>
        <TBODY>
              <TR class=title >
                <TD align=middle ><STRONG>选中</STRONG></TD>
                <TD align=middle><STRONG>ID</STRONG></TD>
                <TD align=middle><STRONG>订单号</STRONG></TD>
                <TD align=middle><STRONG>帐号</STRONG></TD>
				<td align="center"><strong>时间</strong></td>
				<TD align=left><STRONG>状态</STRONG></TD>
                <TD align=middle><STRONG>常规管理操作</STRONG></TD>
              </TR>
		<%
		'连接数据库
		openconn
		
		if keyword<>"" then
			tt=" and ( b.username like '%"&keyword&"%' or  a.order_no like '%"&keyword&"%')"
		end if
		
		if person_dj<>"" then
			if person_dj="p" or person_dj="v" then
				tt=tt&" and b.person_dj='"&person_dj&"'"
			end if
		end if
		
		Set rs= Server.CreateObject("ADODB.Recordset")
		sql="select a.id,a.order_no,a.order_zt,a.pay_zt,a.send_zt,a.wtime,b.username from person_order a left join person b on a.username=b.username  where 1=1 "&tt&" order by a.id desc"
		rs.open sql,conn,1,1
		if not rs.eof then
			pagenum=25
			rs.pagesize=pagenum
			counter=rs.recordcount
			pagezong=rs.pagecount
			pageno=trim(request.querystring("page"))
			if pageno="" or not isnumeric(pageno) then 
				pageno=1
			end if
			if pageno<1 then
				pageno=1
			end if
			if pageno-pagezong>0 then 
				pageno=pagezong
			end if
			rs.absolutepage=pageno
			a=1
		end if
		while not rs.eof and a<=pagenum
		%>
       <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
                <TD align=middle width=30><input type=checkbox name="id" id="id" value="<%=rs("id")%>" ></TD>
                <TD align=middle><%=rs("id")%></TD>
                <TD><A href=order_show.asp?id=<%=rs("id")%>><%=rs("order_no")%></a></TD>
                <TD align=middle><%=rs("username")%>&nbsp;</TD>
				<td align="center"><%=rs("wtime")%></td>
				<TD align=left><%=order_z(rs("order_zt"))%>&nbsp;<%=pay_z(rs("pay_zt"))%>&nbsp;</TD>
                <TD align=center>&nbsp;<A href=order_show.asp?id=<%=rs("id")%>>查看处理</A> | <A onClick="return confirm('真的要删除该订单吗？');" href=make.asp?id=<%=rs("id")%> target="theBlank">删除</A></TD>
        </TR>
		<%
        a=a+1
        rs.movenext
        wend
        rs.close
        set rs=nothing
        
        '关闭数据库
        closeconn
        %>
            </TBODY>
          </TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY><TR>
                <TD height=30 align="left">				&nbsp;&nbsp; &nbsp;&nbsp;
                  <input name=chkall onClick=CheckAll(this.form,"no")  type=button value='全选'>
                    &nbsp;&nbsp;
                 <input name=chkOthers onClick=CheckOthers(this.form,"no")  type=button value='反选'>

		        <input type="submit" value="删除选中订单" name="submit1"  onClick="return confirm('真的要删除选中订单吗?')">     </TD>
                </TR>
                
              </TBODY>
          </TABLE>

<table width="100%" height="25"  border="0" cellpadding="0" cellspacing="0" style="border:1px solid #2F78C8; ">
  <tr class=tdbg>
    <td height="25" bgcolor="#D3E7F8">     
				<%
				'分页过程
				if pagezong<>"" then
					key="&person_dj="&person_dj&"&keyword="&server.URLEncode(keyword)&""
					call listpage(key) 
				end if
				%>	</td>
  </tr>
</table>
</form>	
<IFRAME id=theBlank name=theBlank style="WIDTH: 0px; HEIGHT: 0px" ></IFRAME>
</body>
</html>
