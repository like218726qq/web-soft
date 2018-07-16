<!--#include file="conn.asp"-->
<%
	lm=request("lm")
	if lm<>"" then
		if not checknum(lm) then
			call msg("Parameter error","")
		else
			tid=clng(lm)
			sql="select id_lm,title_lm from info_lm where id_lm="&tid&""
			set rs=server.CreateObject("adodb.recordset")
			rs.open sql,conn,1,1
			if not rs.eof then
				tid=rs("id_lm")
				title_lm=rs("title_lm")
			end if
			rs.close
			set rs=nothing
			dao=title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
	else
	    a=1
		sql="select id_lm,title_lm from info_lm where fid=5 order by px desc,id_lm desc"
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn,1,1
		if not rs.eof then
			title_lm="All News"
			dao=title_lm
			while not rs.eof 
			   if a=1 then
			      temp=rs("id_lm")
			   else
			      temp=temp&","&rs("id_lm")
			   end if
			rs.movenext
			a=a+1
			wend 
			sq=" and lm in("&temp&")"
			pra="&lm="&lm&""
		else
		    sq="and lm=6"
		end if
		rs.close
		set rs=nothing
	end if
%>
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
        <td height="47" align="center" class="nei_fenl">News Center</td>
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
        <td height="38" class="zhans"><A href="news.asp">News</A></td>
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
            <div style="padding:20px; width:690px; padding-top:5px; height:auto !important; height:390px; min-height:390px;">
            <ul class="news_list">
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,wtime from info_co where pass='yes' "&sq&" order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=12
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
            <li><span>[<%=formatdate(rs("wtime"))%>]</span><img src="images/ico.png" />
            <a href="news_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
<%
	    a=a+1
		rs.movenext
		wend
	else
	  response.Write("<div style='width:600px; margin:0 auto; padding-top:20px;'>Information update...</div>")
	end if
	rs.close
	set rs=nothing
%> 
</ul>
            </div>
             <table width="690" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            <table width="690" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td align="center" style=" text-align:center"><%if pagenum<>"" then call listpage_num(pra) end if%></td>
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
