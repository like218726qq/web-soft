<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/quicknav.css" />
<script type="text/javascript" src="c/common.js?v=2012081522"></script>
<style type="text/css">
<!--
.STYLE1 {
	color: #a49a9a;
	font-size: 14px;
}
#focus{width:1002px;height:302px;text-align:left;}
#focus div{position:absolute;width:1002px;height:302px;overflow:hidden;}
#focus img{width:1002px;height:302px;}
#focus #focus_img{display:none;}
#focus_show{ float:left; margin-right:0px;}
.STYLE8 {
	color: #27B5A6;
	font-weight: bold;
	font-size:16px;
	font-style: italic;
}
-->
</style>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><Td align="center">
<!--#include file="top.asp"-->
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div id="focus">
    <div id="focus_bg"></div>
    <div id="focus_show"></div>
    <div id="focus_img">
<div name="focus_img" id="focus_1">images/ny-01_09.jpg|product_show.asp?id=5&lm=1|I600</div>

<div name="focus_img" id="focus_2">images/ny-02_09.jpg|product_show.asp?id=10&lm=1|I580</div>

<div name="focus_img" id="focus_3">images/ny-03_09.jpg|product_show.asp?id=7&lm=1|I500</div>

<div name="focus_img" id="focus_4">images/ny-04_09.jpg|product_show.asp?id=5&lm=1|I600</div>

    </div>
    <script type="text/javascript" src="js/focus.js"></script>
  </div></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1002" height="878"><table width="1002" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46" style=" background:url(images/neiye-k_11.jpg) left no-repeat "><table width="1002" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="186" align="right"><img src="images/neiye-tj_12.jpg" width="174" height="43" /></td>
            <td width="816" align="right" style="padding-right:30px;"><a href="product.asp"><img src="images/neiye-ck_38.jpg" /></a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="811"  style=" background:url(images/neiye_36.jpg) left repeat-y; "><table width="1002" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="295"><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
              <%
sql="select top 5 id,title,img_sl,lm from pro_co where pass='yes' and tuijian='yes' order by px desc,id desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof 
	   %>
                <td width="90">&nbsp;</td>
                <td width="88"><a href="product_show.asp?id=<%=rs("id")%>&lm=<%=rs("lm")%>"><img src="<%=rs("img_sl")%>" width="90" height="176" /></a></td>
                <%
			  rs.movenext     
	  loop
	end if
	rs.close
	set rs=nothing%> 
    <td>&nbsp;</td>
              </tr>
              <tr>
                            <%
sql="select top 5 id,title,img_sl from pro_co where pass='yes' and tuijian='yes' order by px desc,id desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof 
	   %>
                <td>&nbsp;</td>
                <td width="88" height="30" align="center" valign="middle" > <a class="pr_ti" href="product_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
                <%
			  rs.movenext     
	  loop
	end if
	rs.close
	set rs=nothing%> 
    <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="1"><img src="images/neiye-zx_33.jpg" width="1002" height="1" /></td>
          </tr>
          <tr>
            <td height="48"><table width="1002" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><table width="970" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left" style="padding-right:30px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="35" align="left" valign="middle"><span class="STYLE8"><img src="images/c.jpg" width="87" height="25" /></span></td>
                        </tr>
                    </table></td>
                      </tr>
                </table></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="360" align="center" valign="top"><table width="970" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                <%
sql="select top 4 id,title,img_sl,f_body from info_co where pass='yes' and lm=12 order by px desc,id desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof 
	   %>
                <table width="470" border="0" cellspacing="0" cellpadding="0" style="margin-right:10px; float:left">
                  <tr>
                    <td width="160" height="120" rowspan="2" align="center" valign="middle"><img src="<%=rs("img_sl")%>" width="150" height="100" /></td>
                    <td height="30" align="left"><strong style="font-size:14px;"><%=rs("title")%></strong></td>
                  </tr>
                  <tr>
                    <td height="90" align="left" valign="top" style="line-height:25px; height:90px; overflow:hidden"><%=rs("f_body")%></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="right"><a href="che.asp?id=<%=rs("id")%>"><img src="images/on.jpg" /></a></td>
                    </tr>
                </table>
<%rs.movenext     
loop
	end if
	rs.close
	set rs=nothing%>
                </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="106"><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="28">&nbsp;</td>
                <td width="224"><a href="down.asp"><img src="images/neiye_43.jpg" width="224" height="100" /></a></td>
                <td width="16">&nbsp;</td>
                <td width="224"><a href="service.asp?id=9"><img src="images/neiye_45.jpg" width="224" height="100" /></a></td>
                <td width="16">&nbsp;</td>
                <td width="224"><a href="service.asp?id=7"><img src="images/neiye_47.jpg" width="224" height="100" /></a></td>
                <td width="16">&nbsp;</td>
                <td width="224"><a href="message.asp"><img src="images/neiye_49.jpg" width="224" height="100" /></a></td>
                <td width="28">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="21"><img src="images/neiye_55.jpg" width="1002" height="21" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"><img src="images/lp_17.jpg" width="1002" height="1" /></td>
  </tr>
</table><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</Td></tr></table>
</body>
</html>
