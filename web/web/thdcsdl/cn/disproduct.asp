<!--#include file="conn.asp"-->
<%
	id=request("id")
	if id="" or not isnumeric(id) then
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
		
		fid=rs("lm")
		title=rs("title")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from pro_lm where id_lm="&fid&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		title_lm=rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing
nav=7
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>深圳市泰恒达财税代理有限公司</title>
<style type="text/css">
<!--
body {
	background: url(images/bg_.jpg) repeat-x bottom;
	background-color:#F4F4F4;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/syle.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	
	<tr><td align="center" valign="top">
	<!--#include file="top1.asp"-->
	  </td></tr>
	  
	  
	  <!--main-->
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
		  <!--left-->
            <td width="207" valign="top">
              <!--#include file="left.asp"-->
			</td>
			
            <td width="10">&nbsp;</td>
			
			<!--right-->
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              
			 <tr><td height="30" style="background:url(images/pro_03.jpg) no-repeat; font-size:12px; padding-left:35px;" valign="middle" colspan="2">
		<div style="padding-top:5px;" class="Products">	  首页 >> 产品展示<%if fid<>"" and lid="" then response.Write(" >>"&title_lm) else if fid<>"" and lid<>"" then response.Write(" >>"&title_lm&" >>"&title_lm1) end if%></div>
			  </td></tr>
			  <tr><td  bgcolor="#FFFFFF" colspan="2" height="20"></td></tr>
              <tr><td width="10%" bgcolor="#FFFFFF" style="font-size:12px;" align="right"><%=title_lm%></td><td width="90%" bgcolor="#FFFFFF" align="left"><img src="images/pro_07.jpg" /></td></tr>
			  
			  <!--main-->
			  <tr><td colspan="2" align="center" bgcolor="#FFFFFF" height="400">
			<%
								if img_sl<>"" then
								img_sl=mid(img_sl,1,instrrev(img_sl,"/"))&"d"&mid(img_sl,instrrev(img_sl,"/")+1)
								%>
								<div style=" line-height:30px; width:630px; text-align:center; font-size:12px;font-weight: bold">名称：<%=title%>&nbsp;&nbsp;</div>
                                <div style="text-align:center; width:630px;;">
                                <img src="../<%=img_sl%>" onload="if (this.width>600){this.height=600*this.height/this.width;this.width=600;}" />
                                </div>
                                
								<%
								end if
								%>
								 <div style="text-align:left; width:630px; padding-left:10px; font-size:12px; line-height:24px;">
								 产品详细介绍： <%=z_body%>                               
                                </div>
                               
                    <div style="text-align:right; width:630px;"><a style=" font-size:12px" href="javascript:history.back();">[返回]</a></div></td></tr>
			  
			  
			  
              <tr>
                <td height="30" colspan="2"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
	  
        <td height="80" class="boby">
		<!--#include file="bottom.asp"-->
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
