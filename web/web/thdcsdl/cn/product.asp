<!--#include file="conn.asp"-->
<%
	id=request.QueryString("id")
	if id<>"" and not isnumeric(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	if id="" or not isnumeric(id) then
		sql="select * from info_co where lm=1 order by px desc,id desc"
	else
		sql="select * from info_co where id="&id&""
	end if
	rs.open sql,conn,1,1
	if not rs.eof then
		title=rs("title")
		z_body=rs("z_body")
		wtime=rs("wtime")
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
	background-image: url(images/bg_.jpg);
	height:996px;
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
        <tr>
          <td align="center" valign="top"><!--#include file="top1.asp"-->
          </td>
        </tr>
        <!--main-->
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <!--left-->
                <td width="207" valign="top" ><!--#include file="left.asp"-->
                </td>
                <td width="10">&nbsp;</td>
                <!--right-->
                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="background:url(images/pro_03.jpg) no-repeat; font-size:12px; padding-left:35px;" valign="middle" colspan="2"><div style="padding-top:5px;" class="Products"> 首页 >> 服务项目</div></td>
                    </tr>
                    <!--    <tr><td width="10%" bgcolor="#FFFFFF">fgdfgdg</td><td width="90%" bgcolor="#FFFFFF" align="left"><img src="images/pro_07.jpg" /></td></tr>
			  -->
                    <!--main-->
                    <tr>
                      <td valign="top" colspan="2" width="717" bgcolor="#FFFFFF" height="340"><table width="100%" border="0"  cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="717" valign="top" style="font-size:12px;">
                            
                            
                            
                            <table width="728" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="48" valign="top" background="images/bj_7.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="25" height="30" align="right"><img src="images/pro_07.jpg" width="12" height="12" /></td>
								<td style="font-size:14px; color:#9C3; font-weight:bold; padding-top:2px; padding-left:6px;"><%=title%></td>							
                            </tr>
						</table></td>
					</tr>
                    
					<tr>
                    
						<td valign="top" height="350"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr><td style=" font-size:25px; color:#555; font-weight:bold; text-align:center"><%=title%></td></tr>
                        <tr><td style=" font-size:15px; color:#999; text-align:center"><%=wtime%></td></tr>
                        <tr><td>&nbsp;</td></tr>
							<tr>
								<td><%=z_body%>	</td>
							</tr>
						</table></td>
					</tr>
				</table>
                            
                            
                            
                            
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="20" colspan="2"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="80" style="padding-top:50px;">
		  <!--#include file="bottom.asp"-->
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
