<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>职位应聘管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
</head>

<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td  align="center">应聘管理首页</td>
  </tr>
</table>
<br />
<FORM name=form1  action="make.asp?ac=dell" method=post  onsubmit="return checkyes(form1);">
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" border=0>
<TBODY>
              <TR class=title >
                <TD align=middle ><STRONG>选中</STRONG></TD>
                <TD align=middle><STRONG>ID</STRONG></TD>
                <TD align=left><STRONG>应聘职位</STRONG></TD>
                <TD align=center><STRONG>姓名</STRONG></TD>
                <TD align=center><strong>日期</strong></TD>
				<TD align=center><strong>状态</strong></TD>
                <TD align=center><STRONG>常规管理操作</STRONG></TD>
              </TR>
			<%
			'连接数据库
			openconn
			
			set rs=server.CreateObject("adodb.recordset")
			sql="select * from job_yp order by id desc"
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
			zt="<font color='#cccccc'>已看</font>"
			else
			zt="<font color='blue'>未看</font>"
			end if
			%>

          <TR class=tdbg onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
                <TD align=middle width=30><input type=checkbox name="id" value="<%=rs("id")%>" ></TD>
                <TD align=middle><%=rs("id")%></TD>
                <TD ><%=rs("job_title")%></TD>
                <TD align="center"><%=rs("username")%></TD>
                <TD align="center" ><%=rs("wtime")%></TD>
				 <TD  align="center"><%=zt%></TD>
                <TD align="center" ><A href="yp_show.asp?id=<%=rs("id")%>"  >查看</A>&nbsp;<A href="make.asp?id=<%=rs("id")%>&ac=dell"  onClick="return confirm('确定要删除此简历吗？');">删除</A>&nbsp;</TD>
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
                <TR>
                    <TD height=30 align="left">				&nbsp;&nbsp; &nbsp;&nbsp;
                    <input name=chkall onClick=CheckAll(this.form,"no")  type=button value="全选">
                    &nbsp;&nbsp;
                    <input name=chkOthers onClick=CheckOthers(this.formm,"no")  type=button value="反选">
                    <input type="hidden" name="ac" value="dell">
                    <input type="submit" value="删除选中简历" name="submit1"  onClick="return confirm('真的要删除选中简历吗?')">
                    </TD>
                </TR>
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
<br>
<B><br>
</B><B>说明</B>：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1.<font color="#cccccc">已看</font>---该简历已经浏览过<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2.<font color="blue">未看</font>---该简历没有浏览过,是新提交的简历