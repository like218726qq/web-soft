<!--#include file="conn.asp"-->
<% 	
	per=4
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
                <li class="oms">预约课程 Oral Class Schedule</li>
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
                                	<td width="50"  class="bg" >序 号 Number</td>
                                	<td width="100" class="bg"  >学员姓名 Student Name</td>
                                	<td width="120" class="bg"  >上课时间 Time</td>
                                	<td width="80" class="bg"  >授课状态 Status</td>
                                	<td class="bg"  >课程标题 Topic</td>
                                </tr>
                               <%
							   
							   		set rs=server.CreateObject("adodb.recordset")
									sql="select * from person1 where username='"&session("person1")&"'"
									rs.open sql,conn,1,1
									if not rs.eof then
										ids=rs("id")
									end if
									rs.close
									set rs=nothing
							   		
									set rs=server.CreateObject("adodb.recordset")
									sql="select * from pro_order where person_jss="&ids&" order by id desc"
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
										
										if rs("person_jss")<>"" then
											set rs1=server.CreateObject("adodb.recordset")
											sql="select * from person1 where dj="&rs("person_jss")&""
											rs1.open sql,conn,1,3
											if not rs1.eof then
												js=rs1("username")
											end if
											rs1.close
											set rs1=nothing
										end if
				
								%>
                            	<tr <%if a mod 2=1 then%> class="bg2" <%else%> style="text-align:center; height:26px; line-height:26px; font-size:12px;font-family:"微软雅黑"; color:#000;"<%end if%>>
                                	<td width="50"><%=a%></td>
                                	<td width="100"><a href="yuyue_js_show.asp?id=<%=rs("id")%>"><%=rs("person_xs")%></a></td>
                                	<td width="120"><%=rs("datehm")%></td>
                                	<td width="80"><%=send_z(rs("send_zt"))%></td>
                                	<td align="left" class="tt"><a href="yuyue_js_show.asp?id=<%=rs("id")%>"><%=getstr(rs("title"),45)%></a></td>
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
