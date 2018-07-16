<!--#include file="conn.asp"-->
<%
	id=request.QueryString("id")
	if id<>"" and not isnumeric(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	if id="" or not isnumeric(id) then
		sql="select * from info_co where lm=42 order by px desc,id desc"
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
						<td valign="top" height="450"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr><td>&nbsp;</td></tr>
							<tr>
								<td>
                                	<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<%
                                       set rs=server.CreateObject("adodb.recordset")
                                       if id<>"" then
                                        sql="select * from info_co where lm="&id&" and pass='yes' order by px desc,id desc"
                                        else
                                        sql="select * from info_co where  lm=42 and pass='yes' order by px desc,id desc"
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
                                    	<tr><td height="30" colspan="2" style="border-bottom:1px #CCCCCC solid; color:#9C3; font-size:15px; font-weight:bold;"><%=rs("title")%></td></tr>
                                        <tr>
                                        <td width="130" height="100"  ><a href="product.asp?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" border="0" /></a></td>
                                      <td align="left" style=" font-size:13px; color:#666;"><%=(left(trim(rs("f_body")),100))%>...<br /><span style="text-align:right; padding-left:530px;"><a href="product.asp?id=<%=rs("id")%>" style="color:#FF0000;">更多</a></span></td></tr>
										<%   
                                            a=a+1
                                            rs.movenext
                                            wend 
                                            else
                                        %>
                                        <div style="text-align:center; margin-top:50px; margin-left:200px; width:200px; vertical-align:top; font-size:12px;">暂无信息！</div>
                                        <%		
                                            end if
                                            rs.close
                                            set rs=nothing
                                        %>
                                         <div style="font-size:12px; text-align:center;"><%if pagenum<>"" then call listpage("&lm="&lm&"") end if%></div>
                                    </table>
                              </td>
							</tr>
						</table></td>
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
