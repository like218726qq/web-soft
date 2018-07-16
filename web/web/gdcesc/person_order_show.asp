<!--#include file="conn.asp"-->
<!--#include file="person_checklogin.asp"-->
<!--#include file="cart_class.asp"-->
<%
id=trim(request("id"))
if id="" or not isnumeric(id) then
	call msg("Parameter error","")
end if

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
                <li class="oms">客服中心 </li>
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
                        	
                            
                            
               <table border="0" cellpadding="0" cellspacing="0" height="450" width="690">
                <tr >
                  <td valign="top">
				  	<%
					 set rs=server.CreateObject("adodb.recordset")
					 sql="select * from person_order where id="&id&" and username='"&session("person")&"'"
					 rs.open sql,conn,1,1
					 if not rs.eof then
					 %>
					 <table width="690" border="0" cellpadding="0" cellspacing="0" style="margin:10px;">
					  <tr>
						<td>
					
					<table width="100%" border="0" align="center" cellpadding="1" cellspacing="3" style=" margin:0px 0px;">
						<tr>
							<td colspan="3" style="text-align:left; font-weight:bold;">产品名称</td>
							<td align="right" style="text-align:right;"><a href="javascript:history.back();" style="font-size:12px;">[返回]</a></td>
						</tr>
					</table>
                    
                    
                	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" >
                        <tr align="center" bgcolor="#25a9ea" style="font-size:14px;">
                         <td style=" padding-left:3px;">名  称</td>
                         <td width="100">价  格</td>
                         <td width="100">数  量</td>
                       </tr>
                       <%
                       set rsa=server.CreateObject("adodb.recordset")
                       sql="select * from person_pro where order_no='"&rs("order_no")&"'"
                       rsa.open sql,conn,1,1
                       a=0
                       while not rsa.eof
                       %>
                       <tr bgcolor="#FFFFFF">
                         <td style="text-align:left;padding-left:3px;"><%=rsa("pro_title")%><br /></td>
                         <td align="center">￥<%=formatnum(rsa("pro_money"))%></td>
                         <td align="center"><%=rsa("pro_num")%></td>
                       </tr>
                    <%
                    a=a+rsa("pro_money")*rsa("pro_num")
                    rsa.movenext
                    wend
                    rsa.close
                    set rsa=nothing
                    %>
                     </table>
                     
                     
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					  <tr>
						<td style="padding-right:5px; text-align:right; font-weight:bold; height:20px;">总计: <font style="color:#FF6600;">￥<%=formatnum(a)%></font>&nbsp;</td>
					  </tr>
					</table>
						 
					<table width="100%" border="0" align="center" cellpadding="1" cellspacing="3" style="margin:0px 0px;">
						<tr>
							<td colspan="3" style="text-align:left; font-weight:bold;">订单状态</td>
							<td align="right" style="text-align:right;"></td>
						</tr>
					</table>
					  <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" style="border: #CCCCCC 1px solid;"  >
						   <tr>
							 <td width="120" align="right" bgcolor="#E3EAED" style="border: #CCCCCC 1px solid;" >订单号:</td>
							 <td style="border: #CCCCCC 1px solid;" ><%=rs("order_no")%></td>
						   </tr>
						   <tr>
							 <td width="120" align="right" bgcolor="#E3EAED" style="border: #CCCCCC 1px solid;" >订单状态:</td>
							 <td style="border: #CCCCCC 1px solid;" ><%=order_z(rs("order_zt"))%></td>
						   </tr>
						   <tr>
							 <td width="120" align="right" bgcolor="#E3EAED">付款状态:</td>
							 <td  bgcolor="#FFFFFF"><%=pay_z(rs("pay_zt"))%></td>
						   </tr>
					   </table>
					
					<table width="100%" border="0" align="center" cellpadding="1" cellspacing="3" style="margin:5px 0px;">
						<tr>
							<td colspan="3" style="text-align:left; font-weight:bold;">费用总计</td>
							<td align="right" style="text-align:right;"></td>
						</tr>
					</table>
					  <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0"   style="border: #CCCCCC 1px solid;" >
							<tr>
							 <td width="120" align="right" bgcolor="#E3EAED" style="border: #CCCCCC 1px solid;" >商品费用:</td>
							 <td  style="border: #CCCCCC 1px solid;" >￥<%=formatnum(rs("total_money"))%></td>
						   </tr>
							<tr>
							 <td width="120" align="right" bgcolor="#E3EAED" style="border: #CCCCCC 1px solid;" >付款方式:</td>
							 <td  style="border: #CCCCCC 1px solid;" >暂无线上支付，稍后工作人员会与您联系！！！</td>
						   </tr>
					   </table>
					
					
					  <table width="100%" border="0" align="center" cellpadding="1" cellspacing="3" style="margin:5px 0px;">
						<tr>
							<td colspan="3" style="text-align:left; font-weight:bold;">联系人方式</td>
							<td align="right" style="text-align:right;"></td>
						</tr>
					</table>
					 <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0"  style="border: #CCCCCC 1px solid;" >
							   <tr>
								 <td width="120" align="right" bgcolor="#E3EAED" style="border: #CCCCCC 1px solid;" >姓名:</td>
								 <td  style="border: #CCCCCC 1px solid;" ><%=rs("rename")%></td>
								 </tr>
							   <tr>
								 <td align="right" bgcolor="#E3EAED" style="border: #CCCCCC 1px solid;" >电话:</td>
								 <td style="border: #CCCCCC 1px solid;" ><%=rs("phone")%></td>
							   </tr>
								 <tr>
								 <td align="right" bgcolor="#E3EAED" style="border: #CCCCCC 1px solid;" >邮编:</td>
								 <td style="border: #CCCCCC 1px solid;" ><%=rs("post")%></td>
							   </tr>
							   <tr>
								 <td align="right" bgcolor="#E3EAED" style="border: #CCCCCC 1px solid;" >地址:</td>
								 <td style="border: #CCCCCC 1px solid;" ><%=rs("address")%></td>
								 </tr>
					
							   <tr>
								 <td height="40" align="right" bgcolor="#E3EAED" style="border: #CCCCCC 1px solid;" >备注:</td>
								 <td style="border: #CCCCCC 1px solid;" ><%=rs("z_body")%></td>
							   </tr>
							 </table>
					<table width="100%" border="0" align="center" cellpadding="1" cellspacing="3" style="margin:5px 0px;">
						<tr>
							<td colspan="3" style="text-align:left; font-weight:bold;">订单回复</td>
							<td align="right" style="text-align:right;">        </td>
						</tr>
					</table>
					  <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" style="border: #CCCCCC 1px solid;"  >
						   <tr>
							 <td width="120" height="60" align="right" bgcolor="#E3EAED">内容:</td>
							 <td  bgcolor="#FFFFFF" style="color:#FF3333;"><%=rs("h_body")%></td>
						   </tr>
					   </table><br />
					<table width="100%" border="0" align="center" cellpadding="1" cellspacing="3" style=" margin:0px 0px;">
						<tr>
							<td colspan="3" style="text-align:left; font-weight:bold;"></td>
							<td align="right" style="text-align:right;"><a href="javascript:history.back();" style="font-size:12px;">[返回]</a></td>
						</tr>
					</table>
							 </td>
					  </tr>
					</table>       
					 <%
					end if
					rs.close
					set rs=nothing
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
