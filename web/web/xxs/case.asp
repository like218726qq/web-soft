<!--#include file="conn.asp"--> 
<%k=6%>
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
            	<div class="listRt">合作案例</div>
            	<div class="Rcon">
                	<ul>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,wtime,img_sl from info_co where pass='yes' and lm=3 order by px desc,id desc"
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
                        <li>
                        	<div class="cont2Mimg"><a href="discase.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" width="204" height="120" /></a></div>
                            <p><a href="discase.asp?id=<%=rs("id")%>"><%=rs("title")%></a></p>
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
