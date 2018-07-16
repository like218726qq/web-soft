<!--#include file="conn.asp"--> 
<%
	lm=request("id_lm")
	dlm=request("dlm")
	keyword=bsql(html(trim(request("keyword"))))
	
			  
	if lm<>"" then
		if not checknum(lm) then
			call msg("参数错误","")
		else
			lm=clng(lm)
			set rs=server.CreateObject("adodb.recordset")
			sql="select a.id_lm,a.title_lm_en as xtitle,b.title_lm as dtitle from pro_lm a, pro_lm b where a.fid=b.id_lm and a.id_lm="&lm&""
			rs.open sql,conn,1,1
			if not rs.eof then
				dao=" &gt; "&rs("dtitle")&" &gt; "&rs("xtitle")&""
				'lm=rs("id_lm")
				'title_lm_en=rs("title_lm_en")
				'dao=" &gt; "&title_lm_en
				sq=" and lm="&lm&""
				pra="&lm="&lm&""
			end if
			'set rs=server.CreateObject("adodb.recordset")
			'sql="select id_lm,fid,title_lm,title_lm_en from pro_lm where id_lm="&lm&""
			'rs.open sql,conn,1,1
			'if not rs.eof then
				'lm=rs("id_lm")
				'title_lm_en=rs("title_lm_en")
				'dao=" &gt; "&title_lm_en
				'sq=" and lm="&lm&""
				'pra="&lm="&lm&""
			'end if
			rs.close
			set rs=nothing
		end if
	else
		dao=""
		sq=""
		pra=""
	end if
	
	if keyword<>"" then
		dao=" &gt; search result"
		sq=" and title like'%"&keyword&"%'"
		pra="&keyword="&server.URLEncode(keyword)&""
	end if 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong0%></title>
<meta content="<%=zhong1%>" http-equiv="keywords" />
<meta content="<%=zhong2%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
</head>
<body>
<!--#include file="top_1backup.asp"-->
<!--end box-1-->
<div class="box-2">
  <div class="main">
  <div class="pro-left-bar">
     <!--#include file="pro_categry.asp"-->
    </div>
     <!--end pro-left-bar-->
    <div class="pro-right-bar">
   	  <div class="proT"><p>产品中心 <%=dao%></p></div>
      <div class="proM">
       <table border="0" cellpadding="0" cellspacing="0">
      <tr><td style=" width:700px; height:315px; padding:10px;" valign="top">
      <!--开始-->
      <table border="0" cellpadding="0" cellspacing="0">
      <tr>
      <%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select id,title,img_sl,f_body from pro_co where pass='yes' "&sq&" order by px desc,id desc"
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
      <td style=" width:220px; height:200px;" align="<% if a mod 2=1 then response.write"center" else response.Write"center" end if %>" valign="top">
      
 <table border="0" cellpadding="0" cellspacing="0">
      <tr><td style=" width:200px; height:200px; border:2px #CCC solid;" align="center" valign="middle">
<a href="product_show.asp?id=<%=rs("id")%>&dlm=<%=dlm%>"><img src="../<%=rs("img_sl")%>" width="200" height="200" /></a>
      </td></tr>
      <tr><td style=" width:200px; height:24px;" align="center"><a href="product_show.asp?id=<%=rs("id")%>&dlm=<%=dlm%>" style="font-weight:800"><%=rs("title")%></a>
      </td></tr>
      </table>
      
      </td>
      <% if a mod 3=0 then response.write"</tr><tr>" end if %>
			 <%
                    a=a+1
                    rs.movenext
                    wend
                end if	
                rs.close
                set rs=nothing
             %>
      </tr>
     
      </table>
      
     
      
       <!--结束-->
      </td></tr>
      <tr><td style=" height:30px;" align="center"><%if pagenum<>"" then call listpage(pra) end if%></td></tr>
      </table>
      </div>
      <div class="proB"><img src="images/ny_28.jpg" /></div>
    </div>
  </div>
  <!--end main-->
  <div class="clear"></div>
</div>
<!--end box-2-->
<!--#include file="foot.asp"--> 
</body>
</html>
