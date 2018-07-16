<!--#include file="conn.asp"-->
<%
n=3

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

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header-->
<!--#include file="top.asp"-->


<div id="main">
   <!--内页左边-->
   <div class="main_left">
       <div class="mle_par1">
          <div class="mle_title">
             <img src="images/ny_02.jpg" />
             <ul>
                <li class="oms">详细信息</li>
             </ul>
          </div>
          <div class="clear"></div>
          <div class="mle_cont">
             <!--学校列表-->
             
             <div class="clear"></div>
             <div class="xylb2_1">
             	<table border="0" cellpadding="0" cellspacing="0" width="705" height="540">
                	<tr>
                    	<td valign="top">
                        	<div style="padding:0px 5px 2px 5px;">
                                <div style="text-align:center;font-weight:bold; font-size:14px; padding:5px 0 5px 0px;"><font style="color:<%=color_font%>;"><%=title%></font></div>
                                <div style="text-align:right; line-height:22px; color:#999; padding-bottom:5px;">时间：<%=wtime%></div>
                               
                                <div style="line-height:180%;"><%=z_body%></div>
                                <div style="text-align:right;"><a href="javascript:history.back();">[返回]</a></div>
                            </div>
                        </td>
                    </tr>
                </table> 
             </div>
           
             <div class="clear"></div>
          </div>
       </div>
       
       
       
   </div>
   
   <!--内页右边-->
   <div class="main_right">
       <!--微博栏-->
       <div class="wbl">
          <!--#include file="left_wb.asp"-->
       </div>
       <div class="clear"></div>
        <!--图片-->
        <!--#include file="left_bottom.asp"-->   
   </div>
   <div class="clear"></div>
</div>
<div id="footer">
	<!--#include file="bottom.asp"-->
</div>
</body>
</html>
