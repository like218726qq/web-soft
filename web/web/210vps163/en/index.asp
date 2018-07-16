<!--#include file="conn.asp"--> 

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
<!--#include file="top_1.asp"--> 
<!--end box-1-->
<div class="box-2">
	<div class="content">
	<div class="left-bar">
   	  <div class="about">
       	<table border="0" cellpadding="0" cellspacing="0">
		<tr><td style=" width:193px; height:45px;"><a href="abou_t.asp" style=" width:190px; height:45px; display:block;">&nbsp;</a></td></tr>
		<tr><td style=" padding-top:10px;" align="center"]>
		<a href="abou_t.asp"><img src="images/ind_27.jpg" /></a>
          
		</td></tr>
		<tr><td style=" width:193px; height:25px;  padding-left:10px;"> <%
						set rs=server.CreateObject("adodb.recordset")
						sql="select top 1 * from tol_co where lm=6"
						rs.open sql,conn,1,1
						if not rs.eof then
							response.write cutStr(rs("z_body"),57)+"...."
						end if
						rs.close
						set rs=nothing
					%>      <a href="abou_t.asp">[more+]</a></td></tr>
		</table>
      </div>
        <div class="professional">
        	<table border="0" cellpadding="0" cellspacing="0">
		<tr><td style=" width:193px; height:45px;"><a href="categry_view.asp?dlm=2" style=" width:190px; height:45px; display:block;">&nbsp;</a></td></tr>
		<tr><td style=" padding-top:10px;" align="center"]>
		<a href="categry_view.asp?dlm=2" ><img src="images/ind_31.jpg" /></a>
          
		</td></tr>
		<tr><td style=" width:193px; height:25px; padding-left:10px;"> 
		<!--分类-->
		<ul><!--getstr-->
                    <%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 3 * from pro_lm where fid=2 order by px desc,id_lm desc"
                 rs.open sql,conn,1,1
                 while not rs.eof
               %>
                    	<li><a href="product.asp?dlm=<%=rs("fid")%>&xlm=<%=rs("id_lm")%>"><%=getstr(rs("title_lm_en"),10)%>...</a></li>
                        <%
                  rs.movenext
                  wend
                  rs.close
                  set rs=nothing
               %>
                    </ul>
		<!--分类-->
		</td></tr>
		</table>
      </div>
        <div class="archite">
      <table border="0" cellpadding="0" cellspacing="0">
		<tr><td style=" width:193px; height:45px;"><a href="categry_view.asp?dlm=3" style=" width:190px; height:45px; display:block;">&nbsp;</a></td></tr>
		<tr><td style=" padding-top:10px;" align="center"]>
		<a href="categry_view.asp?dlm=3"><img src="images/ind-123456.JPG" /></a>
          
		</td></tr>
		<tr><td style=" width:193px; height:25px; padding-left:10px;"> 
		<!--分类-->
		<ul><!--getstr-->
                    <%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 3 * from pro_lm where fid=3 order by px desc,id_lm desc"
                 rs.open sql,conn,1,1
                 while not rs.eof
               %>
                    	<li><a href="product.asp?dlm=<%=rs("fid")%>&xlm=<%=rs("id_lm")%>"><%=getstr(rs("title_lm_en"),10)%>...</a></li>
                        <%
                  rs.movenext
                  wend
                  rs.close
                  set rs=nothing
               %>
                    </ul>
		<!--分类-->
		</td></tr>
		</table>
      </div>
    </div><!--end left-bar-->
    <div class="right-bar">
   	  <div class="news">
        	<p><a href="news.asp" style=" width:360px; height:28px; display:block;"><img src="images/ind_03a.jpg" /></a></p>
            <div class="news-main">
            	<div class="new-L"><img src="images/ind_07a.jpg" /></div>
              <div class="newList">
                	<ul><!--getstr-->
                    <%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 4 * from info_co where lm in(19,20,21) order by px desc,id desc"
                 rs.open sql,conn,1,1
                 while not rs.eof
               %>
                    	<li><img src="images/ind_10a.jpg" /><a href="news_show.asp?id=<%=rs("id")%>"><%=getstr(rs("title"),18)%>...</a></li>
                        <%
                  rs.movenext
                  wend
                  rs.close
                  set rs=nothing
               %>
                    </ul>
                </div>
            </div>
        </div>
        <div class="down">
        <p><a href="download.asp"  style=" width:360px; height:28px; display:block;"><img src="images/ind_14a.jpg" /></a></p>
            <div class="down-main">
            	<div class="down-L"><img src="images/ind_16a.jpg" /></div>
              <div class="downList">
                	<ul>
                    	<%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 4 id_lm,title_lm,add_xx,xia from info_lm where fid=17 order by px desc,id_lm desc"
                 rs.open sql,conn,1,1
                 while not rs.eof
               %>
                    	<li><img src="images/ind_10a.jpg" /><a href="download.asp?id_lm=<%=rs("id_lm")%>"><%=cutStr(rs("title_lm"),40)%></a></li>
                        <%
                  rs.movenext
                  wend
                  rs.close
                  set rs=nothing
               %>
                    </ul>
                </div>
            </div>
        </div>
    </div><!--end right-bar-->
    </div><!--end content-->
    <div class="clear"></div>
</div><!--end box-2-->
<!--#include file="foot.asp"--> 
</body>
</html>
