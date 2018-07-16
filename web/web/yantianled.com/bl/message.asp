<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<script language="javascript">
function check(){
	title=document.getElementById("title");
	rename=document.getElementById("rename");
	email=document.getElementById("email");
	safecode=document.getElementById("safecode");
	if (title.value==""){
		alert("El título no puede estar vacío")
		title.focus()
		return false
	}
	if (rename.value==""){
		alert("El nombre no puede estar vacío")
		person.focus()
		return false
	}
	if (email.value==""){
		alert("El correo electrónico no puede estar vacío")
		email.focus()
		return false
	}
	if (safecode.value==""){
		alert("El código no puede estar vacío")
		safecode.focus()
		return false
	}
}
</script>
<style>
.lyb_bor{border:1px solid #ccc;font-size:12px;}
.lyb_inp{ height:15px;}
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="header">
	<div id="logo"><div class="lan"><a href="../en/index.asp">English</a>　|　<a href="#">Idioma español</a></div></div>
    <div id="nav">
   <ul id="nav_ul">
        <li><a href="index.asp" class="b1"></a></li>
        <li><a href="about.asp" class="b2"></a></li>
        <li><a href="products.asp" class="b3"></a></li>
        <li><a href="message.asp" class="b4 c4"></a></li>
         <li><a href="service.asp?id=3" class="b5"></a></li>
        <li><a href="contact.asp?id=2" class="b6"></a></li>
   </ul>
    </div>
</div>
<div class="clear"></div>
<div id="main">
		<!--#include file="banner.asp"-->
    <div id="indProList">
    	<p class="indProTitle1">Categorías de productos</p>
        <div class="indPlist">
        	<p class="indPimg"><%
set rs=server.CreateObject("ADODB.recordset")
rs.open "select top 5 title,img_sl,link_url from info_co where lm=1 and pass='yes' order by px desc,id desc",conn,1,1
if not rs.eof then
	a=1
	while not rs.eof
		if a=1 then
			files="../"&rs("img_sl")
			links=rs("link_url")
			texts=rs("title")
			a=2
		else
			files=files&"|../"&rs("img_sl")
			links=links&"|"&rs("link_url")
			texts=texts&"|"&rs("title")
		end if
	rs.movenext
	wend
%>
	<script>
    var swf_width=187;
    var swf_height=151;
    var files = "<%=files%>";
    var links = "<%=links%>";
    var texts = "";
    // 0xffffff:文字颜色|1:文字位置|0x0066ff:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|8:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口
    var swf_config = "|2|||0xFFFFFF|0xb70211||5|2|1|_blank"
    
    document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'" IsShowBtn="0" >');
    document.write('<param name="movie" value="images/bcastr.swf"><param name="quality" value="high">');
    document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
    document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'" >');
    document.write('<embed src="images/bcastr.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'"  menu="false" quality="high" width="'+swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
    </script>
<%
end if
rs.close
set rs=nothing
%></p>
            <ul class="indPlist1">
            	  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_bl from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="products.asp?lm=<%=rs("id_lm")%>">• <%=rs("title_lm_bl")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
            </ul>
            <p class="indPimg"><a href="products.asp"><img src="images/cp-_32.jpg" width="187" height="126" /></a></p>
        </div>
    </div>
    <div id="indRight">
      <div id="indPro">
        	<p class="nindProTitle">Tablón de mensajes</p>
            <div style="padding:15px; line-height:180%; padding-top:25px;_height:400px;min-height:400px;">

<%
		Set rs= Server.CreateObject("ADODB.Recordset")
		sql="select * from book where id_re=0 and pass='yes'order by id desc"
		rs.open sql,conn,1,1
		if not rs.eof then
			pagenum=5
			rs.pagesize=pagenum
			counter=rs.recordcount
			pagezong=rs.pagecount
			pageno=replace(trim(request.querystring("page")),"'","")
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
		while not rs.eof and a<=pagenum
		%>
		<TABLE width="100%" border=0 align="center" cellPadding=0 cellSpacing=0 style="border-left:1px solid #d4d3d1;border-right:1px solid #d4d3d1; " >
		  <TBODY>
			<TR>
			  <TD  bgColor=#eeeded style="border-top:1px solid #d4d3d1;border-bottom:1px solid #d4d3d1;">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="3%"><img height=20 src="images/lyb04.gif" width=20></td>
					<td width="97%"><datetime><%=rs("wtime")%></datetime>&nbsp;&nbsp; 
					<b>
					<user><%=rs("rename")%></user>
					</b> Mensaje：</td>
				  </tr>
				</table>
			  </TD>
			</TR>
			<TR>
			  <TD  align=left style="padding-top:2px; padding-left:20px;">
				<font color="#330000"><B><%=rs("title_bl")%></B></font><br>
                <CONTENT><%=rs("z_body_bl")%></CONTENT>
			  </TD>
			</TR>
			<%
			sql="select top 1 * from book where id_re="&rs("id")
			set rsa=server.CreateObject("adodb.recordset")
			rsa.open sql,conn,1,1
			if not rsa.eof then
			%>
			<TR>
			  <TD >
				<TABLE cellSpacing=0 cellPadding=0 width=100% border=0>
				  <TBODY>
					<TR bgColor=#eff7ff>
					  <TD width=18></TD>
					  <TD width=58><FONT color=blue>【Responder】</FONT></TD>
					  <TD width="496"><% response.write(rsa("wtime")&"&nbsp;&nbsp;"&rsa("rename")&"&nbsp;&nbsp;"&rsa("ip"))%></TD>
					</TR>
					<TR vAlign=top align=left bgColor=#eff7ff height=20>
					  <TD width=18></TD>
					  <TD width=58>
					  <TD><%=rsa("z_body_bl")%></TD>
					</TR>
				  </TBODY>
				</TABLE>
			  </TD>
			</TR>
			<%               
			end if
			rsa.close
			set rsa=nothing
			%>
		  </TBODY>
</TABLE>
			<%
			a=a+1
			rs.movenext
			wend
			rs.close
			set rs=nothing
			%>

            <table width="100%" height="22"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CBD5E9" style="border:1px solid #d4d3d1;">
            <tr>
            <td align="right">
                <%
                call listpage("")
                %>
            </td>
            </tr>
            </table>
	<%end if%><br />


<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="message_add.asp" onsubmit="return check()">
    <tr>
	  <td width="18%" height="25" align="right">Título： </td>
	  <td width="82%" height="25">
      <input name="title" type="text" id="title" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Nombre： 
     <input name="rename" type="text" id="rename" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
	<tr>
	  <td height="25" align="right">E-mail： </td>
	  <td height="25">
      <input name="email" type="text" id="email" maxlength="50"class="lyb_bor lyb_inp"  />
      <font color="#ff0000"> *</font>
&nbsp;Nombre de la compañía： 
<input name="compname" type="text" id="compname" maxlength="50"class="lyb_bor lyb_inp"  />
      </td>	
    </tr>

	<tr>
	  <td height="25" align="right"> Tel： </td>
	  <td height="25">
      <input name="phone" type="text" id="phone" maxlength="50" class="lyb_bor lyb_inp"  /> 
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dirección： 
     <input name="address" type="text" id="address" maxlength="50" class="lyb_bor lyb_inp" /></td>
    </tr>
	<tr>
	  <td align="right">Contenido：</td>
	  <td><textarea name="z_body" cols="52" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea></td>
	</tr>
	 <tr>
	  <td height="30" align="right">Código：</td>
	  <td><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style="float:left; margin-right:5px;"/><img src="../admin/getcode.asp?t=Math.random()" onClick="this.src='../admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
	</tr>
	<tr>
	  <td height="40" align="right"></td>
	  <td><input name="submit" type="submit" id="submit2" value=" Post " class="lyb_bor lyb_btn" />
		  　<input type="reset" name="Submit" value=" Reset " class="lyb_bor lyb_btn" /></td>
	</tr>
	</form>
</table>
</div>
       <div class="clear"></div>
<div class="page" style="text-align:right;"><a href="javascript:history.Espalda();">[Espalda]</a></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--#include file="foot.asp"-->
</body>
</html>
