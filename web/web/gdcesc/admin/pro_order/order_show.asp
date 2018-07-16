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
else
	person_jsj=rs("person_jsj")
	person_jss=rs("person_jss")
	person_js=rs("person_js")
	z_body=rs("z_body")
	ip=rs("ip")
	datehm=rs("datehm")
	title_lm=rs("title_lm")
	title=rs("title")
	jianjie=rs("jianjie")'课程简介
	mubiao=rs("mubiao")'学习目标
	danci=rs("danci")'主要表达和单词
	taolun=rs("taolun")'今天问题和讨论
	leixing=rs("leixing")'类型
	pinglun=rs("pinglun")'讲师评论
	send_zt=rs("send_zt")
	send_xs=rs("send_xs")
	wtime=rs("wtime")
	person_xs=rs("person_xs")

end if
rs("chakan")="yes"
rs.update
rs.close
set rs=nothing

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品订购管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>

<script>
function createXMLHttpRequest() {
	var ajaxHttp=null;
	if(window.XMLHttpRequest) {
		ajaxHttp= new XMLHttpRequest();
	}
	else if(window.ActiveXObject) {
		ajaxHttp= new ActiveXObject("Microsoft.XMLHTTP");
	}
	return ajaxHttp
}
function getlun(ty){
	var ajaxHttp = createXMLHttpRequest();
	if (ajaxHttp!=null) {
		ajaxHttp.onreadystatechange =function(){
			if (ajaxHttp.readyState == 4){
				if (ajaxHttp.status == 200){
					str=ajaxHttp.responseText;
					document.getElementById('dis_zm').innerHTML=str;
				}
				 ajaxHttp = null;
			}
		}
		ajaxHttp.open("GET", "lm.asp?lm="+ty+"&r="+Math.random() ,true);
		ajaxHttp.setRequestHeader("Content-Type", "text/html;charset=utf-8");
		ajaxHttp.send(null);
	}
}
</script>
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td colspan="2"  align="center">产品中心管理----查看产品订单</td>
  </tr>
</table>
<br>
<form action="editt.asp" name="form1" method="post" onSubmit="return check()">
<input type="hidden" name="id"  id="id" value="<%=id%>">
<TABLE width="100%" border=0 cellPadding="2" cellSpacing="1" class=border>
    <tr class="title">
    <td colspan="2" align="center">查看订单</td>
    </tr> 
    <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD width="13%" height="20" align=right><strong>学员姓名： </strong></TD>
      <TD width="87%"><%=person_xs%></TD>
    </TR>
    <tr class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
    	<tD width="13%" height="20" align=right><strong>教师类型： </strong></tD>
  <td width="87%">
  
  			<select name="person_jsj" id="person_jsj" onchange="getlun(this.value)">
            <option value="" selected>选择教师类型</option>
                <%
				'连接数据库
    openconn
                    set rs_v=server.CreateObject("adodb.recordset")
                    sql_v="select * from info_co where lm=50 "
                    rs_v.open sql_v,conn,1,1
                    while not rs_v.eof
                %>
                <option value="<%=rs_v("id")%>" <% if person_jsj=rs_v("id") then response.Write("selected") end if %> ><%=rs_v("title")%></option>
                <%
                    rs_v.movenext
                    wend
                    rs_v.close
                    set rs_v=nothing
                %>
              </select>
             
           
          </td>
    </tr>   
     <tr class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
    	<tD width="13%" height="20" align=right><strong>教师： </strong></tD>
  <td width="87%">
  
  			   <div id="dis_zm" >
                <select name="person_jss" id="person_jss" >
                    <option value="" selected>选择教师</option>
                
					<%
                        set rs_c=server.CreateObject("adodb.recordset")
                        sql_c="select * from person1 where dj="&person_jsj&" order by id desc"
                        rs_c.open sql_c,conn,1,1
						
                        while not rs_c.eof
                            if person_jss=rs_c("id") then
                    %>
                    <option value="<%=rs_c("id")%>" selected="selected" ><%=rs_c("rename")%></option>
                    <%
                            end if
                        rs_c.movenext
                        wend
                        rs_c.close
                        set rs_c=nothing
	'关闭数据库
    closeconn
                    %>
                </select>
                </div>

           
          </td>
    </tr>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>预约时间： </strong></TD>
        <TD><%=datehm%></TD>
      </TR>
           <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>课程类型： </strong></TD>
        <TD><input name="title_lm" type="text" id="title_lm" size="50" maxlength="150" value="<%=title_lm%>" ></TD>
    </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD width="12%" height="20" align=right><strong> 课程标题： </strong></TD>
        <TD width="88%"><input name="title" type="text" id="title" size="50" maxlength="150" value="<%=title%>" ></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>课程简介： </strong></TD>
        <TD>
        <!-- #INCLUDE file="../fckeditor.asp" -->
			<%
            Dim oFCKeditor
            Set oFCKeditor = New FCKeditor
            oFCKeditor.Config("LinkBrowser") = "true" 
            oFCKeditor.Config("ImageBrowser") = "true" 
            oFCKeditor.Config("FlashBrowser") = "true" 
            oFCKeditor.Config("LinkUpload") = "true" 
            oFCKeditor.Config("ImageUpload") = "true" 
            oFCKeditor.Config("FlashUpload") = "true" 
            oFCKeditor.Value = jianjie
            oFCKeditor.Create "jianjie"
            %></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>学习目标： </strong></TD>
        <TD>
        <strong> 
			<%
            oFCKeditor.Value = mubiao
            oFCKeditor.Create "mubiao"
            %></strong>        </TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>主要表达和单词： </strong></TD>
        <TD><textarea name="danci" cols="72" rows="4" id="danci"><%=danci%></textarea></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>今天问题和讨论： </strong></TD>
        <TD><textarea name="taolun" cols="72" rows="4" id="taolun"><%=taolun%></textarea></TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>讲师评论： </strong></TD>
        <TD>
        <%
			oFCKeditor.Value = pinglun
			oFCKeditor.Create "pinglun"
		%>        </TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>教师授课状态： </strong></TD>
        <TD><input type="radio" name="send_zt" value="no" <%if send_zt="no" then response.write " checked=""checked""" end if%>/> 未授课
<input type="radio" name="send_zt" value="yes" <%if send_zt="yes" then response.write " checked=""checked""" end if%>/> 已授课</TD>
      </TR>
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong>学生确定授课状态： </strong></TD>
        <TD><input type="radio" name="send_xs" value="no" <%if send_xs="no" then response.write " checked=""checked""" end if%>/> 未完成
<input type="radio" name="send_xs" value="yes" <%if send_xs="yes" then response.write " checked=""checked""" end if%>/> 已完成</TD>
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
      <TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 递 交 ip： </strong></TD>
        <TD><%=ip%></TD>
      </TR>
      <!--<TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD height="20" align=right><strong> 简要说明：</strong></TD>
        <TD><%=z_body%></TD>
    </TR>-->
</TABLE>
  <INPUT type="submit" id="b1" name="b1"   value=" 修 改 " > &nbsp;       <input name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="location='<%=w_url%>'" style="cursor:hand;">  </p>
</form>
<p align="center">
<!--<input  type="button" name="button" value="返回" onclick="location='< %=request.ServerVariables("HTTP_REFERER")%>'"/>-->
</p>

</body>
</html>