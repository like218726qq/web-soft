<!--#include file="conn.asp"-->
<%
	dlm=request("dlm")
	if dlm<>"" then
		if not checknum(dlm) then
			call msg("参数错误","")
		else
			dlm=clng(dlm)
		end if
	end if

	if dlm<>"" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from pro_lm where id_lm="&dlm&""
		rs.open sql,conn,1,1
		if not rs.eof then
			dao=" &gt; "&rs("title_lm_en")&""
		end if
		rs.close
		set rs=nothing
		sq="fid ="&dlm&""
		pra="&dlm="&dlm&""
	else
	    set rs=server.CreateObject("adodb.recordset")
		sql="select top 1 * from pro_lm where id_lm=2"
		rs.open sql,conn,1,1
		if not rs.eof then
			dao=""
		end if
		rs.close
		set rs=nothing
		sq="fid =2"
		pra="&dlm="&dlm&""
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
  <!--start pro-left-bar-->
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
				sql="select id_lm,fid,title_lm,title_lm_en,img_sl from pro_lm where "&sq&" order by px desc,id_lm desc"
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
      <td style=" width:220px; height:180px;" align="<% if a mod 2=1 then response.write"center" else response.Write"center" end if %>" valign="top">
      
 <table border="0" cellpadding="0" cellspacing="0">
      <tr><td style=" width:200px; height:200px; border:2px #CCC solid;" align="center" valign="middle">
<a href="product.asp?dlm=<%=rs("fid")%>&id_lm=<%=rs("id_lm")%>">
<%if rs("img_sl")<>"" then%>
<img src="../<%=rs("img_sl")%>" onload="if (this.width>200){this.height=this.width*this.height/200;this.width=200;"  />
<%else%>
<img src="images/categrypic.jpg" alt="" />
<%end if%>
</a>
      </td></tr>
      <tr><td style=" width:200px; height:24px;" align="center"><a href="product.asp?dlm=<%=rs("fid")%>&id_lm=<%=rs("id_lm")%>" style="font-weight:800"><%=rs("title_lm_en")%></a>
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
