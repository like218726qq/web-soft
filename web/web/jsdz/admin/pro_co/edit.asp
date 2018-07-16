<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

id=request("id")
w_url=request.ServerVariables("HTTP_REFERER")
if id="" or not checknum(id) then 
	call msg("参数错误","")
end if

'连接数据库
openconn

Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from pro_co where id="&id
rs.open sql,conn,1,1
if rs.eof then 
	call msg("该信息不存在,或已删除!","")
else
	lm=rs("lm")
	title=rs("title")
	title_en=rs("title_en")
	pro_danwei=rs("pro_danwei")
	pro_guige=rs("pro_guige")
	pro_color=rs("pro_color")
	pro_money=rs("pro_money")
	f_body=rehtml(rs("f_body"))
	f_body_en=rehtml(rs("f_body_en"))
	z_body=rs("z_body")
	z_body_en=rs("z_body_en")
	z_body_1=rs("z_body_1")
	z_body_1_en=rs("z_body_1_en")
	z_body_2=rs("z_body_2")
	z_body_2_en=rs("z_body_2_en")
	z_body_3=rs("z_body_3")
	z_body_3_en=rs("z_body_3_en")
	z_body_4=rs("z_body_4")
	z_body_4_en=rs("z_body_4_en")
	img_sl=rs("img_sl")
	px=rs("px")
	ej_lx=rs("ej_lx")
	ej_lx=rs("ej_lx")
	sj_lx=rs("sj_lx")
	sm_lx=rs("sm_lx")
	ej_fs=rs("ej_fs")
	sj_pp=rs("sj_pp")
	ej_fg=rs("ej_fg")
	ej_xk=rs("ej_xk")
	ej_xk1=rs("ej_xk1")
	ej_xk2=rs("ej_xk2")
end if
rs.close
set rs=nothing

'获取该信息所在分类是否可添加信息
set rs=server.CreateObject("adodb.recordset")
sql="select add_xx from pro_lm where id_lm="&lm&""
rs.open sql,conn,1,1
if rs.eof then
	call msg("该信息对应的分类不存在或已删除","")
else
	add_xx=rs("add_xx")
end if
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品修改</title>
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

<body>
<DIV id=popImageLayer style="VISIBILITY: hidden; WIDTH: 267px; CURSOR: hand; POSITION: absolute; HEIGHT: 260px; background-image:url(../images/bbg.gif); z-index: 100;" align=center  name="popImageLayer"  ></DIV>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">  
    <tr class="topbg">    
        <td colspan="2"  align="center">
            产品中心管理----产品修改
        </td>  
    </tr> 
    <tr class="tdbg">    
        <td width="70" height="26" ><strong>管理导航：</strong></td>
        <td ><a href="default.asp">产品管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加产品</a></td>
    </tr>
