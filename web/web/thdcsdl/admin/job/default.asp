<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'检查sql注入
checksql
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../function.js"></script>
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td  colspan="2"  align="center">企业招聘管理----招聘管理首页</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td><a href="default.asp">招聘管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加招聘</a>&nbsp;| <a href="default_yp.asp">查看应聘</a></td>
  </tr>
</table>
<br>
<FORM name="form1" action="make.asp" method="post"  target="theblank" onsubmit="return checkyes(form1);">
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
              <TR align="center" class=title >
                <TD ><STRONG>选中</STRONG></TD>
                <TD><STRONG>ID</STRONG></TD>
                <TD align=left><STRONG>招聘职位</STRONG></TD>
                <TD><strong>发布日期</strong></TD>
                <TD><STRONG>有效期</STRONG></TD>
                <TD><strong>排序</strong></TD>
                <TD><strong>状态</strong></TD>
                <TD><STRONG>常规管理操作</STRONG></TD>
              </TR>
			<%
			'连接数据库
			openconn
			
			Set rs= Server.CreateObject("ADODB.Recordset")
			sql="select *  from job order by px desc,id desc"
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
		   if rs("pass")="yes" then 
		   zt="<font  class='passyes'>开放</font>"
		   else
		   zt="<font  class='passno'>屏蔽</font>"
		   end if
		%>
              <TR class=tdbg onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
                <TD align=middle width=30><input name="id" id="id" type="checkbox" value="<%=rs("id")%>" onClick="checkpx(<%=rs("id")%>)"></TD>
                <TD align=middle><%=rs("id")%></TD>
                <TD align="left"><%=rs("title")%></TD>
				<TD align=middle><%=rs("wtime")%></TD>
                <TD align=middle><%=rs("etime")%></TD>
                <td align="center"><input name="<%=rs("id")%>" id="<%=rs("id")%>" type="text" value="<%=rs("px")%>" size="5" maxlength="10" disabled></td>
				<TD align=middle><%=zt%> </TD>
                <TD align=center>
					<A href="edit.asp?id=<%=rs("id")%>">修改</A>|
					<%if rs("pass")="yes" then%>
					<A  href="make.asp?ac=ping1&id=<%=rs("id")%>"  target="theblank">屏蔽</A>
				  <%else%>
					<A  href="make.asp?ac=ping2&id=<%=rs("id")%>"  target="theblank">开放</A>
					<%end if%>|
					<A onClick="return confirm('确定要删除此招聘吗？');" href="make.asp?ac=del&id=<%=rs("id")%>" target="theblank">删除</A>&nbsp;
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
            </TBODY>
  </TABLE>
		  
    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
          <TBODY>
            <TR>
              <TD  height=30  >
               &nbsp;&nbsp; &nbsp;&nbsp;<input name=chkall onClick="CheckAll(this.form,'yes')"  type=button value="全选">
                &nbsp;&nbsp;
              <input name=chkOthers onClick="CheckOthers(this.form,'yes')"  type=button value="反选">
              &nbsp;&nbsp;
              <select id="ac" name="ac">
              <option value="px">修改显示顺序</option>
              <option value="del">删除职位信息</option>
              </select>
            <input type=submit  onClick="return confirm('确定要执行操作吗?')"  value="确定操作" name="submitn"></TD></TR>
          </TBODY>
      </TABLE>
		  

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
</FORM>
 <IFRAME id="theblank" name="theblank" style="WIDTH: 0px; HEIGHT: 0px" ></IFRAME>
