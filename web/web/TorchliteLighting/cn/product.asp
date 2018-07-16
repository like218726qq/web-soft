<!--#include file="conn.asp"-->
<%
	a=3
	lm=request("lm")
	keyword=bsql(html(trim(request("keyword"))))
	
	if lm<>"" then
		if not checknum(lm) then
			call msg("Parameter error","")
		else
			lm=clng(lm)
			set rs=server.CreateObject("adodb.recordset")
			sql="select id_lm,fid,title_lm from pro_lm where id_lm="&lm&""
			rs.open sql,conn,1,1
			if not rs.eof then
				lm=rs("id_lm")
				title_lm=rs("title_lm")
				dao=" &gt;&gt; "&title_lm
				sq=" and lm="&lm&""
				pra="&lm="&lm&""
			end if
			rs.close
			set rs=nothing
		end if
	else
		dao=""
		sq=""
		pra=""
	end if
	
	if keyword<>"" then
		dao=" &gt; 搜索结果"
		sq=" and title like'%"&keyword&"%'"
		pra="&keyword="&server.URLEncode(keyword)&""
	end if 
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
        <td width="105" class="zhans">产品展示</td>
        <td width="627" align="right" class="weiz" style="padding-right:20px;">当前位置：<a href="index.asp">首页</a> &gt;&gt; <a href="product.asp">产品中心</a> <%=dao%></td>
      </tr>
    </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="padding-top:8px; padding-left:11px;"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <%	
					set rs=server.CreateObject("adodb.recordset")
					sql="select id,title,img_sl from pro_co where pass='yes' "&sq&" order by px desc,id desc"
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
						pageno=clng(pageno)
						rs.absolutepage=pageno
						a=1
						while not rs.eof and a<=pagenum
				%>
              <td width="186"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="171" height="154" align="center" class="bk"><a href="product_show.asp?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" border="0" /></a></td>
                </tr>
                <tr>
                  <td height="30" align="center"><a style="color:#333333;" href="product_show.asp?id=<%=rs("id")%>"><%=getstr(rs("title"),24)%></a></td>
                </tr>
                <tr>
                  <td height="15">&nbsp;</td>
                </tr>
              </table></td>
				 <%
						if a mod 4 = 0 then response.Write("</tr><tr>")
						a=a+1
						rs.movenext
						wend
						end if	
						rs.close
						set rs=nothing
					%>
            </tr>
          </table></td>
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