</table>
<br />
<form method="POST" name="form1" action="editt.asp" onSubmit="return check()" >
<input name="id" value="<%=id%>" type="hidden">
<input  type="hidden" name="w_url" value="<%=w_url%>">
      <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
        <tr class="title">
          <td  align="center" colspan="2" >产品修改</td>
        </tr>
		<tr class="tdbg">
		  <td align="right"><strong >所属分类：</strong></td>
          <td>				  
            <select name="lm">
				<option value="n" selected>请选择分类</option>
				<%  
                '添加信息时显示分类过程
                Set rsa= Server.CreateObject("ADODB.Recordset")
                sql="select * from pro_lm where fid=0 order by px desc,id_lm desc"
                rsa.open sql,conn,1,1
                while not rsa.eof 	
					i=""
					if rsa("add_xx")="yes" then
						response.write"<OPTION value='"&rsa("id_lm")&"' >• "&rsa("title_lm")&"</OPTION>"&chr(10)
					elseif add_xx="no" then
						response.write"<OPTION value='"&rsa("id_lm")&"' >• "&rsa("title_lm")&"</OPTION>"&chr(10)
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
						response.write("<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"</option>")&chr(10)
					elseif add_xx="no" then
						response.write("<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"</option>")&chr(10)
					else
						response.write("<option value='no'>"&i&" 　|—"&rsb("title_lm")&"×</option>")&chr(10)
					end if
					call addinfo(rsb("id_lm"),i&" 　|&nbsp;")
					rsb.movenext
                wend
                rsb.close
                set rsb=nothing
                end sub
                %>
             </select>
			 <script>
             document.form1.lm.value=<%=lm%>
             <%
             if add_xx="no" then
                 response.write chr(10)&"document.form1.lm.disabled='disabled';"
             end if
             %>
             </script>
              <%
             if add_xx="no" then
                 response.write"<input type='hidden' name='lm' value='"&lm&"'>"
             end if
             %>
             
             </td>
            </tr>
          <tr class="tdbg">
            <td width="120" align="right"><strong>产品名称：</strong></td>
            <td ><input name="title" type="text" id="title" value="<%=title%>" size="30" maxlength="150"></td>
          </tr>
          <tr class="tdbg">
            <td width="120" align="right"><strong>产品名称(英文)：</strong></td>
            <td ><input name="title_en" type="text" id="title_en" value="<%=title_en%>" size="30" maxlength="150"></td>
          </tr>
      	<tr class="tdbg2">
            <td width="120" align="right" class="tdbg"><strong>产品型号：</strong></td>
        	<td class="tdbg"><strong><input name="pro_danwei" type="text" id="pro_danwei" maxlength="50"  value="<%=pro_danwei%>"></strong></td>
        </tr>
<!--		  <tr class="tdbg2">
                <td width="120" align="right" class="tdbg"><strong>产品单位：</strong></td>
        <td class="tdbg">               
    <input name="pro_danwei" type="text" id="pro_danwei" maxlength="50">
                　产品颜色：
                <input name="pro_color" type="text" id="pro_color" maxlength="50" value="<%=pro_color%>">            </td>
	    </tr>
<tr class="tdbg2">
<td width="120" align="right" class="tdbg"><strong>产品规格：</strong></td>
      <td class="tdbg" ><input name="pro_guige" type="text" id="pro_guige" maxlength="50" value="<%=pro_guige%>">　
              产品售价：
              <input name="pro_money" type="text" id="pro_money" maxlength="50" value="<%=pro_money%>">              </td>
        </tr>-->
		<tr class="tdbg">
                <td width="120" align="right"><strong>缩小选择范围：</strong><br />(请对应产品的分<br />类再做具体选择)</td>
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
                                  	<option value="0" <%if ej_lx="0" then%> selected="selected"<%end if%>>--请选择--</option>
                                	<option value="1" <%if ej_lx="1" then%> selected="selected"<%end if%>>耳机</option>
                                    <option value="2" <%if ej_lx="2" then%> selected="selected"<%end if%>>耳麦</option>
                                    <option value="3" <%if ej_lx="3" then%> selected="selected"<%end if%>>耳塞</option>
                                </select>
                            </td>
              <td height="30" align="left">
                            	&nbsp;&nbsp;产品类型：
								<select name="sj_lx">
									<option value="0" <%if sj_lx="0" then%> selected="selected"<%end if%>>--请选择--</option>
                                	<option value="1" <%if sj_lx="1" then%> selected="selected"<%end if%>>保护壳</option>
                                    <option value="2" <%if sj_lx="2" then%> selected="selected"<%end if%>>保护膜</option>
                                    <option value="3" <%if sj_lx="3" then%> selected="selected"<%end if%>>数据线</option>
									<option value="4" <%if sj_lx="4" then%> selected="selected"<%end if%>>其他</option>
                                </select>
                            </td>
              				<td height="30" align="left">
                            	&nbsp;&nbsp;产品类型：
								<select name="sm_lx">
                                	<option value="0" <%if sm_lx="0" then%> selected="selected"<%end if%>>--请选择--</option>
                                	<option value="1" <%if sm_lx="1" then%> selected="selected"<%end if%>>移动电源</option>
                                    <option value="2" <%if sm_lx="2" then%> selected="selected"<%end if%>>数码贴膜</option>
                                    <option value="3" <%if sm_lx="3" then%> selected="selected"<%end if%>>读卡器</option>
                                    <option value="4" <%if sm_lx="4" then%> selected="selected"<%end if%>>充电器</option>
   									<option value="5" <%if sm_lx="5" then%> selected="selected"<%end if%>>其他</option>
                                </select>
                            </td>
                      </tr>
                      <tr class="tdbg2">
               	  			<td height="30" align="left">&nbsp;&nbsp;佩戴方式：
                          		<select name="ej_fs">
                                	<option value="0" <%if ej_fs="0" then%> selected="selected"<%end if%>>--请选择--</option>
                                	<option value="1" <%if ej_fs="1" then%> selected="selected"<%end if%>>头戴式</option>
                                    <option value="2" <%if ej_fs="2" then%> selected="selected"<%end if%>>耳塞式</option>
                                    <option value="3" <%if ej_fs="3" then%> selected="selected"<%end if%>>入耳式</option>
                                    <option value="4" <%if ej_fs="4" then%> selected="selected"<%end if%>>耳挂式</option>
                                    <option value="5" <%if ej_fs="5" then%> selected="selected"<%end if%>>后挂式</option>
                                </select>
                        </td>
              <td height="30" align="left">
                            	&nbsp;&nbsp;手机品牌：
              					  <select name="sj_pp">
                                  	<option value="0" <%if sj_pp="0" then%> selected="selected"<%end if%>>--请选择--</option>
                                	<option value="1" <%if sj_pp="1" then%> selected="selected"<%end if%>>苹果配件</option>
                                    <option value="2" <%if sj_pp="2" then%> selected="selected"<%end if%>>三星配件</option>
                                    <option value="3" <%if sj_pp="3" then%> selected="selected"<%end if%>>其他</option>
                                </select>
                        </td>
                      <td height="30" align="left">&nbsp;</td>
                      </tr>
                      <tr class="tdbg2">
               	  			<td height="30" align="left">
                            	&nbsp;&nbsp;风格定位：
                          		  <select name="ej_fg">
                                  	<option value="0" <%if ej_fg="0" then%> selected="selected"<%end if%>>--请选择--</option>
                                	<option value="1" <%if ej_fg="1" then%> selected="selected"<%end if%>>时尚耳机</option>
                                    <option value="2" <%if ej_fg="2" then%> selected="selected"<%end if%>>运动耳机</option>
                                    <option value="3" <%if ej_fg="3" then%> selected="selected"<%end if%>>游戏耳机</option>
                                    <option value="4" <%if ej_fg="4" then%> selected="selected"<%end if%>>学生耳机</option>
                                </select>
                        </td>
                      <td height="30" align="left">&nbsp;</td>
                      <td height="30" align="left">&nbsp;</td>
                      </tr>
                      <tr class="tdbg2">
               	  			<td height="30" align="left">
                                &nbsp;&nbsp;线控类别：
                          		<select name="ej_xk">
                                	<option value="0" <%if ej_xk="0" then%> selected="selected"<%end if%>>--请选择--</option>
                                	<option value="1" <%if ej_xk="1" then%> selected="selected"<%end if%>>苹果线控</option>
                                    <option value="2" <%if ej_xk="2" then%> selected="selected"<%end if%>>音量线控</option>
                                    <option value="3" <%if ej_xk="3" then%> selected="selected"<%end if%>>通话线控</option>
                                    <option value="4" <%if ej_xk="4" then%> selected="selected"<%end if%>>无线控</option>
                                </select><br />
                                &nbsp;&nbsp;线控类别1：
                          		<select name="ej_xk1">
                                	<option value="0" <%if ej_xk1="0" then%> selected="selected"<%end if%>>--请选择--</option>
                                	<option value="1" <%if ej_xk1="1" then%> selected="selected"<%end if%>>苹果线控</option>
                                    <option value="2" <%if ej_xk1="2" then%> selected="selected"<%end if%>>音量线控</option>
                                    <option value="3" <%if ej_xk1="3" then%> selected="selected"<%end if%>>通话线控</option>
                                    <option value="4" <%if ej_xk1="4" then%> selected="selected"<%end if%>>无线控</option>
                                </select><br />
                                &nbsp;&nbsp;线控类别2：
                          		<select name="ej_xk2">
                                	<option value="0" <%if ej_xk2="0" then%> selected="selected"<%end if%>>--请选择--</option>
                                	<option value="1" <%if ej_xk2="1" then%> selected="selected"<%end if%>>苹果线控</option>
                                    <option value="2" <%if ej_xk2="2" then%> selected="selected"<%end if%>>音量线控</option>
                                    <option value="3" <%if ej_xk2="3" then%> selected="selected"<%end if%>>通话线控</option>
                                    <option value="4" <%if ej_xk2="4" then%> selected="selected"<%end if%>>无线控</option>
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
				  <textarea name="f_body" cols="72" rows="4" id="f_body"><%=f_body%></textarea>				</td>
          </tr>
          <tr class="tdbg">
                <td width="120" align="right"><strong>简要介绍(英文)：</strong></td>
                <td>
				  <textarea name="f_body_en" cols="72" rows="4" id="f_body_en"><%=f_body_en%></textarea>				</td>
          </tr>
              <tr class="tdbg">
                <td width="120" align="right"><strong >产品特征：</strong></td>
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
                oFCKeditor.Value = z_body
                oFCKeditor.Create "z_body"
                %>		  		</td>
              </tr>
              <tr class="tdbg">
              <td width="120" align="right"><strong >产品特征(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = z_body_en
                oFCKeditor.Create "z_body_en"
                %>
                </td>   
              </tr>
              <tr class="tdbg"> 
                <td width="120" align="right"><strong >规格参数：</strong></td>
                <td>
				<%
                oFCKeditor.Value = z_body_1
                oFCKeditor.Create "z_body_1"
                %>
                </td>  
             </tr>
             <tr class="tdbg">
                <td width="120" align="right"><strong >规格参数(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = z_body_1_en
                oFCKeditor.Create "z_body_1_en"
                %>
                </td>         
          </tr>
          <tr class="tdbg"> 
                <td width="120" align="right"><strong >产品实拍：</strong></td>
                <td>
				<%
                oFCKeditor.Value = z_body_2
                oFCKeditor.Create "z_body_2"
                %>
                </td>  
             </tr>
             <tr class="tdbg">
                <td width="120" align="right"><strong >产品实拍(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = z_body_2_en
                oFCKeditor.Create "z_body_2_en"
                %>
                </td>         
          </tr>
           <tr class="tdbg"> 
                <td width="120" align="right"><strong >个性定制：</strong></td>
                <td>
				<%
                oFCKeditor.Value = z_body_3
                oFCKeditor.Create "z_body_3"
                %>
                </td>  
             </tr>
             <tr class="tdbg">
                <td width="120" align="right"><strong >个性定制(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = z_body_3_en
                oFCKeditor.Create "z_body_3_en"
                %>
                </td>   
                 <tr class="tdbg"> 
                <td width="120" align="right"><strong >立即购买：</strong></td>
                <td>
				<%
                oFCKeditor.Value = z_body_4
                oFCKeditor.Create "z_body_4"
                %>
                </td>  
             </tr>
             <tr class="tdbg">
                <td width="120" align="right"><strong >立即购买(英文)：</strong></td>
                <td>
				<%
                oFCKeditor.Value = z_body_4_en
                oFCKeditor.Create "z_body_4_en"
                %>
                </td>   
              <tr class="tdbg">
                <td width="120" align="right"><strong>图片上传：</strong></td>
                <td>
               <IFRAME id="frame1" name="frame1" style="margin-top:2px;"height=22 src="uploadd.asp?frameid=frame1&kuang=img_sl&img_sl=<%=img_sl%>" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="img_sl" id="img_sl" value="<%=img_sl%>"></td>
          </tr>
          
<!--在此可加多图上传代码-->

            <tr class="tdbg">
    <td align="right"><STRONG>显示顺序：</STRONG></td>
    <td><input name="px" type="text" id="px" value="<%=px%>" size="10" maxlength="10" >
      <FONT color=red>*(从大到小排序)</FONT></td>
  </tr>  
      </table>
  <p align="center">  
  <input type="submit" name="Submit" value=" 修 改 "> &nbsp;       <input type="button" name="Submit2" value=" 取 消 " onClick="location='<%=w_url%>'"></P>
</form>
