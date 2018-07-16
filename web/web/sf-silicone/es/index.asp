<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong(0)%></title>
<meta content="<%=zhong(1)%>" http-equiv="keywords" />
<meta content="<%=zhong(2)%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header-->
<!--#include file="header.asp"-->
<!--#banner-->

<!--middle-->
<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="9" valign="top"><img src="images/news_zuo.jpg" width="10" height="40" /></td>
    <td width="1006" valign="top" bgcolor="#FFFFFF"><table width="1006" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="40" valign="top" class="xinw" style=" padding-top:8px;">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="100%" height="20" class="font4" valign="middle">
        <ul id="limrq" style="overflow:hidden;height:20px;line-height:20px;">
           <%
		       set rs=server.CreateObject("adodb.recordset")
			   sql="select id,title,wtime from info_co where lm=21 and pass='yes' and tuijian='yes' order by px,id desc"
			   rs.open sql,conn,1,1
			   if not rs.eof then
			   while not rs.eof
		   %>
            <LI><A href="news_show.asp?id=<%=rs("id")%>">[<%=formatdate(rs("wtime"))%>]<%=rs("title")%></A></LI>
            <%
			   rs.movenext 
			   wend
			   end if
			   rs.close 
			   set rs=nothing
			%>
        </ul>
        <script type="text/javascript">
		var mrqInterval=new Object;
		var mrqn;
		var limrq=document.getElementById("limrq");
		var lml=limrq.getElementsByTagName("li").length;
		function liMarquee(){
			limrq.scrollTop++;
			if(limrq.scrollTop%20==0){
				clearInterval(mrqInterval[0]);
				}
			}
		function nxtmrq(){
			if(mrqn<lml){
				mrqInterval[0]=window.setInterval("liMarquee()",20);
				mrqn++;
				}
			else{
				limrq.scrollTop=0;
				mrqn=0;
				nxtmrq();
				}
			}
		function intimrq(){
			limrq.scrollTop=0;
			mrqn=0;
			mrqInterval[1]="";
			clearInterval(mrqInterval[1]);
			mrqInterval[1]=window.setInterval("nxtmrq()",3000);
			}
		limrq.innerHTML+="<li>"+limrq.getElementsByTagName("li")[0].innerHTML+"</li>";
		limrq.onmouseover=function(){
			clearInterval(mrqInterval[1]);
			}
		limrq.onmouseout=function(){
			mrqInterval[1]=window.setInterval("nxtmrq()",5000);
			}
		window.onload=intimrq;
		</script>
        </td>
        <td width="234" align="right">&nbsp;</td>
      </tr>
    </table>
        </td>
      </tr>
    </table>
      <table width="994" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/bk_shang.jpg" width="994" height="4" /></td>
        </tr>
        <tr>
          <td background="images/bk_zhong.jpg" style="padding-left:19px; padding-top:4px;"><table width="955" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="290" valign="top"><table width="290" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="24" background="images/news.jpg" class="news_font1">PRODUCTOS NUEVOS
                  <span style=" margin-top:3px; margin-right:5px; float:right">
                  <a href="product.asp"><img src="images/jiahao.jpg" title="查看更多..."/></a></span></td>
                </tr>
                <tr>
                  <td valign="top" style="padding-top:20px;">
                   <%
					   set rs=server.CreateObject("adodb.recordset")
					   sql="select top 1 id,title_es,img_sl,z_body_es from pro_co where pass='yes' and tuijian='yes' and hot='yes' order by px,id desc"
					   rs.open sql,conn,1,1
					   if not rs.eof then
					   while not rs.eof
				   %>
                   <span class="news_font"><a href="product_show.asp?id=<%=rs("id")%>"><%=left(rehtml(rs("z_body_es")),720)&"..."%>
                  </a></span><span class="news_font1"><a href="product_show.asp?id=<%=rs("id")%>">más+</a></span>
                   <%
			   rs.movenext 
			   wend
			   end if
			   rs.close 
			   set rs=nothing
			%>
                  </td>
                </tr>
              </table></td>
              <td width="52" align="center" valign="top"><img src="images/tiao.jpg" width="7" height="199" />
              </td>
              <td width="613" valign="top" style="padding-top:14px;"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                 <%	
					set rs=server.CreateObject("adodb.recordset")
					sql="select top 3 id,title_es,img_sl from pro_co where pass='yes' and tuijian='yes' order by px desc,id desc"
					rs.open sql,conn,1,1
					if not rs.eof then
					a=1
					while not rs.eof 
				%>

                  <td <%if a mod 3<>0 then%>width="212"<%end if%>><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="ind_img" valign="middle" align="center">
                      <a href="product_show.asp?id=<%=rs("id")%>" title="<%=rs("title_es")%>">
                      <img src="../<%=rs("img_sl")%>" /></a></td>
                    </tr>
                    <tr>
                      <td height="40" align="center" class="news_font1">
                      <a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title_es")%></a></td>
                    </tr>
                  </table></td>
                  <%
					a=a+1
					rs.movenext
					wend
			'    else
