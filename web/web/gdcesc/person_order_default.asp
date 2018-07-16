<!--#include file="conn.asp"-->
<!--#include file="person_checklogin.asp"-->
<!--#include file="cart_class.asp"-->
<%
	per=6
	g=1
	m=3
	t=1
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
                <li class="oms">订单管理</li>
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
					   sql="select * from person_order where  username='"&session("person")&"' order by id desc"
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
					   %>
                        <table width="690" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="margin:10px;" >
                            <tr  bgcolor="#25a9ea" align="center" >
                             <td>订单号</td>
                             <td>时间</td>
                             <td>状态</td>
                             <td>查看</td>
                           </tr>
                            <%
                            while not rs.eof and a<=pagenum
                            %>
                           <tr bgcolor="#FFFFFF">
                             <td  style="text-align:left; padding-left:3px;"><a href="person_order_show.asp?id=<%=rs("id")%>"><%=rs("order_no")%></a></td>
                             <td align="center"><%=rs("wtime")%></td>
                             <td align="center"><%=order_z(rs("order_zt"))%>&nbsp;<%=pay_z(rs("pay_zt"))%></td>
                             <td align="center"><a href="person_order_show.asp?id=<%=rs("id")%>" class="lnk">查看</a></td>
                           </tr>
                            <%			
                            a=a+1
                            rs.movenext
                            wend
                            %>
                         </table>
                    <table border="0" cellspacing="0" cellpadding="0" style="margin:10px;" width="690">
                      <tr>
                        <td><%if pagenum<>"" then call listpage("") end if%></td>
                      </tr>
                    </table>
					 <%
					 end if
					 %>	
                            
                            
                            
                            
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
