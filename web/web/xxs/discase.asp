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
		color_font=rs("color_font")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from info_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" &gt; "&rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing
k=6
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
            	<div class="listRt">合作案例</div>
            	<div class="Rcon">
                	<div class="R1">
                    	<div class="R1img"><img src="<%=getbpic(img_sl,"d")%>"  width="360"/></div>
                        <div class="R1p">
                        	<p><b>案例名称：</b><%=title%></p>
                        </div>
                        <div class="clear"></div>
                    </div>
                	
                    <div class="R2">
                    <%=z_body%>
                    	<p><a href="javascript:history.back();">【返回】</a></p>
                    </div>        
                </div>    
            </div> 
        	<div class="clear"></div>
        </div>   
 	</div>      
    <div class="clear"></div>
	<div class="footer">
    	<!--#include file="foot.asp"-->
    </div>
</body>
</html>
