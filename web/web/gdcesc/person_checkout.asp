<!--#include file="conn.asp"-->
<!--#include file="person_checklogin.asp"-->
<!--#include file="cart_class.asp"-->
<%
act=trim(request("act"))
if act="post" then
	Response.Buffer =True
	Response.ExpiresAbsolute =Now() - 1
	Response.Expires=0
	Response.CacheControl="no-cache"
	
	set cart=new UserCart
	cart.createcart
if cart.checkemtpy then
	response.write "<div style=""color:#666;text-align:center;padding-top:100px;"">购物车为空....</div>"
else
	rename=html(trim(request.Form("rename")))
	phone=html(trim(request.Form("phone")))
	post=html(trim(request.Form("post")))
	address=html(trim(request.Form("address")))
	z_body=html(trim(request.Form("z_body")))
	pay_type=html(trim(request.Form("pay_type")))
	
	if rename="" or phone="" or address=""  then
		call msg("带*号的必须填写","")
	end if
	
	Randomize
	order_no=right(year(now),2)&right("0"&month(now),2)&right("0"&day(now),2)&right("0"&hour(now),2)&right("0"&minute(now),2)&right("0"&second(now),2)&Int(900 * Rnd)+100
	ind=false
	'把用户所买产品放入数据库
	a=0
	car=cart.viewcart
	lnum=lbound(car,2)
	unum=ubound(car,2)
	for i=lnum to unum
		if car(0,i)<>"" then
			conn.execute"insert into person_pro (order_no,username,pro_id,pro_no,pro_title,pro_money,pro_num) values ('"&order_no&"','"&session("person")&"',"&car(8,i)&",'"&car(7,i)&"','"&car(1,i)&"',"&car(3,i)&","&car(5,i)&")"
			'response.Write("insert into person_pro (order_no,username,pro_id,pro_no,pro_title,pro_money,pro_num) values ('"&order_no&"','"&session("person")&"',"&car(8,i)&",'"&car(7,i)&"','"&car(1,i)&"',"&car(3,i)&","&car(5,i)&")")
			'response.End()
			a=a+car(3,i)*car(5,i)
		end if
	next

	
	'生成订单
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from person_order"
	rs.open sql,conn,1,3
		rs.addnew()
		rs("username")=session("person")
		rs("order_no")=order_no
		rs("rename")=rename
		rs("phone")=phone
		rs("post")=post
		rs("address")=address
		rs("total_money")=a
		rs("pay_money")=0
		rs("pay_type")=pay_type
		rs("z_body")=z_body
		rs("wtime")=now()
		rs("ip")=getip()
		rs("order_zt")="nno"
		rs("pay_zt")="no"
		rs("send_zt")="no"
		rs.update()
	rs.close
	set rs=nothing
	
	'conn.execute "update person set jf=jf+"&a&" where username='"&session("person")&"' "
	
	cart.RemoveAll
	response.write"<script>location='person_checkoutt.asp?order_no="&order_no&"'</script>"
	response.End()
