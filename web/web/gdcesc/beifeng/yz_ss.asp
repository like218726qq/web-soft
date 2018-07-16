<!--#include file="conn.asp"-->

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
                <li class="oms">硕士</li>
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
                          <%
								set rs=server.CreateObject("adodb.recordset")
								sql="select id,title,color_font,wtime from info_co where lm=42 and pass='yes' order by px desc,id desc"
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
									rs.absolutepage=pageno
									a=1
									while not rs.eof and a<=pagenum
							%>
							<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">	
						   <tr>				
							  <td style="border-bottom:dotted 1px #ccc; font-size:14px; font-weight:bold; color:#333333; padding-bottom:10px;" align="right" valign="middle" width="27">.</td>
							  <td width="605" align="left" valign="middle" style="border-bottom:dotted 1px #ccc; padding-left:5px;">
								<a href="yz_ss_show.asp?id=<%=rs("id")%>"><font style="color:<%=rs("color_font")%>;"><%=rs("title")%></font></a>									   </td>
							 <td width="139" style="border-bottom:dotted 1px #ccc" height="30" align="center"> <%=formatdate(rs("wtime"))%></td>
						  </tr>
						  <tr>
							  <td valign="top" colspan="3"><div class="fgx"></div></td>
						  </tr>
					   </table>
					   <%
								a=a+1
								rs.movenext
								wend
									else
						%>
						<div style="text-align:center; margin-top:50px; margin-left:200px; width:200px; vertical-align:top; font-size:12px;">暂无信息！</div>
						<%		
							end if
							rs.close
							set rs=nothing
						%>
                        <span style="padding:10px 0"><%if pagenum<>"" then call listpage(pra) end if%></span>
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
