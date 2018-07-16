<!--#include file="conn.asp"-->
<%
	page=""
	fid=request("fid")
	lm=request("id_lm")
	lid=request("lid")
	if fid<>"" and lid <>"" then
		page="&fid="&fid&"&lid="&lid
	elseif fid <>"" then
		page="&fid="&fid
	end if
	did=request.QueryString("did")
	
	                if fid<>"" then
	                  set rs1=server.CreateObject("adodb.recordset")
						
						sql="select id, title from info_co where lm="&fid&" order by px desc,id desc"
						
						rs1.open sql,conn,1,1
						if not rs1.eof then
						title_lm=rs1("title")
						id_lm=rs1("id")
						end if
						rs1.close
						set rs1=nothing
					else
					    title_lm="政策法规"
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
	
	<tr><td align="center" valign="top">
	<!--#include file="top1.asp"-->
	  </td></tr>
	  
	  
	  <!--main-->
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
		  <!--left-->
            <td width="207" valign="top">
              <!--#include file="fg_left.asp"-->
			</td>
			
            <td width="10">&nbsp;</td>
			
			<!--right-->
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              
			  <tr><td height="30" style="background:url(images/pro_03.jpg) no-repeat; font-size:12px; padding-left:35px;" valign="middle" colspan="2">
		<div style="padding-top:5px;" class="Products">	  首页 >> 政策法规</div>
			  </td></tr>
             
          <!--    <tr><td width="10%" bgcolor="#FFFFFF">fgdfgdg</td><td width="90%" bgcolor="#FFFFFF" align="left"><img src="images/pro_07.jpg" /></td></tr>
			  -->
			  <!--main-->
			 <tr>
		<td valign="top" colspan="2" width="717" bgcolor="#FFFFFF" height="340">
	<table width="100%" border="0"  cellpadding="0" cellspacing="0">
		
		<tr>
			<td width="717" valign="top" style="font-size:12px;">
			<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
             <tr>
                <td valign="top" colspan="3" height="10">
				</td></tr>
					  <%
					
					
					   set rs=server.CreateObject("adodb.recordset")
					   if LM<>"" then
						sql="select * from info_co where lm="&lm&" and pass='yes' order by px desc,id desc"
						else
						sql="select * from info_co where lm in(33,34,36) and pass='yes' order by px desc,id desc"
						end if						
						
									rs.open sql,conn,1,1
									if not rs.eof then
										pagenum=10
										rs.pagesize=pagenum
										counter=rs.recordcount
										pagezong=rs.pagecount
										pageno=trim(request.querystring("page"))
										if pageno="" or not isnumeric(pageno) then 
											pageno=1
										end if
										if pageno<1 then
											pageno=1
										end if
										if pageno-pagezong>0 then 
											pageno=pagezong
										end if
										rs.absolutepage=pageno
										a=1
										while not rs.eof and a<=pagenum
								%>
													 
									 <tr>				
										<td style="border-bottom:dotted 1px #ccc; padding-left:5px;" valign="middle" width="20" >
										<img src="images/pro_07.jpg"  width="10" height="14"/></td>
										
										<td width="537" align="left" style="border-bottom:dotted 1px #ccc" valign="middle">
										<a style="text-decoration:none; color:#000000" href="zcfg_view.asp?id=<%=rs("id")%>&did=<%=id_lm%>&dlm=<%=rs("lm")%>" ><font style="color:<%=rs("color_font")%>;"><%=rs("title")%></font></a>
									   </td>
										<td width="139" style="border-bottom:dotted 1px #ccc;font-family:Arial, Helvetica, sans-serif;" height="30" align="center">[<%=year(rs("wtime"))&"-"&right("0"&month(rs("wtime")),2)&"-"&right("0"&day(rs("wtime")),2)%>]</td>
									</tr>
									<tr>
										<td valign="top" colspan="3"><div class="fgx"></div></td>
									</tr>
								<%      a=a+1
										rs.movenext
										wend
									end if
									rs.close
									set rs=nothing
								%> 
							</table>
			</td>
		</tr>

	
	</table>
	<br /><div style="font-size:12px;"><%if pagenum<>"" then call listpage(page) end if%></div>
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
</body>
</html>
