<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="../html.conn.asp"-->
<!--#include file="../html.title.asp"-->
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<!--#include file="../index.top.asp"-->
<!--#include file="../index.menu.asp"-->
<!--#include file="../index.slide_sub.asp"-->  
   <div class="listcon" style="height:auto;">
        <h4>您现在的位置：<a href="index.asp">首页 </a>> <a href="products.asp">产品中心</a> > <%=pro_lm_title(request.QueryString("fid"))%> > <% if request.QueryString("fid")<>"" then response.Write pro_lm_title(request.QueryString("fid2")) end if%> </h4>
        <br/>
        <table style="width:98%; margin:0 auto">
        	<tr>
            	<td width=200 valign="top">
                <h4 style="width:200px; overflow:hidden; font-weight:bold;">产品分类</h4>
                <div class="Lcontent" style="width:200px;  height:auto;">
                	<ul style="width:200px; ">
                        <%
						set rs = server.createobject("adodb.recordset")
						  sql="select  * from pro_lm where fid=0 order by px desc,id_lm desc "
						  rs.open sql,conn,1,1
						  if not  rs.eof then
							while not rs.eof
								%>
                                <li style="height:auto; background-position:3px 11px; width:200px;"><a href="pro.asp?fid=<%=rs("id_lm")%>"><%=rs("title_lm")%></a><br/>
                                	<dl style="padding:0; margin:0;">
                                    	<%
										set rsa= server.createobject("adodb.recordset")
										sqla="select  * from pro_lm where fid="&rs("id_lm")&" order by px desc,id_lm desc "
										  rsa.open sqla,conn,1,1
										  if not  rsa.eof then
											while not rsa.eof
												%>
											<dd>◆<a href="pro.asp?fid=<%=rsa("fid")%>&fid2=<%=rsa("id_lm")%>"><%=rsa("title_lm")%></a>
												</dd>
												<%
											rsa.movenext
											wend
										  end if
										  rsa.close
										  set rsa=nothing
										%>
                                    </dl>
                                </li>
                                <%
							rs.movenext
							wend
						  end if
						  rs.close
						  set rs=nothing
						%>
                        <div class="clear"></div>
                        </ul>
                </div>
                </td>
                <td valign="top">
                <!--#include file="../html.products.asp"-->
                <!--#include file="../html.page_num.asp"-->
                </td>
            </tr>
        </table>
   </div>
<!--#include file="../index.end.asp"-->
</body>
</html>
