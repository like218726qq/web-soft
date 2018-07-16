<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11">&nbsp;</td>
    <td width="239" valign="top"><!--#include file="pro_left.asp"-->
 

      <table width="239" height="24" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <!--#include file="left_con.asp"--></td>
    <td width="36" height="100">&nbsp;</td>
    <td valign="top"><table width="707" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="379" height="29"><strong>人才招聘</strong></td>
        <td width="328" align="right" class="weiz" style="padding-right:15px;">您当前位置：<a href="index.asp">首页</a> &gt;&gt; <a href="#">人才招聘</a></td>
      </tr>
      <tr>
        <td colspan="2"><img src="images/products_tiao.jpg" width="707" height="1" /></td>
      </tr>
    </table>
      <table width="707" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      	<%
	Set rs= Server.CreateObject("ADODB.Recordset")
	sql="select *  from job  where pass='yes' order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=2
		rs.pagesize=pagenum
		counter=rs.recordcount
		pagezong=rs.pagecount
		pageno=replace(trim(request.querystring("page")),"'","")
		if pageno="" or not isnumeric(pageno) then 
			pageno=1
		end if
		if pageno<1 then
		    pageno=1
		end if
		if pageno-pagezong>0 then 
			pageno=pagezong
		end if
		pageno=clng(pageno)
		rs.absolutepage=pageno
		a=1
	while not rs.eof and a<=pagenum
	%>	
    <TABLE cellSpacing="1" cellPadding="3" width="100%" border="0"  bgcolor="#CCCCCC" style="margin-bottom:20px;">
              <TR bgColor="#ffffff">
                <TD width="15%" height="36" align="right" bgColor="#f3f3f3"><strong>职位名称：</strong></TD>
                <TD colSpan="3" align="left"><%=rs("title")%></TD>
                </TR>
              <TR bgColor="#ffffff">
                <TD height="60" align="right" vAlign="top" bgColor="#f3f3f3"><strong>职位要求：</strong></TD>
                <TD  colSpan="3" align="left" valign="top" style="line-height:20px; "><%=rs("z_body")%></TD>
              </TR>
              <TR bgColor="#ffffff">
                <TD align="right" bgColor="#f3f3f3" height="18"><strong>招聘人数：</strong></TD>
                <TD width="45%" align="left"><%=rs("num")%></TD>
                <TD align="middle" width="16%"  bgColor="#f3f3f3"><strong>工作地点：</strong></TD>
                <TD width="24%" align="left"><%=rs("address")%></TD>
              </TR>
              <TR bgColor="#ffffff">
                <TD align="right" bgColor="#f3f3f3" height="18"><strong>发布日期：</strong></TD>
                <TD width="45%" align="left"><%=rs("wtime")%></TD>
                <TD align="middle" width="16%"  bgColor="#f3f3f3"><strong>结束日期：</strong></TD>
                <TD align="left"><%=rs("etime")%></TD>
              </TR>
             </TABLE>
 <%
        a=a+1
        rs.movenext
        wend
        rs.close
        set rs=nothing
		end if
     %>            
    <div class="page"><%if pagenum<>"" then call listpage(pra) end if%></div>         
    </td>
  </tr>
</table>


<!--#include file="foot.asp"-->