<!--#include file="top.asp" -->
<link rel="stylesheet" href="css/MagicZoom.css" type="text/css"/>
<script type="text/javascript" src="script/mz-packed.js"></script>
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
		z_body_en=rs("z_body_en")
		f_body=rs("f_body")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from pro_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" "&rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing
	
	'二级分类
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm,id_lm,fid from pro_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" "&rsa("title_lm")
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
<table width="980" height="154" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0px auto;">
  <tr>
    <td style="padding-top:2px; padding-bottom:1px; background:url(images/n_banner2.jpg) center center no-repeat;"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" style="background:#9f6300;">&nbsp;</td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="170" align="center" valign="top"><!--#include file="pro_left.asp"--></td>
    <td width="810" valign="top"><table width="810" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="30" style="padding-left:20px; color:#d19231;"><div class="nei_bigclass" >Products</div></td>
      </tr>
      <tr>
        <td height="20" style="padding-left:20px;">&nbsp;</td>
      </tr>
    </table>
      <table width="810" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="ny_main_rt_f fl" valign="top">
          <div class="about_zbody"><table width="760" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="360" ><div style=" min-height:400px; border-right:1px #9f6300 solid;">
    <a href="../<%=getbpic(img_sl,"d")%>" class="MagicZoom" rel="zoom-width: 233px; zoom-height: 300px; zoom-position: right;"><img src="../<%=getbpic(img_sl,"d")%>" width="350" height="350"/></a>
<img class="MagicZoomLoading" src="images/ajax-loader.gif" alt="Loading Zoom, please wait"/></div></td>
    <td width="400" valign="top"><div style="margin-left:25px; line-height:25px; margin-top:30px; width:375px; overflow:hidden;"><%=z_body_en%></div></td>
  </tr>
</table>
</div>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
<!--#include file="foot.asp" -->