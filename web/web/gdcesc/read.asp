<!--#include file="conn.asp"-->
<% 
	n=8
	 t=2
	 x=1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/person.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
</head>

<body>
<!--header-->
<!--#include file="top.asp"-->
<!--#include file="nav_teach.asp"-->


<div id="main">
   <!--内页左边-->
   <div class="main_left">
       <div class="mle_par1">
          <div class="mle_title">
             <img src="images/ny_02.jpg" />
             <ul>
                <li class="oms">雅思写作范例</li>
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
                       	<table border="0" cellpadding="0" cellspacing="0" width="100%" >
                            	<tr>
                                	<tD align="left" style="padding-left:20px;"><img src="images/jy.jpg" />
                                    </tD>
                                </tr>
                            </table>
                       		<table border="0" cellpadding="0" align="center" width="680" class="read">
                            	 <%
									set rs=server.CreateObject("adodb.recordset")
									sql="select * from info_co_xz where lm=1 and pass='yes'  order by px desc,id desc"
									rs.open sql,conn,1,1
									if not rs.eof then
										pagenum=11
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
							   <tr>
								 <td style="border-bottom:dashed 1px #ccc; " align="center" valign="middle" width="15">☞</td>
								 <td  align="left" valign="middle" style="border-bottom:dashed 1px #ccc; padding-left:5px;"><a href="read_show.asp?id=<%=rs("id")%>" ><font style="color:<%=rs("color_font")%>;"><%=getstr(rs("title"),85)%></font></a> </td>
								 
							   </tr>
							   <%
										a=a+1
										rs.movenext
										wend
									end if
									rs.close
									set rs=nothing
								%>
                            </table>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin:10px;">
                            	<tr>
                                	<tD align="center">
                                    	<%if pagenum<>"" then call listpage("") end if%>
                                    </tD>
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
          <!--#include file="left_xz.asp"-->
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
