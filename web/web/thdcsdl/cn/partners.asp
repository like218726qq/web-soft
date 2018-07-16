<!--#include file="conn.asp"-->
              <%		
				 id=request.QueryString("id")
				 if id="" then id=24
				  set rs=server.CreateObject("adodb.recordset")
				  rs.open "select * from tol_co where ID="&id,conn,1,1
				  if not rs.eof then
				  title=rs("title")					 
				  z_body=rs("z_body")
				  end if
				  rs.close
				  set rs=nothing
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
	
	<tr><td align="center" valign="top"><!--#include file="top1.asp"--></td>
	</tr>
	  
	  
	  <!--main-->
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
		  <!--left-->
            <td width="207" valign="top">
              <!--#include file="part_left.asp"-->			</td>
			
            <td width="10">&nbsp;</td>
			
			<!--right-->
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              
			   <tr><td height="30" style="background:url(images/pro_03.jpg) no-repeat; font-size:12px; padding-left:35px;" valign="middle" colspan="2">
		<div style="padding-top:5px;" class="Products">	  首页 >> <%=title%></div>
			  </td></tr>
			  
			  <!--main-->
			  <tr>
                <td height="380" valign="top" colspan="2" bgcolor="#FFFFFF" style="padding-left:10px; padding-top:10px; line-height:24px; font-size:12px;">	
				<%=z_body%>
				</td>
              </tr>
			  
              <tr>
                <td height="30" colspan="2"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
	  
        <td height="80" class="boby">
		<!--#include file="bottom.asp"-->      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
