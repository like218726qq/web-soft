<!--#include file="conn.asp"-->
<% 	
	per=3
	t=1

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
<!--#include file="nav_teach.asp"-->


<div id="main">
   <!--内页左边-->
   <div class="main_left">
       <div class="mle_par1">
          <div class="mle_title">
             <img src="images/ny_02.jpg" />
             <ul>
                <li class="oms">我已预约课程</li>
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
                        	<table border="0" cellpadding="0" cellspacing="2" align="center" width="680">
                            	<tr>
                                	<td width="50"  class="bg" >序 号</td>
                                	<td width="100" class="bg"  >授课老师</td>
                                	<td width="100" class="bg"  >上课时间</td>
                                	<td width="90" class="bg"  >教师授课状态</td>
                                	<td width="90" class="bg"  >学生授课状态</td>
                                	<td class="bg"  >课程标题</td>
                                </tr>
                               <%
									set rs=server.CreateObject("adodb.recordset")
									sql="select * from pro_order where person_xs='"&session("person")&"' order by id desc"
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
										
										if rs("person_jsj")<>"" then
											set rs1=server.CreateObject("adodb.recordset")
											sql="select * from person1 where dj="&rs("person_jsj")&""
											rs1.open sql,conn,1,3
											if not rs1.eof then
												js=rs1("rename")
											end if
											rs1.close
											set rs1=nothing
										end if
										

								%>
                            	<tr <%if a mod 2=1 then%> class="bg2" <%else%> style="text-align:center; height:26px; line-height:26px; font-size:12px;font-family:"微软雅黑"; color:#000;"<%end if%>>
                                	<td width="50"><%=a%></td>
                                	<td width="100"><%=js%></td>
                                	<td width="120"><%=rs("datehm")%></td>
                                	<td width="80" style="color:#666;"><%=send_z(rs("send_zt"))%></td>
                                	<td width="80" style="color:#666;"><%=send_ztt(rs("send_xs"))%></td>
                                	<td align="left" class="tt"><a href="yuyue_jilu.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
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
          <!--#include file="left_person.asp"-->
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
