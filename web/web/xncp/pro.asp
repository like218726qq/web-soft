<!--#include file="conn.asp"-->
<%
	xlm=request("xlm")
	dlm=request("dlm")
	keyword=bsql(html(trim(request("keyword"))))
	
	if xlm<>"" then
		if not checknum(xlm) then
			call msg("参数错误","")
		else
			xlm=clng(xlm)
		end if
	end if
	if dlm<>"" then
		if not checknum(dlm) then
			call msg("参数错误","")
		else
			dlm=clng(dlm)
		end if
	end if

	if xlm<>"" and dlm<>"" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select a.id_lm,a.title_lm as xtitle,b.title_lm as dtitle from pro_lm a, pro_lm b where a.fid=b.id_lm and a.id_lm="&xlm&""
		rs.open sql,conn,1,1
		if not rs.eof then
			dao=" &gt; <a href=""product.asp?dlm="&dlm&""">"&rs("dtitle")&"</a> &gt; "&rs("xtitle")&""
		end if
		rs.close
		set rs=nothing
		sq=" and lm ="&xlm&""
		pra="&dlm="&dlm&"&xlm="&xlm&""
	elseif dlm<>"" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select id_lm,title_lm as dtitle from pro_lm where id_lm="&dlm&""
		rs.open sql,conn,1,1
		if not rs.eof then
			dao=" &gt; "&rs("dtitle")&""
		end if
		rs.close
		set rs=nothing
		sq=" and (lm="&dlm&" or lm in (select id_lm from pro_lm where fid="&dlm&")) "
		pra="&dlm="&dlm&""
	end if
	
	if keyword<>"" then
		sq=" and title like'%"&keyword&"%'"
		pra="&keyword="&server.URLEncode(keyword)&""
		dao=" &gt; 搜索结果"
	end if
	k=3
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=site_title%></title> 
<meta name="keywords" content="<%=site_key%>" />
<meta name="description" content="<%=site_des%>"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>

<body>
	<!--#include file="top.asp"-->
	<div class="main">
    <!--#include file="banner.asp"-->
        <div class="clear"></div>
        <div class="list">
        	<!--#include file="left_pro.asp"-->
        	<div class="listR">
            	<div class="listRt">产品展示</div>
            	<div class="Rcon">
                    <ul>
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
                    	<li>
                        	<div class="cont2Mimg"><a href="dispro.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" width="204" height="120" /></a></div>
                            <p><a href="dispro.asp?id=<%=rs("id")%>"><%=rs("title")%></a></p>
                        </li>
               <%
						a=a+1
						rs.movenext
						wend
					end if	
					rs.close
					set rs=nothing
				%>
                    </ul>  
                    <div style="float:left; padding-left:70px;"><%if pagenum<>"" then call listpage(pra) end if%></div>   
                </div>             
            </div>
        	<div class="clear"></div>
        </div>   
 	</div>      
    <div class="clear"></div>
	<!--#include file="foot.asp"-->
</body>
</html>
