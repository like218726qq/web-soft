<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>港置地产代理(深圳)有限公司桂芳园分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#fffefa">
  <tr>
    <td width="11">&nbsp;</td>
    <td width="214" valign="top">
		<!--#include file="left_about.asp"-->
		<!--#include file="left_contact.asp"-->
    </td>
    <td width="27">&nbsp;</td>
    <td width="737" valign="top"><table width="737" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:28px;">
      <tr>
         <td style="background:url(images/pro_06.jpg); width:715px; height:23px; color:#a18307; font-size:14px; font-weight:bold; padding:6px 0 0 22px;" valign="middle"> 行业动态</td>
      </tr>
      <tr>
        <td style="line-height:26px; padding:10px 5px; color:464646; font-weight:500;">
          <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from info_co where lm=3 and pass='yes' order by px desc,id desc"
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
        	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">	
               <tr>				
                  <td style="border-bottom:dotted 1px #ccc; font-size:14px; font-weight:bold; color:#333333; padding-bottom:10px;" align="right" valign="middle" width="27">.</td>
                  <td width="605" align="left" valign="middle" style="border-bottom:dotted 1px #ccc; padding-left:5px;">
                    <a href="news_show.asp?id=<%=rs("id")%>"><font style="color:<%=rs("color_font")%>;"><%=rs("title")%></font></a>									   </td>
                 <td width="139" style="border-bottom:dotted 1px #ccc" height="30" align="center"> [<%=formatdate(rs("wtime"))%>]</td>
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
       		<div style="text-align:center; margin-top:50px; margin-left:200px; width:200px; vertical-align:top; font-size:12px;">暂无信息！</div>
            <%		
				end if
				rs.close
				set rs=nothing
			%>
            <%if pagenum<>"" then call listpage(pra) end if%>
        </td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="botton.asp"-->
</body>
</html>
