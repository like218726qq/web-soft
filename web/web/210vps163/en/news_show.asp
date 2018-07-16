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
		img_sl=rs("img_sl")
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
<title><%=ying0%></title>
<meta content="<%=ying1%>" http-equiv="keywords" />
<meta content="<%=ying2%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
</head>
<body>
<!--#include file="top_1backup.asp"--> 
<div class="bannerback">
<!--开始-->
 <%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 1 * from info_co where lm=29 order by px desc,id desc"
                 rs.open sql,conn,1,1
                 while not rs.eof
               %>
                    	<img src="../<%=rs("img_sl")%>" alt="" />
               <%
                  rs.movenext
                  wend
                  rs.close
                  set rs=nothing
               %>
<!--结束-->
</div>
<!--end box-1-->
<div class="box-2">
  <div class="main">
    <div class="pro-left-bar">
   <table border="0" cellpadding="0" cellspacing="0">
     <tr><td style=" width:288px; height:424px; background:url(images/news_left.jpg) left top no-repeat; " valign="top">
	
	
     <table border="0" cellpadding="0" cellspacing="0">
     <tr><td style=" width:288px; height:26px;">&nbsp;</td></tr>
     <tr><td style=" width:288px; padding-bottom:30px; " valign="top">
     <div class="pro-Main-list">
 <br/> <ul class="n-list">
       <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=16 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
      
             <li><a href="news.asp?lm=<%=rs("id_lm")%>" class="p1"><%=rs("title_lm")%></a></li><br/>
 <%  rs.movenext
    wend
	rs.close
	set rs=nothing
%>
            </ul>
   
      <div class="clear"></div></div>
     </td></tr>
     <tr><td style=" width:288px; height:6px;"></td></tr>
     </table>
	 </td></tr>
	  <tr><td style=" width:288px; height:6px;"><img src="images/ny1_23.jpg" alt="" /></td></tr>
	 </table><!--end proDwon-->
    </div>
    <!--end pro-left-bar-->
    <div class="pro-right-bar">
   	  <div class="proT"><p>News </p></div>
      <div class="proM">
       <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style=" width:700px; height:345px; padding:10px;" align="center" valign="top">
      <!--开始-->
      <table border="0" cellpadding="0" align="center" cellspacing="0">
    
      <tr>
        <td style=" width:660px; height:30px; border-bottom:1px #CCC solid;" align="center"><%=title%></td></tr>
      <tr>
        <td style=" height:20px; padding-right:30px;" align="right">TIME：<%=wtime%></td></tr>
        <tr>
		
		 <tr>
        <td style=" height:20px; padding-left:30px;" align="left"></td></tr>
        <tr>
        <td style=" height:20px; padding:10px; text-align:left;  line-height:180%;" align="right" valign="top"><%=z_body%></td></tr>
        <tr>
        <td style=" height:20px; padding-right:30px;" align="right"><a href="javascript:history.back();">[back]</a></td></tr>
      </table>
      <!--结束-->
      </td></tr>
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
