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
		alert("标题不能为空")
		title.focus()
		return false
	}
	if (rename.value==""){
		alert("姓名不能为空")
		rename.focus()
		return false
	}
	if (email.value==""){
		alert("电子邮箱不能为空")
		email.focus()
		return false
	}
	if (safecode.value==""){
		alert("验证码不能为空")
		safecode.focus()
		return false
	}
}
</script>
<style>
.lyb_bor{border:1px solid #ccc;font-size:12px;}
.lyb_inp{ height:16px; line-height:16px; padding:2px;}
.lyb_inp_01{height:20px; line-height:20px; width:80px;}
</style>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<script src="js/DD.min.js" mce_src="js/DD.min.js"></script>
<script type="text/javascript">     /* EXAMPLE */ 
  DD_belatedPNG.fix('div,img');  
   
 </script> 
</head>

<body>

<!--TOP部分-->
<div id="TOP">
    <div id="TOPIN">
        <div id="LOGO"><A href="index.asp"><img src="images/index_02.jpg" width="549" height="87" /></A></div>
        <div id="top_right">
            <div id="link"><A href="#"><img src="images/index_05.jpg" /></A><A href="../en/index.asp"><img src="images/index_01_07.jpg" /></A></div>
            <div id="pt">24小时服务热线：020-28320269</div>
        </div>
        <div class="clear"></div>
    </div>
    <div id="NAV">
       <ul>
            <li><a href="index.asp" class="a1"></a></li>
            <li><a href="about.asp" class="a2"></a></li>
            <li><a href="service.asp" class="a3"></a></li>
            <li><a href="news.asp" class="a4"></a></li>
            <li><a href="price.asp" class="a5"></a></li>
            <li><a href="search.asp" class="a6"></a></li>
            <li><a href="jobs.asp" class="a7"></a></li>
            <li><a href="contact.asp" class="a8"></a></li>
         </ul>
    </div>
    
</div>


<!--MAIN部分-->
<div id="MAIN">
    <!--广告图部分-->
    <!--#include file="banner.asp"-->
    
    <!---->
    <div id="con_main">
        <div id="left">
            <div id="co">
                <div class="co_title"><img src="images/lx_03.jpg" /></div>
                <div class="co_list">
                    <ul>
                    <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title from tol_co where lm=5 order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
                        <li><img src="images/index_34.jpg" /><a href="contact.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
<%
    rs.movenext
	wend
	rs.close
	set rs=nothing
%><li><img src="images/index_34.jpg" /><a href="message.asp">在线留言</a></li>
                    </ul>
                </div>
            </div>
            
            <div id="cygj">
                <div class="cygj_title"><img src="images/1.jpg" /></div>
                <div class="cygj_list">
                    <ul>
<li><A href="callto://zedfreight/" target="_blank"><img src="images/2.jpg" /></A></li>
                        <li><A href="msnim:chat?contact=zedfreight@hotmail.com" target="_blank"><img src="images/3.jpg" /></A></li>
                        <li><A href="#" target="_blank"><img src="images/4.jpg" /></A></li>
                        <li><A href="mailto:postmaster@zedfreight.com" target="_blank"><img src="images/5.jpg" /></A></li>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        
        <div id="right">
            <div id="right_pr_title">
                <h2>在线留言</h2>
                <span>您现在所在位置：首页 > 联系我们 > 在线留言</span>
                <div class="clear"></div>
            </div>
            <div id="right_pr_co">
            <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="message_add.asp" onsubmit="return check()">
    <tr>
	  <td width="31%" height="40" align="right">标　　题： </td>
	  <td width="69%" height="25">
      <input name="title" type="text" class="lyb_bor lyb_inp" id="title" size="60" maxlength="50" />
	  <font color="#ff0000">*</font></td>
    </tr>
        <tr>
	  <td width="31%" height="40" align="right">姓　　名： </td>
	  <td width="69%" height="25"><input name="rename" type="text" id="rename" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>      </td>
    </tr>
	<tr>
	  <td height="40" align="right">电子邮箱： </td>
	  <td height="25">
      <input name="email" type="text" id="email" maxlength="50"class="lyb_bor lyb_inp"  />
      <font color="#ff0000">*</font></td>	
    </tr>
<tr>
	  <td height="40" align="right">公司名称： </td>
	  <td height="25"><input name="compname" type="text"class="lyb_bor lyb_inp" id="compname" size="60" maxlength="50"  />      </td>	
    </tr>
	<tr>
	  <td height="40" align="right"> 电　　话： </td>
	  <td height="25">
      <input name="phone" type="text" class="lyb_bor lyb_inp" id="phone" size="60" maxlength="50"  />&nbsp;&nbsp;</td>
    </tr>
    <tr>
	  <td height="40" align="right"> 地　　址： </td>
	  <td height="25"><input name="address" type="text" class="lyb_bor lyb_inp" id="address" size="60" maxlength="50" /></td>
    </tr>
	<tr>
	  <td height="40" align="right">留言内容：</td>
	  <td><textarea name="z_body" cols="60" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea></td>
	</tr>
	 <tr>
	  <td height="40" align="right">验 证 码：</td>
	  <td><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style="float:left; margin-right:5px;"/><img src="../admin/getcode.asp?t=Math.random()" onClick="this.src='../admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
	</tr>
	<tr>
	  <td height="40" align="right"></td>
	  <td><input name="submit" type="submit" id="submit2" value=" 发 表 " class="lyb_bor lyb_btn" />
		  　<input type="reset" name="Submit" value=" 重 置 " class="lyb_bor lyb_btn" /></td>
	</tr>
	</form>
</table>
<%
		Set rs= Server.CreateObject("ADODB.Recordset")
		sql="select * from book where id_re=0 and pass='yes' and lang='cn' order by id desc"
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
					<td width="3%">&nbsp;</td>
					<td width="97%"><datetime><%=rs("wtime")%></datetime>&nbsp;&nbsp; 
					<b>
					<user><%=rs("rename")%></user>
					</b> 留言：</td>
				  </tr>
				</table>
			  </TD>
			</TR>
			<TR>
			  <TD  align=left style="padding-top:2px; padding-left:20px;">
				<font color="#330000"><B><%=rs("title")%></B></font><br>
                <CONTENT><%=rs("z_body")%></CONTENT>
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
					  <TD width=58><FONT color=blue>【回复】</FONT></TD>

					  <TD width="496"><% response.write(rsa("wtime")&"&nbsp;&nbsp;"&rsa("rename")&"&nbsp;&nbsp;"&rsa("ip"))%></TD>
					</TR>
					<TR vAlign=top align=left bgColor=#eff7ff height=20>
					  <TD width=18></TD>
					  <TD width=58>
					  <TD><%=rsa("z_body")%></TD>
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
	<%end if%>
          
            </div>
            <div class="clear"></div>
        </div>
        
    </div>
    <div class="clear"></div>
    
    <!--#include file="link.asp"-->
    <div class="clear"></div>
    
</div>

<!--BOT部分-->
<!--#include file="foot.asp"-->





</body>
</html>
