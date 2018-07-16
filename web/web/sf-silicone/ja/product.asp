<!--#include file="conn.asp"-->
<%
	xlm=trim(request("xlm"))
	zlm=trim(request("zlm"))
	dlm=trim(request("dlm"))
	keyword=bsql(html(trim(request("keyword"))))

	'分类
	if xlm<>"" then 
		if not checknum(xlm) then
			call msg("パラメータエラー","")
		else
			xlm=clng(xlm)
		end if
	end if
	
	if zlm<>"" then 
		if not checknum(zlm) then
			call msg("Parameter error","")
		else
			zlm=clng(zlm)
		end if
	end if
	
	if dlm<>"" then 
		if not checknum(dlm) then
			call msg("Parameter error","")
		else
			dlm=clng(dlm)
		end if
	end if
	
	if xlm<>"" and zlm<>"" and dlm<>"" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select a.title_lm as xtitle,b.title_lm as ztitle,c.title_lm as dtitle from pro_lm a,pro_lm b,pro_lm c where a.id_lm="&xlm&" and a.fid=b.id_lm and b.fid=c.id_lm"
		rs.open sql,conn,1,1
		if not rs.eof then
			dao="<a href=""product.asp?dlm="&dlm&""">"&rs("dtitle")&"</a> &gt; <a href=""product.asp?zlm="&zlm&"&dlm="&dlm&""">"&rs("ztitle")&"</a> &gt; "&rs("xtitle")&""
		end if
		rs.close
		set rs=nothing
		sq=" and lm="&xlm&""
		pra="&xlm="&xlm&"&zlm="&zlm&"&dlm="&dlm&""
	elseif zlm<>"" and dlm<>"" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select a.id_lm,a.title_lm as ztitle,b.title_lm as dtitle from pro_lm a, pro_lm b where a.fid=b.id_lm and a.id_lm="&zlm&""
		rs.open sql,conn,1,1
		if not rs.eof then
			dao="<a href=""product.asp?dlm="&dlm&""">"&rs("dtitle")&"</a> &gt; "&rs("ztitle")&""
		end if
		rs.close
		set rs=nothing
		sq=" and (lm="&zlm&" or lm in (select id_lm from pro_lm where fid="&zlm&"))"
		pra="&zlm="&zlm&"&dlm="&dlm&""
		fid=zlm
	elseif dlm<>"" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select id_lm,title_lm as dtitle from pro_lm where id_lm="&dlm&""
		rs.open sql,conn,1,1
		if not rs.eof then
			dao=rs("dtitle")
		end if
		rs.close
		set rs=nothing
		sq=" and (lm="&dlm&" or lm in (select id_lm from pro_lm where fid="&dlm&") or lm in (select id_lm from pro_lm where fid in (select id_lm from pro_lm where fid="&dlm&")))"
		pra="&dlm="&dlm&""
		fid=dlm
	end if

	if keyword<>"" then
	    if keyword="キーワードを入力してください..." then
		ttt="Please enter a keyword!"
		else
		sq=" and title like'%"&keyword&"%'"
		pra="&keyword="&server.URLEncode(keyword)&""
		ttt="Search Results:"
		end if
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
        <td height="47" align="center" class="nei_fenl">商品リスト</td>
      </tr>
    </table>
      <table width="242" border="0" cellpadding="0" cellspacing="0" background="images/product1_fenl_beij.jpg">
        <tr>
          <td valign="top" style="padding-top:12px;">
          <!--product menu-->
          <!--#include file="left_pro.asp"-->
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
        <td height="38" class="zhans"><A href="product.asp">製品</A></td>
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
        <%if ttt<>"" then%>
            <tr><td style="height:30px; line-height:30px; text-align:left; font-weight:bold; text-indent:5px; background:url(images/product1_zhong.jpg)">
             <%=ttt%>
            </td></tr>
          <%end if%>
        <tr>
          <td background="images/product1_zhong.jpg" style="padding-top:19px; padding-left:41px; padding-bottom:8px; height:615px;" valign="top">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr>
            <%	
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title_en,img_sl,pro_guige from pro_co where pass='yes' "&sq&" order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=9
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

              <td <%if a mod 3<>0 then%>width="236"<%end if%>><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="imgt" valign="middle" align="center">
                  <a href="product_show.asp?id=<%=rs("id")%>">
                  <% if rs("img_sl")<>"" then%>
                  <img src="../<%=rs("img_sl")%>" alt="<%=rs("pro_guige")%>"/>
                  <%else%>
                  <img src="images/nopic.jpg" width="189" height="189" alt="<%=rs("pro_guige")%>"/>
                  <%end if%>
                  </a></td>
                </tr>
                <tr>
                  <td height="30" align="center" class="news_font1">
                  <a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title_en")%></a>
                  </td>
                </tr>
              </table></td>
              <%if a mod 3=0 then
			     response.Write("</tr><tr>")
			    end if
			  %>
              <%
					a=a+1
					rs.movenext
					wend
			    else
				    response.Write("<div style='width:600px; margin-top:60px; text-align:center'>情報更新...</div>")
				end if	
				rs.close
				set rs=nothing
			%>
            </tr>
          </table>
            <table width="660" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            <table width="660" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><%if pagenum<>"" then call listpage_num(pra) end if%></td>
              </tr>
            </table>
            <table width="660" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
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
