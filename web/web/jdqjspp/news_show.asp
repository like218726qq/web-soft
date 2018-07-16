<!--#include file="top.asp"-->

<%
	id=request("id")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		if rs("link_url")<>"" then
			response.Redirect rs("link_url"):response.End()
		end if
		lm=rs("lm")
		title=rs("title")
		color_font=rs("color_font")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from info_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" &gt; "&rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing

%>
    <div class="listcon">
        <!--#include file="left.asp"-->
    	 <div style="float:right; width:770px;">
            <div class="R1">
            	<h4>新闻中心</h4>
            	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:12px;">
                      <tr>
                        <td valign="top" class="tc">
                        <div style="padding:0px 5px 2px 5px;">
                            <div style="text-align:center;font-weight:bold; font-size:14px; padding:5px 0 5px 0px;"><font style="color:<%=color_font%>;"><%=title%></font></div>
                            <div style="text-align:right; line-height:22px; color:#999; padding-bottom:5px;">时间：<%=wtime%></div>
                            <div style="line-height:180%;"><%=z_body%></div>
                            <div style="text-align:right;"><a href="javascript:history.back();">[返回]</a></div>
                        </div>
                        </td>
                      </tr>
                    </table>
                 </div>     
         </div>
    </div>
	<div class="clear"></div>
	<!--#include file="bottom.asp"-->
</body>
</html>
