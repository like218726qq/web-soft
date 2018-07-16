<!--#include file="conn.asp"-->
<%
	page=""
	fid=request("fid")
	lid=request("lid")
	if fid<>"" and lid <>"" then
		page="&fid="&fid&"&lid="&lid
	elseif fid <>"" then
		page="&fid="&fid
	end if
	
			  if fid<>"" then
				set rs=server.CreateObject("adodb.recordset")
				sql="select id_lm,title_lm from pro_lm where id_lm="&fid&" order by px desc,id_lm desc"
				rs.open sql,conn,1,1
				if not rs.eof then
				title_lm=rs("title_lm")
				end if
				rs.close
				set rs=nothing
				
				 elseif fid="" then
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
	  
	  
	  <!-- all main-->
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
              <%
			  	  
				   if lid<>"" and fid<>"" then
				set rs1=server.CreateObject("adodb.recordset")
				sql="select id_lm,title_lm from pro_lm where id_lm="&lid&" order by px desc,id_lm desc"
				rs1.open sql,conn,1,1
				if not rs1.eof then
				title_lm1=rs1("title_lm")
				end if
				rs1.close
				set rs1=nothing
				
				 elseif lid="" then
			  title_lm1=""
		      end if
			  %>
			  <tr><td height="30" style="background:url(images/pro_03.jpg) no-repeat; font-size:12px; padding-left:35px;" valign="middle" colspan="2">
		<div style="padding-top:5px;" class="Products">	  首页 >> 产品展示<%if fid<>"" and lid="" then response.Write(" >>"&title_lm) else if fid<>"" and lid<>"" then response.Write(" >>"&title_lm&" >>"&title_lm1) end if%></div>
			  </td></tr>
			    <tr><td  bgcolor="#FFFFFF" colspan="2" height="20"></td></tr>
              <tr><td width="10%" bgcolor="#FFFFFF" align="right" style="font-size:12px">
			  <%if fid<>"" and lid="" then response.Write(title_lm) else if fid<>"" and lid<>"" then response.Write(title_lm1) else if fid="" and lid="" then response.Write("产品展示") end if%></td><td width="90%" bgcolor="#FFFFFF" align="left"><img src="images/pro_07.jpg" /></td></tr>
			  
			  <!--main-->
			  <tr><td colspan="2" bgcolor="#FFFFFF" height="350" valign="top">
<table  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<%	
								
								set rs=server.CreateObject("adodb.recordset")
								if fid<>"" and lid<>"" and isnumeric(fid) then
									sql="select id,title,img_sl from pro_co where lm="&lid&" and pass='yes' and tuijian='yes' order by px desc,id desc"
								elseif fid<>"" then
									sql="select id,title,img_sl from pro_co where (lm="&fid&" or lm in(select id_lm from pro_lm where fid="&fid&")) and pass='yes' and tuijian='yes' order by px desc,id desc"
								else
									sql="select id,title,img_sl from pro_co where pass='yes' and tuijian='yes' order by px desc,id desc"
								end if
								rs.open sql,conn,1,1
								if not rs.eof then
									pagenum=12
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
			<td  align="left" style="padding-top:10px; padding-left:35px;">
									<table  border="0"  cellpadding="0" cellspacing="0" >
												<tr>
												  <td>
												  <table  border="0"   align="center" cellpadding="0" cellspacing="0" >
													<tr>
													  <td style="border:double 1px #CCCCCC" height="95" width="140"><a href="disproduct.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" border="0" /></a></td>
													</tr>
													<tr>
													  <td height="20"  align="center" style="font-size:12px;"><a href="disproduct.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
													</tr>
												  </table></td>
												</tr>
									</table>	
							</td>
							<%			if a mod 4=0 then response.write "</tr><tr>"
									a=a+1
									rs.movenext
									wend
								else
								%>
				<div style="text-align:center; margin-top:100px; margin-left:200px; width:200px; vertical-align:top; font-size:12px;">暂无产品信息！</div>
						<%		end if	
								rs.close
								set rs=nothing
						%>
						</tr>
						
						<tr><td style="text-align:center" colspan="4" >
						
					 </td></tr>
			</table>
				<br /><div style="font-size:12px;"><%if pagenum<>"" then call listpage(page) end if%></div>
</td></tr>
			  
			  
			  
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
