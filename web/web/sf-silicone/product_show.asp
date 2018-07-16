<!--#include file="conn.asp"-->
<%
	id=request("id")
	if id="" or not checknum(id) then
		call msg("Parameter error","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("The information does not exist or has been deleted","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		
		tlm=rs("lm")
		title=rs("title")
		wtime=rs("wtime")
		pro_guige=rs("pro_guige")
		read_num=rs("read_num")
		z_body=rs("z_body")
		
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from pro_lm where id_lm="&tlm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong(0)%></title>
<meta content="<%=zhong(1)%>" http-equiv="keywords" />
<meta content="<%=zhong(2)%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header-->
<!--#include file="header.asp"-->
<!--#banner-->

<!--middle-->
<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="9" valign="top"><img src="images/product1_10.jpg" width="9" height="47" /></td>
    <td width="248" align="right" valign="top" bgcolor="#FFFFFF"><table width="248" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="47" align="center" class="nei_fenl">Product List</td>
      </tr>
    </table>
      <table width="242" border="0" cellpadding="0" cellspacing="0" background="images/product1_fenl_beij.jpg">
        <tr>
          <td valign="top" style="padding-top:12px;">
          <!--product menu-->
          <!--#include file="left_pro.asp"-->
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="35">&nbsp;</td>
              </tr>
            </table>
            <!--contact-->
            <!--#include file="left_cont.asp"-->
            </td>
        </tr>
      </table></td>
    <td width="18" height="100" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="733" valign="top" bgcolor="#FFFFFF"><table width="733" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="38" class="zhans"><A href="product.asp">Product</A></td>
      </tr>
    </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>

          <td><img src="images/product1_shang.jpg" width="733" height="4" /></td>
        </tr>
        <tr>
          <td background="images/product1_zhong.jpg" style="padding:10px 20px 10px 20px; height:615px; color:#666666" valign="top">
          <div style=" line-height:180%;height:auto !important; height:610px;min-height:610px; ">
           <Div style=" line-height:180%; text-align:left; border-bottom:#CCCCCC  dotted 1px; padding-left:10px; font-weight:bold; font-size:14px">Product Name：<span style="color:#666666"><%=title%></span></Div>
	       <%
    if img_sl<>"" then
    %>
    <div style="text-align:center; width:100%;">
       <img src="<%=getbpic(img_sl,"d")%>" onload="if (this.width>690){this.height=690*this.height/this.width;this.width=690;}" alt="<%=pro_guige%>"/>
        </div> 
    <%
    end if
    %>
    <Div style=" line-height:180%; text-align:left; border-bottom:#CCCCCC  dotted 1px; padding-left:10px; font-weight:bold; font-size:14px">Product introduction</Div>
    <Div style=" line-height:180%; text-align:left; padding:10px; height:auto !important; height:210px; min-height:210px;">
	<%
	   if z_body="" then
	      response.Write("<span style='text-align:center; padding-top:20px;'>Information is update...</span>")
	   else
	   response.Write(z_body)
	   end if
	%></Div>
    <div class="back" style="text-align:right; height:30px; padding-top:10px"><a href="javascript:history.back();">[back]</a></div>
</div>          </td>
        </tr>
        <tr>
          <td><img src="images/product1_xia.jpg" width="733" height="5" /></td>
        </tr>
    </table></td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10">&nbsp;</td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--footer-->
<!--#include file="footer.asp"-->
</body>
</html>
