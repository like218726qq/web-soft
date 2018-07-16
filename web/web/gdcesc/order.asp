<!--#include file="conn.asp"-->
<!--#include file="cart_class.asp"-->
<%
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
                <li class="oms">购买课程 </li>
             </ul>
          </div>
          <div class="clear"></div>
          <div class="mle_cont">
             <!--学校列表-->
             
             <div class="clear"></div>
             <div class="xylb2_1">
             	<table border="0" cellpadding="0" cellspacing="0" width="705" height="540" style="padding-bottom:5px;">
                	<tr>
                    	<td valign="top">
							<%
                                '二级分类
                                set rsb=server.CreateObject("adodb.recordset")
                                sql="select * from order_lm where fid=0 order by px desc,id_lm desc"
                                rsb.open sql,conn,1,1
                                if not rsb.eof then
                                b=1
								while not rsb.eof
							%>
                       
                        	<table border="0" cellpadding="0" cellspacing="0" width="690">
                            	<tr>
                                	<td height="36" style="padding-left:15px; color:#0763ae; font-size:16px; font-weight:bold;"><%=rsb("title_lm")%></td>
                                </tr>
                            </table>
                        	<table border="0" cellspacing="0" cellpadding="0"  align="center" width="690">
                              <tr align="center" bgcolor="#25a9ea"  style="color:#fff; font-size:16px; border-bottom:1px solid #d3d3d3; border-left:1px solid #d3d3d3;">
                                <td height="40" width="390" style="border-bottom:1px solid #d3d3d3; border-left:1px solid #d3d3d3;">课  程</td>
                                <td width="80" style="border-bottom:1px solid #d3d3d3; border-left:1px solid #d3d3d3;">次  数</td>
                                <td width="80" style="border-bottom:1px solid #d3d3d3; border-left:1px solid #d3d3d3;">价  格</td>
                                <!--<td width="80">数  量</td>-->
                                <td width="140" style="border-bottom:1px solid #d3d3d3; border-left:1px solid #d3d3d3;"></td>
                              </tr>
                              <tr>
                              	<tD colspan="4"> 
								<%
								set rs=server.CreateObject("adodb.recordset")
								sql="select * from order_co where pass='yes' and lm="&rsb("id_lm")&" order by px desc,id desc"
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
								 while not rs.eof and a<pagenum 
								%>
                                	<table border="0" cellspacing="0" cellpadding="0" align="center" width="690">
                                    <form method="post" action="cart.asp" name="fo_<%=a%>" >
                                        <input type="hidden" id="id" name="id" value="<%=rs("id")%>"/>
                                         <input type="hidden" name="act" value="add" />
                                         
                                          <tr align="center" bgcolor="#ffffff" style="color:#000000; font-size:16px;">
                                            <td  height="40" width="380" align="left" style="font-weight:bold; padding-left:10px; border-bottom:1px solid #d3d3d3; border-left:1px solid #d3d3d3;"><%=rs("title")%></td>
                                            <td width="80" style=" border-bottom:1px solid #d3d3d3; border-left:1px solid #d3d3d3;"><%=rs("pro_guige")%>次</td>
                                            <td width="80" style=" border-bottom:1px solid #d3d3d3; border-left:1px solid #d3d3d3;"><%=rs("pro_money")%>元</td>
                                            <!--<td width="80"><input name="pro_num" type="text" class="input_02" id="pro_num" style="height:16px; line-height:16px;" size="4" canempty="N" checktype="integer" checkstr="数量" value="1" maxlength="20"/></td>-->
                                            <td width="140" style=" border-bottom:1px solid #d3d3d3; border-left:1px solid #d3d3d3; border-right:1px solid #d3d3d3;"><input name="imageField" type="image" src="images/goumai.png" /></td>
                                          </tr>
                                    </form>
                                    </table>
                                
                               <%
								  a=a+1
								  rs.movenext
								  wend
								  end if
								  rs.close
								  set rs=nothing
								%>
                                </tD>
                              </tr>
                             
                            </table>
                            <%
								b=b+1
								rsb.movenext
								wend
								end if
								rsb.close
								set rsb=nothing
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
