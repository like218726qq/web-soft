<!--#include file="conn.asp"-->
<%n=5%>
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
                <li class="oms">成功案例</li>
             </ul>
          </div>
          <div class="clear"></div>
          <div class="mle_cont">
             <!--学校列表-->
             
             <div class="clear"></div>
             <div class="xylb2_1">
             	<table border="0" cellpadding="0" cellspacing="0" width="705" height="510">
                	<tr>
                    	<td align="left" valign="top">
                        	<table border="0" cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	 <%	
										set rs=server.CreateObject("adodb.recordset")
										sql="select * from pro_lm  order by px desc,id_lm desc"
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
									<td valign="top" align="left">
										<table border="0" cellpadding="0" cellspacing="0">
											<tr>
												<Td width="160"  >
													 <table border="0" cellspacing="0" cellpadding="0"  align="center" width="160">
													  <tr>
														<td width="153" height="111" align="center"><a href="case_pro.asp?lm=<%=rs("id_lm")%>"><img src="<%=rs("img_sl")%>" /></a></td>
													  </tr>
													  <tr>
														<td height="44" align="center"><a href="case_pro.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></td>
													  </tr>
													</table>
												</Td>
											</tr>
										</table>
									</td>
									<%
										if a mod 4=0 then response.Write("<tr></tr>")
											a=a+1
											rs.movenext
											wend
										end if	
										rs.close
										set rs=nothing
									%>
									<%if pagenum<>"" then call listpage(pra) end if%>
                                </tr>
                            </table>
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
