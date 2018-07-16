<!--#include file="conn.asp"-->
<%
	a=5
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>钜丰源灯饰有限公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="213" valign="top">
      <!--#include file="left_pro.asp"-->
	  <!--#include file="left_con.asp"-->
    </td>
    <td width="15" height="100">&nbsp;</td>
    <td width="774" valign="top" bgcolor="#f8f8f8"><table width="774" border="0" cellpadding="0" cellspacing="0" background="images/products_03.jpg">
      <tr>
        <td width="42" height="33">&nbsp;</td>
        <td width="105" class="zhans">新闻资讯</td>
        <td width="627" align="right" class="weiz" style="padding-right:20px;">当前位置：<a href="index.asp">首页</a> &gt;&gt; 新闻资讯</td>
      </tr>
    </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="padding-top:15px; padding-left:11px;">
          	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="left" id="font_English"  style="padding-top:10px">
                      <%
						   set rs=server.CreateObject("adodb.recordset")
							sql="select * from info_co where pass='yes' and lm=1 order by px desc,id desc"
							rs.open sql,conn,1,1
							if not rs.eof then
								pagenum=15
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
								while not rs.eof and a<=pagenum
						%> 
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">					 
						 <tr>				
							<td style="border-bottom:dotted 1px #026AC1;" valign="middle" align="center" width="20">
							<img src="images/index_21.jpg"/></td>
							
							<td width="537" align="left" id="ll" style="border-bottom:dotted 1px #026AC1;" valign="middle">
							<a style="color:#036AC1;" href="news_show.asp?id=<%=rs("id")%>" ><%=rs("title")%></a></td>
							<td width="139" style="border-bottom:dotted 1px #026AC1;" height="30" align="center">[<%=year(rs("wtime"))&"-"&right("0"&month(rs("wtime")),2)&"-"&right("0"&day(rs("wtime")),2)%>]</td>
						</tr>
						<tr>
							<td valign="top" colspan="3"><div class="fgx"></div></td>
						</tr>
				</table>
					<%   
					a=a+1
					rs.movenext
					wend
					  else
                   %>
                       <div style="text-align:center; margin-top:100px; margin-left:200px; width:200px; vertical-align:top; font-size:12px;">暂无信息！</div>
                    <%		
                    end if	
					rs.close
					set rs=nothing
				%>
                </td>
              </tr></table>
          </td>
        </tr>
      </table>
      <table width="774" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" align="center" class="weiz"><%if pagenum<>"" then call listpage(pra) end if%></td>
        </tr>
      </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
