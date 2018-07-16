<!--#include file="top.asp" -->
<%
	id=request("id")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		
		lm=rs("lm")
		title=rs("title")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from pro_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" &gt; "&rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing
	
	'二级分类
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm,id_lm,fid from pro_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" &gt; "&rsa("title_lm")
		id_lm=rsa("id_lm")
		fid=rsa("fid")
	end if
	rsa.close
	set rsa=nothing
	
	if fid=0 then
		dlm=id_lm
		xlm=""
	else
		dlm=fid
		xlm=id_lm
	end if

%>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11">&nbsp;</td>
    <td width="239" valign="top"><!--#include file="pro_left.asp"-->
    
    
      <table width="239" height="24" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="239" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/products_dianh.jpg" width="239" height="74" /></td>
        </tr>
      </table></td>
    <td width="36" height="100">&nbsp;</td>
    <td valign="top"><table width="707" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="379" height="29"><strong>产品展示</strong></td>
        <td width="328" align="right" class="weiz" style="padding-right:15px;">您当前位置：<a href="#">首页</a> &gt;&gt; <a href="#">产品中心</a></td>
      </tr>
      <tr>
        <td colspan="2"><img src="images/products_tiao.jpg" width="707" height="1" /></td>
      </tr>
    </table>
      <table width="707" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
    <div class="nei_title"><%=title%></div>
    <div class="nei_img"><img src="<%=getbpic(img_sl,"d")%>" onload="if (this.width>700){this.height=700*this.height/this.width;this.width=700;}" /></div>
    <div class="nei_body"><%=z_body%></div>
   <div></div>
      <table width="707" height="26" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
  </td>
  </tr>
</table>
<!--#include file="foot.asp" -->