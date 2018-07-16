<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'连接数据库
openconn
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_style.css" rel="stylesheet" type="text/css">
<LINK href="../admin.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../function.js"></script>
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td colspan="2"  align="center">客服管理----添加客服</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td><a href="default.asp">客服管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加客服</a>&nbsp;</td>
  </tr>
</table>
<br>
<FORM name="form1" action="make.asp" method="post"  target="theblank" onSubmit="return checkyes(form1);">
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
              <TR align="center" class=title >
                <TD ><STRONG>选中</STRONG></TD>
                <TD><STRONG>类型</STRONG></TD>
                <TD align=left><STRONG>号码</STRONG></TD>
                <TD><strong>作用</strong></TD>
                <TD><strong>使用人</strong></TD>
                <TD><strong>排序</strong></TD>
                <TD><STRONG>常规管理操作</STRONG></TD>
              </TR>
			<%
			'连接数据库
			openconn
			
			Set rs= Server.CreateObject("ADODB.Recordset")
			sql="select *  from ser_co order by px desc,id desc"
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
              <TR class=tdbg onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
                <TD align=middle width=30><input name="id" id="id" type="checkbox" value="<%=rs("id")%>" onClick="checkpx(<%=rs("id")%>)"></TD>
                <TD align=middle>
				<%
				if rs("lm")="qq" then 
				lm="QQ"
				elseif rs("lm")="msn" then
				lm="MSN"
				elseif rs("lm")="skype" then
				lm="SKYPE"
				elseif rs("lm")="alibaba" then
				lm="商务通"
				elseif rs("lm")="aliwangwang" then
				lm="阿里旺旺"
				end if
				response.write lm
				%></TD>
                <TD align="left"><%=rs("haoma")%></TD>
				<TD align=middle><%=rs("kf_type")%></TD>
                <TD align=middle><%=rs("person")%></TD>
                <td align="center"><input name="<%=rs("id")%>" id="<%=rs("id")%>" type="text" value="<%=rs("px")%>" size="5" maxlength="10" disabled></td>
                <TD align=center>
					<A href="edit.asp?id=<%=rs("id")%>">修改</A>|
					<A onClick="return confirm('确定要删除此客服吗？');" href="make.asp?ac=del&id=<%=rs("id")%>" target="theblank">删除</A>&nbsp;
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
              <option value="px">修改选中排序</option>
              <option value="del">删除选中号码</option>
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
	 <br />
 <IFRAME id="theblank" name="theblank" style="WIDTH: 0px; HEIGHT: 0px" ></IFRAME>
