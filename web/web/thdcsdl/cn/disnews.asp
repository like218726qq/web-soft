<!--#include file="conn.asp"-->
<%
	page=""
	fid=request("fid")
	lid=request("lid")
	id=request("id")
	if fid<>"" and lid <>"" then
		page="&fid="&fid&"&lid="&lid
	elseif fid <>"" then
		page="&fid="&fid
	end if
	dlm=request.QueryString("dlm")
	
	                if dlm<>"" then
	                  set rs1=server.CreateObject("adodb.recordset")
						
						sql="select title_lm from info_lm where id_lm="&dlm&" order by px desc,id_lm desc"
						
						rs1.open sql,conn,1,1
						if not rs1.eof then
						title_lm=rs1("title_lm")
						end if
						rs1.close
						set rs1=nothing
					else
					    title_lm=""
					end if

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
              <!--#include file="n_left.asp"-->
			</td>
			
            <td width="10">&nbsp;</td>
			
			<!--right-->
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              
			  <tr><td height="30" style="background:url(images/pro_03.jpg) no-repeat; font-size:12px; padding-left:35px;" valign="middle" colspan="2">
		<div style="padding-top:5px;" class="Products">	  首页 >> <%=title_lm%></div>
			  </td></tr>
			  
			  <!--main-->
			 <tr>
		<td colspan="2"  valign="top" bgcolor="#ffffff" height="380"  style="padding-top:10px; padding-left:10px; line-height:24px; font-size:12px;">
			
<%
	id=request("id")
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select * from info_co where pass='yes' and id="&id&" order by px desc,id desc",conn,1,2
	  rs("read_num")=rs("read_num")+1
	  rs.update()
%> 
<table width="98%" align="center" >
    <tr>
        <td style="line-height:180%; padding:10px 0 5px 0;" align="center" valign="bottom"><span style="font-size:14px;color:#000000"><%=rs("title")%></span></td>
    </tr>
    <tr>
        <td height="20" align="center" bgcolor="#ffffff" style="border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #C7C7C7;font-size:12px;color:#000000">发布日期:<%=FormatDateTime(rs("wtime"),2)%> &nbsp;  | &nbsp; 阅读:<%=rs("read_num")%></td>
    </tr>
    <tr>
      <td><table width="98%" align="center">
        <tr>
          <td style="font-size:12px; padding-top:3px; line-height:24px;color:#000000"><%=rs("z_body")%></td>
        </tr>
      </table></td>
    </tr>
    <tr><td height="10px"></td></tr>
    <tr>
        <td height="30" align="right" style="padding-right:20px; font-size:12px;"><a style="text-decoration:none; color:#000000;" href="javascript:history.go(-1)">[返回]</a></td>
    </tr>
</table>
<%
	rs.close
	set rs=nothing
%>
		</td>
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
<!--<table width="1110"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td height="100" style="background:url(images/bj_03.jpg)"></td></tr>
</table>-->
</body>
</html>
