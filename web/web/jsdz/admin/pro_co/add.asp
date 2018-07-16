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
</script>
</head>

<body >
<DIV id=popImageLayer style="VISIBILITY: hidden; WIDTH: 267px; CURSOR: hand; POSITION: absolute; HEIGHT: 260px; background-image:url(../images/bbg.gif); z-index: 100;" align=center  name="popImageLayer"  ></DIV>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">  
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

        <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
        <tr class="title">
          <td  align="center" colspan="2" >产品添加</td>
        </tr>
		<tr class="tdbg">
		  <td width="120" align="right"><strong >所属分类：</strong></td>
          <td>
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
                        response.write"<OPTION value='"&rsa("id_lm")&"'>• "&rsa("title_lm")&"</OPTION>"&chr(10)
                    else
                        response.write"<OPTION value='no'>• "&rsa("title_lm")&"×</OPTION>"&chr(10)
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
                        response.write"<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"</option>"&chr(10)
                    else
                        response.write"<option value='no'>"&i&" 　|—"&rsb("title_lm")&"×</option>"&chr(10)
                    end if
                    call addinfo(rsb("id_lm"),i&" 　|&nbsp;")
                    rsb.movenext
                wend
                rsb.close
                set rsb=nothing
                end sub
                %>
             </select>			</td>
            </tr>
          <tr class="tdbg">
                <td width="120" align="right"><strong>产品名称：</strong></td>
                <td ><input name="title" type="text" id="title" size="30" maxlength="150">           	</td>
          </tr>
     	<tr class="tdbg">
                <td width="120" align="right"><strong>产品名称(英文)：</strong></td>
                <td ><input name="title_en" type="text" id="title_en" size="30" maxlength="150">           	</td>
          </tr>
        <tr class="tdbg2">
            <td width="120" align="right" class="tdbg"><strong>产品型号：</strong></td>
        	<td class="tdbg"><strong><input name="pro_danwei" type="text" id="pro_danwei" maxlength="50"></strong></td>
        </tr>
       <!-- <tr class="tdbg2" style="display:none">
            <td width="120" align="right" class="tdbg"><strong>产品颜色：</strong></td>
        	<td class="tdbg"><strong><input name="pro_color" type="text" id="pro_color" maxlength="50"></strong></td>
        </tr>
		<tr class="tdbg2">
            <td width="120" align="right" class="tdbg"><strong>产品规格：</strong></td>
            <td class="tdbg" ><strong>
                    <input name="pro_guige" type="text" id="pro_guige" maxlength="50">　</strong> 产品售价：<strong>
                    <input name="pro_money" type="text" id="pro_money2" maxlength="50">
            </strong> </td>
          </tr>-->
          <tr class="tdbg">
                <td width="120" align="right"><strong>缩小选择范围：</strong><br />(请对应产品的分类)</td>
                <td>
                	<table border="0" cellpadding="0" cellspacing="1" width="50%" bgcolor="#FFFFFF">
	    <tr class="tdbg2">
                       	  <td align="center" height="30px">
                            	耳机产品                          </td>
                            <td align="center">
                            	手机装备                            </td>
                            <td align="center">
                            	数码装备                            </td>
                        </tr>
                      	<tr class="tdbg2">
               	  			<td height="30" align="left">
                            	&nbsp;&nbsp;产品类型：
                   		          <select name="ej_lx">
                                	<option value="1">耳机</option>
                                    <option value="2">耳麦</option>
                                    <option value="3">耳塞</option>
                                </select>
                            </td>
              <td height="30" align="left">
                            	&nbsp;&nbsp;产品类型：
<select name="sj_lx">
                                	<option value="1">保护壳</option>
                                    <option value="2">保护膜</option>
                                    <option value="3">数据线</option>
									<option value="4">其他</option>
                                </select>
                            </td>
              <td height="30" align="left">
                            	&nbsp;&nbsp;产品类型：
