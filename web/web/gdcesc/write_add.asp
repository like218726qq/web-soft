<!--#include file="conn.asp"-->
<% 

	 t=2
	 x=2
	 
id=request("id")
if id="" or not checknum(id) then 
	call msg("参数错误","")
end if


'读取数据
sql="select * from info_co_xz where id="&id&""
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
if rs.eof then 
	call msg("该记录不存在,或已删除!","")
else
	lm=rs("lm")
	title1=rs("title")
	
		set rs2=server.CreateObject("adodb.recordset")
		sql="select * from info_lm_xz where id_lm="&lm&""
		rs2.open sql,conn,1,3
		if not rs2.eof then
			title_lm=rs2("title_lm")
		end if
		rs2.close
		set rs2=nothing
end if
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
                <li class="oms">在线写作</li>
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
                       <form method="POST" name="form1"  onsubmit="return Check()" action="write_addd.asp" >
                            <input type="hidden" id="id" name="id" value="<%=id%>" style="display:none;" />
                            <table border="0" cellpadding="0" cellspacing="0" align="center" width="680">
                                <tr>
                                    <td style="font-size:15px; color:#666666; font-family:'微软雅黑';" valign="top">标题栏目：</td>
                                    <td>
                                     <input type="text" disabled="disabled" value="<%=title_lm%>" />
                                  </td>
                                </tr>
                                <tr>
                                    <td style="font-size:15px; color:#666666; font-family:'微软雅黑';" valign="top">写作标题：</td>
                                    <td>
                                    <textarea name="title" cols="72" rows="4" id="title"><%=title1%></textarea>
                                  </td>
                                </tr>
                                <tr>
                                    <td style="font-size:15px; color:#666666; font-family:'微软雅黑';">写作内容：</td>
                                    <td>
                                        <%
                                            fckaaa = "aa"
                                        %>
                                        <!--#include file="admin/fckeditor.asp" -->
                                            <%
                                                Dim oFCKeditor
                                                Set oFCKeditor = New FCKeditor
                                                oFCKeditor.Config("LinkBrowser") = "true" 
                                                oFCKeditor.Config("ImageBrowser") = "true" 
                                                oFCKeditor.Config("FlashBrowser") = "true" 
                                                oFCKeditor.Config("LinkUpload") = "true" 
                                                oFCKeditor.Config("ImageUpload") = "true" 
                                                oFCKeditor.Config("FlashUpload") = "true" 
                                                oFCKeditor.Value = ""
                                                oFCKeditor.Create "z_body"
                                            %>
                                    </td>
                                </tr>
                                <tr>
                                	<td></td>
                                	<td ><INPUT type="submit" id="b1" name="b1"   value=" 添 加 " > &nbsp;<input name="Cancel" type="button" id="Cancel" value=" 取 消 " onclick="location='read.asp'" style="cursor:hand;" /></td>
                                </tr>
                            </table>
                            </form>
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