end if
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
                <li class="oms">确定订单</li>
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
                        	
                            
                            
                            
                            <table width="690" border="0" align="center" cellpadding="0" cellspacing="0" >
                              <tr>
                                <td height="330" valign="top"  style="padding-bottom:22px;">  
                            
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
                                  <table width="690" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#014021" height="26">
                                    <tr  bgcolor="#25a9ea">
                                      <td width="10" ></td>
                                      <td  align="center" style="font-weight:bold; color:#666; font-size:12px;">购物车</td>
                                      <td width="25" >> ></td>
                                      <td  align="center"  style="font-weight:bold; color:#fff; font-size:12px;">确认订单</td>
                                      <td   width="25"> > ></td>
                                      <td align="center" style="font-weight:bold; color:#666; font-size:12px;">付款</td>
                                      <td width="10" ></td>
                                    </tr>
                                  </table>
                                  
                                  
                         <form  id=frmm name=frmm onSubmit="return checkForm('frmm')" action=person_checkout.asp?act=post method=post style="margin:0px; padding:0px;" >
                            <table width="690" border="0" align="center"  cellpadding="0" cellspacing="1"  bgcolor="#d3d3d3" style="margin-top:10px;">
                                    <tr  bgcolor="#ffffff" align="center" style="font-size:14px; font-weight:bold">
                                     <td width="400" >名  称</td>
                                     <td width="80">次  数</td>
                                     <td width="80">价  格</td>
                                     <td width="80" >数  量</td>
                                   </tr>
                                  
                                    <%
                                    for i=lnum to unum
                                        if car(0,i)<>"" then
                                    %>
                                    <tr  bgcolor="#ffffff" style="font-size:13px;">
                                     <td align="left" style="padding-left:10px;" ><%=car(1,i)%></td>
                                     <td align="center" ><%=car(2,i)%></td>
                                     <td align="center" >￥<%=formatnum(car(3,i))%></td>
                                     <td align="center"><%=car(5,i)%></td>
                              </tr>
                                <%
                                     end if
                                   next
                                   %>
                                 </table>
								<%
                                set rsa=server.CreateObject("adodb.recordset")
                                sql="select * from person where username='"&session("person")&"' and pass='yes'"
                                rsa.open sql,conn,1,1
                                if not rsa.eof then
                                    rename=rsa("rename")
                                    phone=rsa("phone")
                                    post=rsa("post")
                                    address=rsa("address")
                                end if
                                rsa.close
                                set rsa=nothing
                                %>
                            
                            <table width="690" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
                              <tr>
                                <td width="18" align="center"><img src="images/jt.jpg" width="2" height="12" /></td>
                                <td height="24" ><strong>联系方式</strong></td>
                              </tr>
                              <tr>
                                <td height="2" colspan="2" bgcolor="#bbbbbb"></td>
                              </tr>
                                <tr>
                                  <td colspan="2" height="5"></td>
                                </tr>
                            </table>
                            <TABLE width="690" border=0 align=center cellPadding=3 cellSpacing=1 >
                                   <tr>
                                     <th width="114" align="right" bgcolor="#E3EAED" style="border:1px #CCCCCC solid;">姓名:</th>
                                     <td bgcolor="#fafafa" style="border:1px #CCCCCC solid;">
                                     <INPUT  name=rename class=input_m style="WIDTH: 200px" size=25 maxlength="20" canEmpty="N" checkType="string,," checkStr="姓名" value="<%=rename%>" id="rename">
                                    <span class="font_8">*</span>         </tr>
                                    <tr>
                                     <th align="right" bgcolor="#E3EAED" style="border:1px #CCCCCC solid;">电话:</th>
                                     <td bgcolor="#fafafa" style="border:1px #CCCCCC solid;"><input name="phone" class="input_m" style="WIDTH: 200px" size="25" maxlength="50" canempty="N" checktype="string,," checkstr="电话" value="<%=phone%>" id="phone" />
                                         <span class="font_8">*</span></td>
                                   </tr>
                                   <tr>
                                     <th align="right" bgcolor="#E3EAED" style="border:1px #CCCCCC solid;">邮编:</th>
                                     <td bgcolor="#fafafa" style="border:1px #CCCCCC solid;"><INPUT name=post class=input_m style="WIDTH: 200px" size=25 maxlength="50"  value="<%=post%>" id="post"></td>
                                   </tr>
                                   <tr>
                                     <th align="right" bgcolor="#E3EAED" style="border:1px #CCCCCC solid;">地址:</th>
                                     <td bgcolor="#fafafa" style="border:1px #CCCCCC solid;">
                            <INPUT name=address class=input_m  style="width:300px;" maxlength="150" checkStr="地址" checkType="string,," canEmpty="N" id="address" value="<%=address%>">
                                       <span class="font_8">*</span>         </td>
                                    </tr>
                                 </table>
                            <table width="690" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
                                  <tr>
                                    <td width="18" align="center"><img src="images/jt.jpg" width="2" height="12" /></td>
                                    <td   height="24">&nbsp;<strong>备注</strong></td>
                                  </tr>
                                  <tr>
                                    <td height="2" colspan="2" bgcolor="#bbbbbb"></td>
                                  </tr>
                                    <tr>
                                      <td colspan="2" height="5"></td>
                                    </tr>
                              </table>
                            <TABLE width="690" border=0 align=center cellPadding=3  cellSpacing=1  style="border:#CCCCCC 1px solid" class=listtable>
                                     <tr>
                                     <th width="114" align="right" bgcolor="#E3EAED">说明:</th>
                                     <td colspan="3" bgcolor="#fafafa"><label>
                                       <textarea name="z_body" cols="45" rows="5" class="input_m" id="z_body" style=" width:460px; height:50px;"></textarea>
                                     </label></td>
                                    </tr>
                                 </table>
                            <table width="690" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
                                  <tr>
                                    <td width="18" align="center"><img src="images/jt.jpg" width="2" height="12" /></td>
                                    <td   height="24">&nbsp;<strong>付款方式</strong></td>
                                  </tr>
                                  <tr>
                                    <td height="2" colspan="2" bgcolor="#bbbbbb"></td>
                                  </tr>
                                    <tr>
                                      <td colspan="2" height="5"></td>
                                    </tr>
                              </table>
                            <TABLE width="690" border=0 align=center cellPadding=3  cellSpacing=1  style="border:#CCCCCC 1px solid" class=listtable>
                                     <tr>
                                     <th width="114" align="right" bgcolor="#E3EAED">付款方式:</th>
                                     <td colspan="3" bgcolor="#fafafa"> 暂无线上支付功能，稍后会有相关人员与你联系！！！</td>
                                    </tr>
                                 </table>
                            <table width="690" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
                                  <tr>
                                    <td width="18" align="center"><img src="images/jt.jpg" width="2" height="12" /></td>
                                    <td   height="24">&nbsp;<strong>费用总计</strong></td>
                                  </tr>
                                  <tr>
                                    <td height="2" colspan="2" bgcolor="#bbbbbb"></td>
                                  </tr>
                                    <tr>
                                      <td colspan="2" height="5"></td>
                                    </tr>
                              </table>
                            <TABLE width="690" border=0 align=center cellPadding=3  cellSpacing=1  class=listtable style="border:#CCCCCC 1px solid">
                                     <tr>
                                     <th width="114" height="50" align="right" bgcolor="#E3EAED">总价:</th>
                                     <td colspan="3" bgcolor="#fafafa">￥<%=formatnum(cart.getprice)%></td>
                                    </tr>
                                 </table>
                            <table width="690" border="0" align="center"  cellpadding="0" cellspacing="0" style="margin-top:15px;">
                              <tr>
                              <td width="120">&nbsp;</td>
                            <td >
                               <input name="" type="image" src="images/cart_checkoutt.jpg" />
                               &nbsp; <a href="javascript:history.back();"><img src="images/cart_return.jpg" width="106" height="30" border="0" /></a></td>
                              </tr>
                            </table>
                            </form>
                              
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
