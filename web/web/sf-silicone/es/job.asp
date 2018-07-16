<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong(0)%></title>
<meta content="<%=zhong(1)%>" http-equiv="keywords" />
<meta content="<%=zhong(2)%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header-->
<!--#include file="header.asp"-->
<!--#banner-->

<!--middle-->
<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="9" valign="top"><img src="images/product1_10.jpg" width="9" height="47" /></td>
    <td width="248" align="right" valign="top" bgcolor="#FFFFFF"><table width="248" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="47" align="center" class="nei_fenl">Centro de noticias</td>
      </tr>
    </table>
      <table width="242" border="0" cellpadding="0" cellspacing="0" background="images/product1_fenl_beij.jpg">
        <tr>
          <td valign="top" style="padding-top:12px;">
          <!--product menu-->
          <!--#include file="left_news.asp"-->
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="35">&nbsp;</td>
              </tr>
            </table>
            <!--contact-->
            <!--#include file="left_cont.asp"-->
          </td>
        </tr>
      </table></td>
    <td width="18" height="100" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="733" valign="top" bgcolor="#FFFFFF"><table width="733" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="38" class="zhans"><A href="job.asp">trabajo</A></td>
      </tr>
    </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>

          <td><img src="images/product1_shang.jpg" width="733" height="4" /></td>
        </tr>
        <tr>
          <td background="images/product1_zhong.jpg" style="height:435px;" valign="top">
            <div style="padding:20px; width:690px; height:auto !important; height:390px; min-height:390px; padding-top:5px">
            <ul class="news_list">
   <%
	Set rs= Server.CreateObject("ADODB.Recordset")
	sql="select *  from job  where pass='yes' and lang='xi' order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=12
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
        <li><span><%=formatdate(rs("wtime"))%></span><img src="images/ico.png" />
            <a href="job_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
	<%
        a=a+1
        rs.movenext
        wend
		else
		  response.Write("<div style='width:100%; text-align:center; margin-top:100px '>No hay trabajos！</div>")
		end if 
        rs.close
        set rs=nothing
     %>
	  </ul>
            </div>

            <table width="690" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td align="center"><%if pagenum<>"" then call listpage_num(pra) end if%></td>
              </tr>
            </table>
            </td>
        </tr>
        <tr>
          <td><img src="images/product1_xia.jpg" width="733" height="5" /></td>
        </tr>
      </table></td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10">&nbsp;</td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--footer-->
<!--#include file="footer.asp"-->
</body>
</html>
