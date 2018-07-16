<!--#include file="conn.asp"-->
<% 
	per=2
	

	id=request("id")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	

	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_order_xz where id="&id&"  "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		title=rs("title")
		send_zt=rs("send_zt")
		z_body=rs("z_body")
		z_body1=rs("z_body1")
		pinglun=rs("pinglun")
		taolun=rs("taolun")
	end if
	rs.update
	rs.close
	set rs=nothing

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/person.css" rel="stylesheet" type="text/css" />
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
                <li class="oms">写作修改列表</li>
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
                       <form action="write_js_editt.asp" name="form" method="post" onSubmit="return check()">
							<input type="hidden" name="id"  id="id" value="<%=id%>">
                               <table border="0" cellpadding="0" cellspacing="0" width="680" align="center" style="border:1px solid #CCCCCC;">
                                <tr>
                                    <td width="100" align="center"  style="border-right:#CCCCCC 1px solid;border-bottom:#CCCCCC 1px solid; line-height:22px;">标题：</td>
                                    <td style="line-height:22px; padding:5px;border-bottom:#CCCCCC 1px solid; "><%=title%></td>
                                </tr>
                                <tr>
                                    <td width="100" align="center"  style="border-right:#CCCCCC 1px solid;border-bottom:#CCCCCC 1px solid;  line-height:22px;">原稿文章：</td>
                                    <td style="line-height:22px; padding:5px;border-bottom:#CCCCCC 1px solid; "><%=z_body%></td>
                                </tr>
                                <tr>
                                    <td width="100" align="center"  style="border-right:#CCCCCC 1px solid;border-bottom:#CCCCCC 1px solid;  line-height:22px;">在线修改：</td>
                                    <td style="border-bottom:#CCCCCC 1px solid; line-height:22px; padding:5px;">
                                        <%
                                            fckaaa = "aa"
                                        %>
                                         <!-- #INCLUDE file="admin/fckeditor.asp" -->
                                            <%
                                            Dim oFCKeditor
                                            Set oFCKeditor = New FCKeditor
                                            oFCKeditor.Config("LinkBrowser") = "true" 
                                            oFCKeditor.Config("ImageBrowser") = "true" 
                                            oFCKeditor.Config("FlashBrowser") = "true" 
                                            oFCKeditor.Config("LinkUpload") = "true" 
                                            oFCKeditor.Config("ImageUpload") = "true" 
                                            oFCKeditor.Config("FlashUpload") = "true" 
                                            oFCKeditor.Value = z_body1
                                            oFCKeditor.Create "z_body1"
                                            %>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="center"  style="border-right:#CCCCCC 1px solid;border-bottom:#CCCCCC 1px solid; line-height:22px;">评    语：</td>
                                    <td style="border-bottom:#CCCCCC 1px solid;line-height:22px; padding:5px;">
                                    <% 
                                    oFCKeditor.Value = pinglun
                                    oFCKeditor.Create "pinglun"
                                    %>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="center"  style="border-right:#CCCCCC 1px solid;border-bottom:#CCCCCC 1px solid;  line-height:22px;">是否修改：</td>
                                    <td style="line-height:22px; padding:5px;border-bottom:#CCCCCC 1px solid; ">
                                    <input type="radio" name="send_zt" value="no" <%if send_zt="no" then response.write " checked=""checked""" end if%>/> 未修改
<input type="radio" name="send_zt" value="yes" <%if send_zt="yes" then response.write " checked=""checked""" end if%>/> 已修改
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="center"  style="border-right:#CCCCCC 1px solid;border-bottom:#CCCCCC 1px solid;  line-height:22px;">是否评语：</td>
                                    <td style="line-height:22px; padding:5px;border-bottom:#CCCCCC 1px solid; ">
                                    <input type="radio" name="taolun" value="no" <%if taolun="no" then response.write " checked=""checked""" end if%>/> 未评语
<input type="radio" name="taolun" value="yes" <%if taolun="yes" then response.write " checked=""checked""" end if%>/> 已评语
                                    </td>
                                </tr>
                                  <tr>
                                	<td style="border-right:#CCCCCC 1px solid; line-height:22px;"></td>
                                	<td ><INPUT type="submit" id="b1" name="b1"   value=" 修 改 " > &nbsp;       <input name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="location='<%=w_url%>'" style="cursor:hand;"></td>
                                </tr>
                               </table>
                            </form>
                       <div style="padding:0px 5px 2px 5px;">
                            <div style="text-align:right;"><a href="javascript:history.back();">[返回]</a></div>
                        </div>
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
