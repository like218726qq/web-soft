<!--#include file="conn.asp"--> 

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
<div class="bannerback">
  <!--开始-->
 <%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 1 * from info_co where lm=27 order by px desc,id desc"
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
     <tr><td style=" width:288px; height:424px; background:url(images/company_left.jpg) left top no-repeat; " valign="top">
	 
     <table border="0" cellpadding="0" cellspacing="0">
     <tr><td style=" width:288px; height:26px; ">&nbsp;</td></tr>
     <tr><td style=" width:288px; padding-bottom:30px; " valign="top">
     <div class="pro-Main-list">
 <br/>
            <ul class="n-list">
        <li><a href="abou_t.asp" class="p1">关于我们</a></li>
         <li><a href="team.asp"  class="p1">团队协作</a></li>
		 <li><a href="culture.asp"  class="p1">企业文化</a></li>
            </ul>
   
      <div class="clear"></div></div>
     </td></tr>
     <tr><td style=" width:288px; height:6px;"></td></tr>
     </table></td></tr>
	 <tr><td style=" width:288px; height:6px;"><img src="images/ny1_23.jpg" alt="" /></td></tr>
	 </table>
      <!--end proDwon-->
    </div>
    <!--end pro-left-bar-->
    <div class="pro-right-bar">
   	  <div class="proT"><p>企业文化</p>
   	  </div>
      <div class="proM">
      <table border="0" cellpadding="0" cellspacing="0">
      <tr><td style=" width:660px; height:400px; padding:30px; line-height:180%" valign="top">
	  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=19"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.write rs("z_body")
	end if
	rs.close
	set rs=nothing
%>
	  
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
