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
         <td style="background:url(images/pro_06.jpg); width:715px; height:23px; color:#a18307; font-size:14px; font-weight:bold; padding:6px 0 0 22px;" valign="middle"> 明星员工</td>
      </tr>
      <tr>
        <td style="line-height:26px; padding:10px 5px; color:464646; font-weight:500;" >
          <table border="0" align="left" cellpadding="0" cellspacing="0" >
          <tr>
          <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from pro_co2 where pass='yes' order by px desc,id desc"
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
            <td width="250" height="131" valign="top"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="90" height="104"><a href="star_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>"  border="0" /></a></td>
                <td style="line-height:20px; padding-left:7px;"><table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td colspan="2">
                    <table border="0" cellpadding="0" cellspacing="0" width="140">
                    	<tr>
                        	<td colspan="2" align="left" valign="middle"><a href="star_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
                        </tr>
                    	<tr>
                        	<td width="39">职务：</td>
                        	<td width="101"><%=rs("pro_danwei")%></td>
                        </tr>
                    	<tr>
                        	<td>区域：</td><td><%=rs("pro_color")%></td>
                        </tr>
                    	<tr>
                        	<td colspan="2" valign="top"><img src="images/jmwy_50.jpg"  /><%=rs("pro_guige")%></td>
                        </tr>
                    </table>
                    </td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
            <%
				if a mod 3=0 then response.Write "<tr></tr>"
				a=a+1
					rs.movenext
					wend
				end if
				rs.close
				set rs=nothing
			%>
          </tr>
        </table>
        </td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="botton.asp"-->
</body>
</html>
