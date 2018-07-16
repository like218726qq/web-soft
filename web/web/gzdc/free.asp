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
		<!--#include file="left_product1.asp"-->
		<!--#include file="left_contact.asp"-->
    </td>
    <td width="27">&nbsp;</td>
    <td width="737" valign="top"><table width="737" border="0" cellspacing="0" cellpadding="0" style="border-bottom:2px solid #e7e8e7; margin-bottom:28px;">
      <tr>
         <td style="background:url(images/pro_06.jpg); width:715px; height:23px; color:#a18307; font-size:14px; font-weight:bold; padding:6px 0 0 22px;" valign="middle"> 免佣金房源</td>
      </tr>
      <tr>
        <td style="padding:10px 5px;"><table border="0" align="center" cellpadding="0" cellspacing="0" class="fy">
          <tr>
          <%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from info_co where lm=2 and pass='yes' "&sq&" order by px desc,id desc"
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
					pageno=clng(pageno)
					rs.absolutepage=pageno
					a=1
					while not rs.eof and a<=pagenum
			%>
            <td width="156" height="155" align="center" valign="top"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="126" height="96" class="cpbk"><a href="free_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>"  border="0"/></a></td>
              </tr>
              <tr>
                <td height="50" align="center" class="cpfy" style="line-height:18px;">
                	<table border="0" cellpadding="0" cellspacing="0">
                    	  <tr>
                              <td align="center" style="padding-top:5px;"><a href="free_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
                            </tr>
                            <tr>
                              <td align="center"><%=rs("f_body")%><br />
                                <%=rs("info_from")%></td>
                            </tr>
                            <tr>
                              <td align="center" style="color:#d72815; font-weight:bold;"> <%=rs("info_author")%></td>
                            </tr>
                    </table>
                </td>
              </tr>
            </table></td>
             <%
				if a mod 5=0 then response.Write "<tr></tr>"
					a=a+1
					rs.movenext
					wend
				end if	
				rs.close
				set rs=nothing
			%>
          </tr>
        </table>
          <span style="padding-bottom:9px; padding-top:18px;"><%if pagenum<>"" then call listpage(pra) end if%></span>
          <table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center" style="padding-bottom:9px; padding-top:18px;">&nbsp;</td>
            </tr>
          </table></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="botton.asp"-->
</body>
</html>
