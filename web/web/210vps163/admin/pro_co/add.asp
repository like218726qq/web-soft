<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品添加</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
<script language="javascript">
function check(){
	var lm=document.form1.lm;
	var title=document.form1.title;
	var px=document.form1.px;
	if (lm.value=="n"){
		alert("请选择分类")
		lm.focus();
		return false;
	}
	if (lm.value=="no"){
		alert("该分类不允许添加产品")
		lm.focus();
		return false;
	}
	if (title.value==""){
		alert("请输入产品名称")
		title.focus();
		return false;
	}
	if(px.value==""){
		alert("显示顺序不能为空")
		px.focus()
		return false
	}
}
</script></head>

<body >
<DIV id=popImageLayer style="VISIBILITY: hidden; WIDTH: 267px; CURSOR: hand; POSITION: absolute; HEIGHT: 260px; background-image:url(../images/bbg.gif); z-index: 100;" align=center  name="popImageLayer"  ></DIV>
<table width="1300" border="0" align="center" cellpadding="2" cellspacing="1" class="border">  
    <tr class="topbg">    
        <td  colspan="2"  align="center">
            产品中心管理----产品添加
        </td>  
    </tr> 
    <tr class="tdbg">    
        <td width="70" height="26" ><strong>管理导航：</strong></td>
        <td ><a href="default.asp">产品管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加产品</a></td>
    </tr>
</table>
<br />
<form method="POST" name="form1" action="addd.asp" onSubmit="return check()" >

        <table width="1300" border="0" cellpadding="2" cellspacing="1" class="border">
        <tr class="title">
          <td  align="center" colspan="4" >产品添加</td>
        </tr>
		<tr class="tdbg">
		  <td width="120" align="right"><strong >所属分类：</strong></td>
          <td width="530">
          		<select name="lm">
				<option value="n" selected>请选择分类</option>
				<%
                
                '连接数据库
                openconn
                
                '添加信息时显示分类过程
                Set rsa= Server.CreateObject("ADODB.Recordset")
                sql="select * from pro_lm where fid=0 order by px desc,id_lm desc"
                rsa.open sql,conn,1,1
                while not rsa.eof 	
                    i=""
                    if rsa("add_xx")="yes" then
                        response.write"<OPTION value='"&rsa("id_lm")&"'>• "&rsa("title_lm")&"&nbsp;"&rsa("title_lm_en")&"</OPTION>"&chr(10)
                    else
                        response.write"<OPTION value='no'>• "&rsa("title_lm")&"&nbsp;"&rsa("title_lm_en")&"×</OPTION>"&chr(10)
                    end if
                    call addinfo(rsa("id_lm"),i)
                    rsa.movenext
                wend
                rsa.close
                set rsa=nothing
                
                '关闭数据库
                closeconn
                
                sub addinfo(fid,i)
                i=i&"&nbsp;"
                sql="select * from pro_lm where fid="&fid&" order by px desc,id_lm desc"
                Set rsb= Server.CreateObject("ADODB.Recordset")
                rsb.open sql,conn,1,1
                while not rsb.eof
                    if rsb("add_xx")="yes" then
                        response.write"<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"&nbsp;"&rsb("title_lm_en")&"</option>"&chr(10)
                    else
                        response.write"<option value='no'>"&i&" 　|—"&rsb("title_lm")&"&nbsp;"&rsb("title_lm_en")&"×</option>"&chr(10)
                    end if
                    call addinfo(rsb("id_lm"),i&" 　|&nbsp;")
                    rsb.movenext
                wend
                rsb.close
                set rsb=nothing
                end sub
                %>
             </select>			</td><td width="120"></td><td width="530"></td>
            </tr>
          <tr class="tdbg">
                <td width="120" align="right"><strong>产品中文名称：</strong></td>
                <td ><input name="title" type="text" id="title" size="30" maxlength="150">           	</td><td></td><td></td>
          </tr>
          <tr class="tdbg">
                <td width="120" align="right"><strong>产品英文名称：</strong></td>
                <td ><input name="title_en" type="text" id="title_en" size="30" maxlength="150">           	</td><td></td><td></td>
          </tr>
     
        <!--双语开始-->
		      <tr class="tdbg">
                <td width="120" align="right"><strong>简要介绍(中文)：</strong></td>
                <td>
				  <textarea name="f_body" cols="62" rows="4" id="f_body"></textarea>				</td>
                <td  width="120" align="right"><strong>简要介绍(英文)：</strong></td><td><textarea name="f_body_en" cols="62" rows="4" id="f_body_en"></textarea></td>
          </tr>
              <tr class="tdbg">
                <td width="120" align="right"><strong >规格：</strong></td>
                <td>
    <!-- #INCLUDE file="../fckeditor.asp" -->
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
    %>	                </td>  <td  width="120" align="right"><strong >英文(spicificaions)：</strong></td>
    <td><%
    oFCKeditor.Value = ""
    oFCKeditor.Create "z_body_en"
    %></td>        
          </tr>
             
           <tr class="tdbg2">
            <td width="120" align="right" class="tdbg"><p><strong>尺寸图：</strong></td>
        <td class="tdbg">               
    <%
    oFCKeditor.Value = ""
    oFCKeditor.Create "pro_danwei"
    %>        </td>
        <td class="tdbg" align="right"><strong>英文(dimension drawing)：</strong></td><td class="tdbg"><%
    oFCKeditor.Value = ""
    oFCKeditor.Create "pro_danwei_en"
    %></td>
          </tr>
          
          <tr class="tdbg2">
