<!--#include file="conn.asp"-->
<!--#include file="cart_class.asp"-->
<%
w_url=request("w_url")
if w_url="" then
	w_url="order.asp"
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
                <li class="oms"> 购买课程 </li>
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
                        	<table width="680" border="0" align="center" cellpadding="0" cellspacing="0" >
                              <tr>
                                <td valign="top" height="280" c style="padding-bottom:22px;"><table width="680" border="0" align="center" cellpadding="1" cellspacing="0">
                                </table>    
                            
                            <%
                                  set cart=new UserCart
                                  cart.createcart
                                  if cart.checkemtpy then
                                    response.write "<div style=""color:#666;text-align:center;padding-top:100px;"">购物车为空....</div>"
                                  else
                                      car=cart.viewcart
                                      lnum=lbound(car,2)
                                      unum=ubound(car,2)
                                  %>
                            <table width="680" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#014021" height="26"><tr><td width="288" align="center"  style="font-weight:bold; color:#666; font-size:12px;"><table width="680" border="0" align="center" cellpadding="0" cellspacing="0"  height="26">
                              <tr bgcolor="#0a9ee8">
                                <td width="10"></td>
                                <td  align="center" style="font-weight:bold; color:#fff; font-size:12px;">购物车</td>
                                <td width="25" >> ></td>
                                <td align="center"  style="font-weight:bold; color:#666; font-size:12px;">确认订单</td>
                                <td width="25" >> ></td>
                                <td align="center" style="font-weight:bold; color:#666; font-size:12px;">等待付款</td>
                                <td width="10" ></td>
                              </tr>
                            </table></td>
                                      </tr>
                            </table>
                                  
                                  
                      <table width="680"  border="0"cellspacing="1" cellpadding="0" bgcolor="#d3d3d3" style="margin-top:10px;">
                                        <tr  bgcolor="#25a9ea" align="center" style="color:#fff; font-size:15px; font-family:'微软雅黑' " >
                                         <td width="135">名  称</th>
                                         <td width="112">次  数</td>
                                         <td width="93" >价   格</td>
                                         <td width="93" >数   量</td>
                                         <td width="68">删除</td>
                                       </tr>
                                            <%
                                            for i=lnum to unum
                                                if car(0,i)<>"" then
                                            %>
                                            <form  name="formm_<%=car(0,i)%>" method="get" action="cart.asp" style="margin:0px; padding:0px;" >
                                            <input name="act" type="hidden" value="up" />
                                            <input name="w_url" type="hidden" value="<%=w_url%>" />
                                            <input type="hidden" id="id" name="id" value="<%=car(0,i)%>"/>
                                            <tr bgcolor="#ffffff" style="font-size:13px; color:#666666; font-weight:bold" >
                                             <td align="left" style="padding-left:10px;" width="330" height="26"><%=car(1,i)%></td>
                                             <td align="center" width="80"><%=car(2,i)%></td>
                                             <td align="center" width="80">￥<%=car(3,i)%> </td>
                                             <td align="center" width="80"><input name="pro_num_<%=car(0,i)%>" type="text" class="inp" id="pro_num_<%=car(0,i)%>" style="width:38px; height:14px;" value="<%=car(5,i)%>" maxlength="8" /><input name="" type="image" src="images/update.gif" /></td>
                                             
                                             <td s align="center" width="100"><a href="cart.asp?act=del&id=<%=car(0,i)%>&w_url=<%=server.URLEncode(w_url)%>" class="lnk"><img src="images/del.jpg" border="0" /></a></td>
                                           </tr>
                                           </form>
                                           <%
                                                end if
                                           next
                                           %>
                                         </table>
                                 
                            
                            <table width="680" border="0" align="center"  cellpadding="0" cellspacing="0" style="margin-top:15px;">
                              <tr>
                                <td  align="right" style="padding-right:15px;"><a href="<%=w_url%>" ><img src="images/cart_continun.jpg" width="106" height="30" border="0" /></a></td>
                                <td width="229" background="images/cart_checkout.jpg" style="cursor:pointer;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style=" color:#fff; font-weight:bold;">
                                    <tr>
                                      <td width="66%" style="padding-left:40px;">总价：￥<%=formatnum(cart.getprice)%></td>
                                      <td width="16%"><a href="person_checkout.asp" style="text-decoration:underline; color:#fff;">结算</a></td>
                                    </tr>
                                </table></td>
                              </tr>
                            </table>
                            <%
                                  end if
                                  %> </td>
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