'				    response.Write("<div style='width:600px; margin-top:60px; text-align:center'>Information update</div>")
				end if	
				rs.close
				set rs=nothing
			%>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td><img src="images/bk_xia.jpg" width="994" height="4" /></td>
        </tr>
      </table>
      <table width="994" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="5"></td>
        </tr>
      </table></td>
    <td width="9" valign="top"><img src="images/news_you.jpg" width="10" height="40" /></td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="6" height="200">&nbsp;</td>
    <td width="994" valign="top"><table width="994" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/bk_shang.jpg" width="994" height="4" /></td>
      </tr>
      <tr>
        <td background="images/bk_zhong.jpg" style="padding-top:6px; padding-left:19px; padding-bottom:8px;"><table width="954" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="424" valign="top"><table width="424" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="24" background="images/about.jpg" class="news_font1">SOBRE NOSOTROS
                 <span style=" margin-top:3px; margin-right:5px; float:right">
                  <a href="about.asp"><img src="images/jiahao.jpg" title="Ver más..."/></a></span>                </td>
              </tr>
              <tr>
                <td valign="top" class="news_font" style="padding-top:24px;">
                  <%
				   set rs=server.CreateObject("adodb.recordset")
				   sql="select z_body,img_sl from tol_co where id=21" 
				   rs.open sql,conn,1,1
				   if not rs.eof then
				 %>
                <span class="news_font" style="padding-top:24px;">
                <img src="../<%=rs("img_sl")%>" width="215" height="112" class="ima1" /></span>
                 <%=rs("z_body")%>
                <span class="news_font1"><a href="about.asp">more+</a></span>
<%
				   end if
				   rs.close
				   set rs=nothing
				%>
</td>
              </tr>
            </table></td>
            <td width="44" height="100">&nbsp;</td>
            <td width="210" valign="top"><table width="210" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="24" background="images/product.jpg" class="news_font1">CASO<span style=" margin-top:3px; margin-right:5px; float:right">
                  <a href="case.asp"><img src="images/jiahao.jpg" title="Ver más..."/></a></span>                </td>
              </tr>
              <tr>
                <td style="padding-top:24px; ">
                <%
				    set rs=server.CreateObject("adodb.recordset")
					sql="select top 1 img_sl from info_co where lm=22 and pass='yes' and tuijian='yes'"
					rs.open sql,conn,1,1
					if not rs.eof then
				%>
                <A href="case.asp"><img src="../<%=rs("img_sl")%>" width="189" height="189" /></A>
                <%
				   end if
				   rs.close
				   set rs=nothing
				%>
                </td>
              </tr>
            </table></td>
            <td width="44">&nbsp;</td>
            <td width="232" valign="top"><table width="232" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="24" background="images/cantact.jpg" class="news_font1">contáctenos
                 <span style=" margin-top:3px; margin-right:5px; float:right">
                  <a href="contact.asp"><img src="images/jiahao.jpg" title="Ver más..."/></a></span>
                </td>
              </tr>
              <tr>
                <td height="24">&nbsp;</td>
              </tr>
              <tr>
                <td>
                
                 <%
				   set rs=server.CreateObject("adodb.recordset")
				   sql="select img_sl from tol_co where id=22" 
				   rs.open sql,conn,1,1
				   if not rs.eof then
				 %>
                 <img src="../<%=rs("img_sl")%>" width="232" height="82" />
                  <%
				   end if
				   rs.close
				   set rs=nothing
				%>
                </td>
              </tr>
              <tr>
                <td class="news_font" style="padding-top:5px; padding-left:3px;">
                 <%
				   set rs=server.CreateObject("adodb.recordset")
				   sql="select z_body from tol_co where id=22" 
				   rs.open sql,conn,1,1
				   if not rs.eof then
				   response.Write(rs("z_body"))
				   end if
				   rs.close
				   set rs=nothing
				%>
                </td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><img src="images/bk_xia.jpg" width="994" height="4" /></td>
      </tr>
    </table></td>
    <td width="6">&nbsp;</td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--footer-->
<!--#include file="footer.asp"-->
</body>
</html>
