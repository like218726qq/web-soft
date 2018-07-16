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
    <td width="214" valign="top"><!--#include file="left_product1.asp"-->
      <!--#include file="left_contact.asp"-->    </td>
    <td width="27">&nbsp;</td>
    <td width="737" valign="top"><table width="737" border="0" cellspacing="0" cellpadding="0" style="border-bottom:2px solid #e7e8e7; margin-bottom:28px;">
      <tr>
         <td style="background:url(images/pro_06.jpg); width:715px; height:23px; color:#a18307; font-size:14px; font-weight:bold; padding:6px 0 0 22px;" valign="middle"> 合作项目</td>
      </tr>
      <tr>
        <td><table border="0" cellpadding="0" cellspacing="0" class="cpfy" style="line-height:18px; color:464646; margin-top:17px;">
          <tr>
          <%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from info_co where lm=1 and pass='yes' "&sq&" order by px desc,id desc"
				rs.open sql,conn,1,1
				if not rs.eof then
					pagenum=6
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
            <td width="360" height="192" valign="top"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="290" height="192" align="center"><a href="project_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>"  border="0"/></a></td>
                </tr>
                <tr>
                  <td align="center" style="padding-top:5px;"><a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
                </tr>
            </table></td>
            <%
				if a mod 2=0 then response.Write "<tr></tr>"
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
