<!--#include file="conn.asp"-->
<%
	id=request("id")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		if rs("link_url")<>"" then
			response.Redirect rs("link_url"):response.End()
		end if
		lm=rs("lm")
		title=rs("title")
		info_from=rs("info_from")
		info_author=rs("info_author")
		color_font=rs("color_font")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
	    tid=rsa("id_lm")
		dao=""&rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing

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
        <td height="47" align="center" class="nei_fenl">ニュースセンター</td>
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
        <td height="38" class="zhans"><A href="news.asp">ニュース</A></td>
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
          <td background="images/product1_zhong.jpg" style="height:615px; color:#666666" valign="top">
<div style="padding:20px">
    <div style="text-align:center;font-weight:bold; font-size:14px; padding:5px 0 5px 0px;"><font style="color:#666666; font-size:16px"><%=title%></font></div>
    <div style="text-align:center; line-height:22px; padding-bottom:5px;">時間を投稿する：<%=wtime%> | ソース：<%=info_from%> | 筆者：<%=info_author%></div>
    <div style="line-height:180%; text-align:justify;text-justify:inter-ideograph"><%=z_body%></div>
    <div style="text-align:right;"><a href="javascript:history.back();">[バック]</a></div>
    <div class="nextlink">
		<%
        set rs=server.CreateObject("adodb.recordset")
        sql="select id,title from info_co where lm="&lm&" and pass='yes' order by px desc,id desc"
        rs.open sql,conn,1,1
        if not rs.eof then
         counter=rs.recordcount
         do while not rs.eof
            if rs("id")=cint(id) then
                rs.MovePrevious
                if not rs.bof then
                    response.write"前の記事：<a href=""news_show.asp?id="&rs("id")&""">"&rs("title")&"</a>"
                else
                    response.write "前の記事：これが第一です"
                end if
                rs.movenext
                rs.movenext
                response.write "<br/>"
                if not rs.eof then
                    response.write"次条：<a href=""news_show.asp?id="&rs("id")&""">"&rs("title")&"</a>"
                else
                    response.write "次条：すでに最後の1"
                end if
                exit do
            end if
         rs.movenext
         loop
         rs.movefirst
        end if
        rs.close
        set rs=nothing
        %>
              </div>
            </div>
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
