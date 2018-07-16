<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>客户留言管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
</head>
<body >
	<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
		 <tr class="topbg">
			 <td  align="center">留言中心管理----留言管理首页</td>
	  </tr>
	</table>
<br />
<FORM name=myform  action="make.asp" method=post>
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" border=0>
            <TBODY>
              <TR class=title >
                <TD align=middle ><STRONG>选中</STRONG></TD>
                <TD align=middle><STRONG>ID</STRONG></TD>
                <TD align=middle><STRONG>申请区域</STRONG></TD>
				<TD align=middle><STRONG>姓    名</STRONG></TD>
                <TD align=middle><STRONG>联系手机</STRONG></TD>
				<TD align=middle><STRONG>电子邮箱</STRONG></TD>
                <TD align=middle><STRONG>状态</STRONG></TD>
                <TD align=middle><STRONG>常规管理操作</STRONG></TD>
              </TR>
			  
		<%
		
		'检查登录
		openconn
		
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from sq order by id desc"
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
		zt=""
		
		if rs("chakan")="yes" then 
			zt=zt&"<font color='#cccccc'>已看</font>&nbsp;"
		else
			zt=zt&"<font color='blue'>未看</font>&nbsp;"
		end if
		
		%>
              <TR class=tdbg onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
                <TD align=middle width=30><input type=checkbox name="id" value="<%=rs("id")%>" ></TD>
                <TD align=middle><%=rs("id")%></TD>
                <TD><%=rs("wl")%>,<%=rs("st")%></TD>
                <TD align=middle><%=rs("xm")%></TD>
                <TD align=middle><%=rs("tel")%> </TD>
                <TD align=middle><%=rs("mail")%> </TD>
                <TD align=middle><%=zt%></TD>
                <TD align=center> 
				  <A href="book_show.asp?id=<%=rs("id")%>">查看</A>|
                  <A onClick="return confirm('确定要删除此留言吗？');" href="make.asp?ac=del&id=<%=rs("id")%>">删除</A>
                </TD>
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
  
          </TABLE>
          
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
          <TBODY>
          <TR>
            <TD height=30 align="left">				&nbsp;&nbsp; &nbsp;&nbsp;
              <input name=chkall onClick=CheckAll(this.form)  type=button value="全选">
                &nbsp;&nbsp;
              <input name=chkOthers onClick=CheckOthers(this.form)  type=button value="反选">
             <input type="hidden" name="ac" value="del">
            <input type="submit" value="删除选中留言" name="submit1"  onClick="return confirm('真的要删除选中留言吗?')">     </TD>
            </TR>
          </TBODY>
  </TABLE>
</FORM>
<table width="100%" height="25"  border="0" cellpadding="0" cellspacing="0" style="border:1px solid #2F78C8; ">
  <tr class=tdbg>
    <td height="25" bgcolor="#D3E7F8">
     <%	
	if pagezong<>"" then
		call listpage(key) 
	end if
	%>
    </td>
  </tr>
</table>


<br />
<br>
<B>说明</B>：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">未看</font>---该留言没有查看 ,<font color="#cccccc">已看</font>---该留言已经查看