<select name="sm_lx">
                                	<option value="1">移动电源</option>
                                    <option value="2">数码贴膜</option>
                                    <option value="3">读卡器</option>
                                    <option value="4">充电器</option>
   									<option value="5">其他</option>
                                </select>
                            </td>
                      </tr>
                      <tr class="tdbg2">
               	  			<td height="30" align="left">&nbsp;&nbsp;佩戴方式：
                          		<select name="ej_fs">
                                	<option value="1">头戴式</option>
                                    <option value="2">耳塞式</option>
                                    <option value="3">入耳式</option>
                                    <option value="4">耳挂式</option>
                                    <option value="5">后挂式</option>
                                </select>
                        </td>
              <td height="30" align="left">
                            	&nbsp;&nbsp;手机品牌：
              					  <select name="sj_pp">
                                	<option value="1">苹果配件</option>
                                    <option value="2">三星配件</option>
                                    <option value="3">其他</option>
                                </select>
                        </td>
                      <td height="30" align="left">&nbsp;</td>
                      </tr>
                      <tr class="tdbg2">
               	  			<td height="30" align="left">
                            	&nbsp;&nbsp;风格定位：
                          		  <select name="ej_fg">
                                	<option value="1">时尚耳机</option>
                                    <option value="2">运动耳机</option>
                                    <option value="3">游戏耳机</option>
                                    <option value="4">学生耳机</option>
                                </select>
                        </td>
                      <td height="30" align="left">&nbsp;</td>
                      <td height="30" align="left">&nbsp;</td>
                      </tr>
                      <tr class="tdbg2">
               	  			<td height="30" align="left" style="line-height:30px">
                                &nbsp;&nbsp;线控类别：
                          		<select name="ej_xk">
                                	<option value="1">苹果线控</option>
                                    <option value="2">音量线控</option>
                                    <option value="3">通话线控</option>
                                    <option value="4">无线控</option>
                                </select><br />
                                &nbsp;&nbsp;线控类别1：
                          		<select name="ej_xk1">
                                	<option value="1">苹果线控</option>
                                    <option value="2">音量线控</option>
                                    <option value="3">通话线控</option>
                                    <option value="4">无线控</option>
                                </select><br />
                                &nbsp;&nbsp;线控类别2：
                          		<select name="ej_xk2">
                                	<option value="1">苹果线控</option>
                                    <option value="2">音量线控</option>
                                    <option value="3">通话线控</option>
                                    <option value="4">无线控</option>
                                </select>
                        </td>
                      <td height="30" align="left">&nbsp;</td>
                      <td height="30" align="left">&nbsp;</td>
                      </tr>
                  </table>
            </td>
          </tr>
		  <tr class="tdbg">
                <td width="120" align="right"><strong>简要介绍：</strong></td>
                <td>
				  <textarea name="f_body" cols="72" rows="4" id="f_body"></textarea>				</td>
          </tr>
          <tr class="tdbg">
                <td width="120" align="right"><strong>简要介绍(英文)：</strong></td>
                <td>
				  <textarea name="f_body_en" cols="72" rows="4" id="f_body_en"></textarea>				</td>
          </tr>
              <tr class="tdbg">
                <td width="120" align="right"><strong >详细介绍：</strong></td>
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
    %>	                </td>          
          </tr>
          <tr class="tdbg">
          <td width="120" align="right"><strong >详细介绍(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = ""
                oFCKeditor.Create "z_body_en"
                %>
                </td>          
          </tr>
           <tr class="tdbg"> 
                <td width="120" align="right"><strong >规格参数：</strong></td>
                <td>
				<%
                oFCKeditor.Value = ""
                oFCKeditor.Create "z_body_1"
                %>
                </td>  
             </tr>
             <tr class="tdbg">
                <td width="120" align="right"><strong >规格参数(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = ""
                oFCKeditor.Create "z_body_1_en"
                %>
                </td>         
          </tr>
          <tr class="tdbg"> 
                <td width="120" align="right"><strong >产品实拍：</strong></td>
                <td>
				<%
                oFCKeditor.Value = ""
                oFCKeditor.Create "z_body_2"
                %>
                </td>  
             </tr>
             <tr class="tdbg">
                <td width="120" align="right"><strong >产品实拍(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = ""
                oFCKeditor.Create "z_body_2_en"
                %>
                </td>         
          </tr>
          <tr class="tdbg"> 
                <td width="120" align="right"><strong >个性定制：</strong></td>
                <td>
				<%
                oFCKeditor.Value = ""
                oFCKeditor.Create "z_body_3"
                %>
                </td>  
             </tr>
             <tr class="tdbg">
                <td width="120" align="right"><strong >个性定制(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = ""
                oFCKeditor.Create "z_body_3_en"
                %>
                </td>         
          </tr>
          <tr class="tdbg"> 
                <td width="120" align="right"><strong >立即购买：</strong></td>
                <td>
				<%
                oFCKeditor.Value = ""
                oFCKeditor.Create "z_body_4"
                %>
                </td>  
             </tr>
             <tr class="tdbg">
                <td width="120" align="right"><strong >立即购买(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = ""
                oFCKeditor.Create "z_body_4_en"
                %>
                </td>         
          </tr>
        <tr class="tdbg" >          
            <td width="120" align="right"><strong>图片上传：</strong></td>          
            <td ><IFRAME id="frame1" name="frame1" style="margin-top:2px;"height=22 src="up.asp?frameid=frame1&kuang=img_sl" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="img_sl" id="img_sl"></td>
        </tr>
              <tr class="tdbg">
    <td align="right"><STRONG>显示顺序：</STRONG></td>
    <td><input name="px" type="text" id="px" value="100" size="10" maxlength="10" >
      <FONT color=red>*(从大到小排序)</FONT></td>
  </tr> 
      </table>
  <p align="center">
  <input type="submit" name="Submit" value=" 添 加 "> &nbsp;       <input type="button" name="Submit2" value=" 取 消 " onClick="location='default.asp'"></p>
</form>
