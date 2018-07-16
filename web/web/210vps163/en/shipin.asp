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
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">   
DD_belatedPNG.fix('.doc_img,');
</script>
<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
</head>
<body>
<!--#include file="top_1backup.asp"--> 
<div class="bannerback">
<!--开始-->
 <%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 1 * from info_co where lm=30 order by px desc,id desc"
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
  <!--#include file="pro_categry.asp"-->
  </div>
    <!--end pro-left-bar-->
    <div class="pro-right-bar">
   	  <div class="proT"><p>Download <%=dao%></p></div>
      <div class="proM">
       <table cellpadding="0" cellspacing="0" width="100%"><tr><td align="center" height="35">
        	<%=title%>
        </td></tr>
        <tr><td style="padding:5px;">
        	<%=z_body%>
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