<td width="120" align="right" class="tdbg"><strong>流明图：</strong></td>
<td class="tdbg" > <%
		oFCKeditor.Value = ""
    oFCKeditor.Create "pro_color"
    %></td><td  class="tdbg" align="right"><strong>英文(lumen)：</strong></td><td  class="tdbg"><%
		oFCKeditor.Value = ""
    oFCKeditor.Create "pro_color_en"
    %></td> 
          </tr>
          
          <tr class="tdbg2">
<td width="120" align="right" class="tdbg"><strong>通道图：</strong></td>
<td class="tdbg" ><strong>
            <%
		oFCKeditor.Value = ""
    oFCKeditor.Create "pro_guige"
    %>
            </strong></td><td  align="right" class="tdbg"><strong>英文(dmx channels)：</strong></td><td class="tdbg"><strong>
            <%
		oFCKeditor.Value = ""
    oFCKeditor.Create "pro_guige_en"
    %>
            </strong></td> 
          </tr>
          
<tr class="tdbg2">
<td width="120" align="right" class="tdbg"><strong>相关产品：</strong></td>
<td class="tdbg" >
            <strong>
            <%
		oFCKeditor.Value = ""
    oFCKeditor.Create "pro_money"
    %>
            </strong></td><td  align="right" class="tdbg"><strong>英文(related products)：</strong></td><td class="tdbg"><strong>
            <%
		oFCKeditor.Value = ""
    oFCKeditor.Create "pro_money_en"
    %>
            </strong></td> </tr>
            <!--双语结束-->
        <tr class="tdbg" >          
            <td width="120" align="right"><strong>图片上传(图片尺寸最适合为400*400)：</strong></td>          
            <td  colspan="3"><IFRAME id="frame1" name="frame1" style="margin-top:2px;"height=22 src="up.asp?frameid=frame1&kuang=img_sl" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="img_sl" id="img_sl"></td>
        </tr>
        
<!--在此处可加多图上传-->
<tr class="tdbg" >          
                <td width="120" align="right"><strong>多图上传(大小限制400KB，尺寸最适合为560*560，*)：</strong></td>          
                <td  class="tdbg" colspan="3"><IFRAME id="fra" name="fra"  height=240 src="../pro_img/img_add.asp" width="630" frameborder=0 scrolling="auto"></iframe></td>
          </tr>
              <tr class="tdbg">
    <td align="right"><STRONG>显示顺序：</STRONG></td>
    <td colspan="3"><input name="px" type="text" id="px" value="100" size="10" maxlength="10" >
      <FONT color=red>*(从大到小排序)</FONT></td>
  </tr> 
      </table>
  <p align="center">
  <input type="submit" name="Submit" value=" 添 加 "> &nbsp;       <input type="button" name="Submit2" value=" 取 消 " onClick="location='default.asp'"></p>
</form>
