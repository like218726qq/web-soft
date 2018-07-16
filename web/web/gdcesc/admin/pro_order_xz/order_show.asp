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
sql="select * from pro_order_xz where id = "&id
rs.open sql,conn,1,3
if rs.eof then 
	call msg("记录不存在或已删除","")
else
	person_js=rs("person_js")
	z_body=rs("z_body")
	z_body1=rs("z_body1")
	ip=rs("ip")
	datehm=rs("datehm")
	title=rs("title")
	jianjie=rs("jianjie")'课程简介
	mubiao=rs("mubiao")'学习目标
	danci=rs("danci")'主要表达和单词
	taolun=rs("taolun")'今天问题和讨论
	leixing=rs("leixing")'类型
	pinglun=rs("pinglun")'讲师评论
	send_zt=rs("send_zt")
	wtime=rs("wtime")
	person_xs=rs("person_xs")
end if
rs("chakan")="yes"
rs.update
rs.close
set rs=nothing



'关闭数据库
closeconn
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品订购管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td colspan="2"  align="center">写作中心管理</td>
  </tr>
</table>
<br>
<form action="editt.asp" name="form1" method="post" onSubmit="return check()">
<input type="hidden" name="id"  id="id" value="<%=id%>">
<TABLE width="100%" border=0 cellPadding="2" cellSpacing="1" class=border>
    <tr class="title">
    <td colspan="2" align="center">查看信息</td>
    </tr> 
    <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD width="13%" height="20" align=right><strong>学员姓名： </strong></TD>
      <TD width="87%"><%=person_xs%></TD>
    </TR>
    <tr class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
    	<tD width="13%" height="20" align=right><strong>教师分配： </strong></tD>
  <td width="87%">
  		<select name="person_js">
            <option value="0">请选择教师</option>
             <%
                '连接数据库
                openconn
                
                set rs1=server.CreateObject("adodb.recordset")
                 sql="select * from person1 "
                rs1.open sql,conn,1,1
                while not rs1.eof
            %> 
            <option value="<%=rs1("id")%>"><%=rs1("username")%></option>
              <%
                rs1.movenext
                wend
                rs1.close
                set rs1=nothing
                '关闭数据库
            closeconn
                
            %>
         </select>
         <script>
            document.form1.person_js.value=<%=person_js%>;
         </script>        </td>
    </tr>

      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD width="12%" height="20" align=right><strong> 课程标题： </strong></TD>
        <TD width="88%"><textarea name="title" cols="72" rows="4" id="title"><%=title%></textarea></TD>
    </TR>
        
   <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 在线写作内容：</strong></TD>
        <TD><%=z_body%></TD>
    </TR>
   <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 教师在线批改：</strong></TD>
        <TD>   <strong> <!-- #INCLUDE file="../fckeditor.asp" -->
			<%
            Dim oFCKeditor
            Set oFCKeditor = New FCKeditor
            oFCKeditor.Config("LinkBrowser") = "true" 
            oFCKeditor.Config("ImageBrowser") = "true" 
            oFCKeditor.Config("FlashBrowser") = "true" 
            oFCKeditor.Config("LinkUpload") = "true" 
            oFCKeditor.Config("ImageUpload") = "true" 
            oFCKeditor.Config("FlashUpload") = "true" 
            oFCKeditor.Value = z_body1
            oFCKeditor.Create "z_body1"
            %></strong></TD>
    </TR>
   <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 教师评语：</strong></TD>
        <TD>   <strong>
			<%
            oFCKeditor.Value =pinglun
            oFCKeditor.Create "pinglun"
            %></strong></TD>
    </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>修改状态： </strong></TD>
        <TD><input type="radio" name="send_zt" value="no" <%if send_zt="no" then response.write " checked=""checked""" end if%>/> 否
<input type="radio" name="send_zt" value="yes" <%if send_zt="yes" then response.write " checked=""checked""" end if%>/> 是</TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>评语状态： </strong></TD>
        <TD><input type="radio" name="taolun" value="no" <%if taolun="no" then response.write " checked=""checked""" end if%>/> 否
<input type="radio" name="taolun" value="yes" <%if taolun="yes" then response.write " checked=""checked""" end if%>/> 是</TD>
      </TR>
 
<!--      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD width="12%" height="20" align=right><strong> 课程标题： </strong></TD>
        <TD width="88%">< %=rs("title")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 量： </strong></TD>
        <TD>< % =rs("order_num")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>联&nbsp;&nbsp;系&nbsp;&nbsp;人： </strong></TD>
        <TD>< %=rs("rename")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 件： </strong></TD>
        <TD>< %=rs("email")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 联系电话： </strong></TD>
        <TD>< %=rs("phone")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 联系传真： </strong></TD>
        <TD>< %=rs("fax")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 编： </strong></TD>
        <TD>< %=rs("post")%></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 址： </strong></TD>
        <TD>< %=rs("address")%></TD>
      </TR>-->
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 递交日期： </strong></TD>
        <TD><%=wtime%></TD>
      </TR>
</TABLE>
  <INPUT type="submit" id="b1" name="b1"   value=" 修 改 " > &nbsp;       <input name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="location='<%=w_url%>'" style="cursor:hand;">  </p>
</form>
<p align="center">
<!--<input  type="button" name="button" value="返回" onclick="location='< %=request.ServerVariables("HTTP_REFERER")%>'"/>-->
</p>

</body>
</html>