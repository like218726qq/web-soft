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
.lyb_inp{ height:15px;}
</style>
 <form name="form1" method="post" action="html.message_add.asp" onsubmit="return check()"  style=" width:90%; padding:20px 0px; margin:20px auto; border:1px solid #dcdcdc;">
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
	  <td height="25" align="right">标　　题： </td>
	  <td height="25">
      <input name="title" type="text" id="title" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      　　姓　　名： 
	  <input name="rename" type="text" id="rename" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>
      </td>
    </tr>
	<tr>
	  <td height="25" align="right">电子邮箱： </td>
	  <td height="25">
      <input name="email" type="text" id="email" maxlength="50"class="lyb_bor lyb_inp"  />
      <font color="#ff0000">*</font>
      　　公司名称： 
	  <input name="compname" type="text" id="compname" maxlength="50"class="lyb_bor lyb_inp"  />
      </td>	
    </tr>

	<tr>
	  <td height="25" align="right"> 电　　话： </td>
	  <td height="25">
      <input name="phone" type="text" id="phone" maxlength="50" class="lyb_bor lyb_inp"  />&nbsp;&nbsp;　　 地　　址： 
          <input name="address" type="text" id="address" maxlength="50" class="lyb_bor lyb_inp" /></td>
    </tr>
	<tr>
	  <td align="right">留言内容：</td>
	  <td><textarea name="z_body" cols="50" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea></td>
	</tr>
	 <tr>
	  <td height="30" align="right">验 证 码：</td>
	  <td>
      <table><tr><td><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style=" margin-right:5px;"/>
      </td><td><img src="../admin/getcode.asp?t=Math.random()" onClick="this.src='../admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" >
     </td></tr></table>
      </td>
	</tr>
	<tr>
	  <td height="40" align="right"></td>
	  <td><input name="submit" type="submit" id="submit2" value=" 发 表 " class="lyb_bor lyb_btn" />
		  　<input type="reset" name="Submit" value=" 重 置 " class="lyb_bor lyb_btn" /></td>
	</tr>

</table>
</form>
<form style="width:90%; margin:20px auto; padding:0px;">
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
					<td width="3%"><img height=20 src="js/images/lyb04.gif" width=20></td>
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
	<%end if%><br />
</form>

