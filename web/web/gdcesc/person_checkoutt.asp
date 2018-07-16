<!--#include file="conn.asp"-->
<!--#include file="person_checklogin.asp"-->
<!--#include file="cart_class.asp"-->
<%
	order_no=trim(request("order_no"))
	if order_no="" or not checknum(order_no) then
		call msg("参数错误","")
	else
		order_no=bsql(order_no)
	end if
	per=6
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
                <li class="oms">订购课程 </li>
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
                        	
                            
                            
                          <table width="690" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="330" valign="top"  style="padding-bottom:22px;">
                        
                          <table width="690" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#25a9ea" height="26">
                            <tr>
                              <td width="10" ></td>
                              <td  align="center" style="font-weight:bold; color:#666; font-size:12px;">购物车</td>
                              <td width="25">> ></td>
                              <td  align="center"  style="font-weight:bold; color:#666; font-size:12px;">确认订单</td>
                              <td width="25">> ></td>
                              <td  style="font-weight:bold; color:#fff; font-size:12px;">付款</td>
                              <td width="10"></td>
                            </tr>
                          </table>
						<%
                            set rs=server.CreateObject("adodb.recordset")
                            sql="select * from person_order where username='"&session("person")&"' and order_no='"&order_no&"'"
                            rs.open sql,conn,1,1
                            if not rs.eof then
                         %>
                        <div align="center" class="col-box-content" style="padding:50px 10px; border:1px solid #ccc; font-size:12px;" >
                                
                                <table border="0" align="center" cellpadding="3" cellspacing="1" class="textDesc" width="50%">
                                  <tr>
                                    <td align="left" style="line-height:200%;"><strong>感谢您本次订购！</strong><br />
                                      您的订单已提交成功，请记住您的订单号：<span class="textStrong"><%=rs("order_no")%></span><br />
                        您应付款金额为: <span class="textStrong">￥<%=rs("total_money")%>元</span> <br /></td>
                                  </tr>
                                  <tr><td height="35">
                                    您可以 <a href="index.asp"><strong>返回首页</strong></a> 或去 <a href="person_home.asp"><strong>用户中心</strong></a></p>
                                  </td></tr>
                                </table>
                              </div>
                              	
							<%
                            end if
                            %>
                            
                        </td>
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
