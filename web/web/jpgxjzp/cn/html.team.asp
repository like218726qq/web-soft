<table width=98% border=0 cellpadding=0 cellspacing=0 class=new>
<tr>     
			
 <%
 		lm=request.QueryString("ntype")
		set rs=server.CreateObject("adodb.recordset")
		if lm<>"" and isnumeric(lm) then
		  sql="select * from info_co where pass='yes' and lm="&lm&" order by px desc,id desc"
		else
		  sql="select * from info_co where pass='yes' and (lm in(select id_lm from info_lm where fid=23 ) or lm=23) order by px desc,id desc"
		end if
		rs.open sql,conn,1,1
		if not rs.eof then
			pagenum=9
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
			img_sl=rs("img_sl")
			if img_sl="" then img_sl="js/images/team.jpg" end if
			dow_sl=rs("dow_sl")
	%>
    <style>
	.title{height:30px; line-height:30px; font-size:14px; font-weight:bold;}
	.img{ border:1px solid #dcdcdc; width:200px; height:160px; text-align:center; vertical-align:middle; overflow:hidden;}
	.img a{ display:block; width:200px; height:160px; text-align:center;}
	.img img{ vertical-align:middle; text-align:center; border:none;}
	.more{height:30px; line-height:30px;}
	.red{ color:red;}
	</style>

            <td width="29%" align=center style="border:#cccccc 1px solid;">
            	<table>
                    <tr>
                    <td align="center"><div class="title"><a href=team_show.asp?id=<%=rs("id")%>  class=fontweight><%=rs("title")%></a></div></td>
                    </tr>
                    <tr>
                    <td align="center"><div class="img"><a href=team_show.asp?id=<%=rs("id")%>><img  src="<%=img_sl%>" onload="img_load(this,200,160)" onerror="img_error(this,'js/images/team.jpg')"/></a></div></td>
                    </tr>
                    <tr>
                    <td align="center"><div class="more"><a href=team_show.asp?id=<%=rs("id")%> ><span class="red">详细信息</span></a></div></td>
                    </tr>
                </table>
            </td>
            
	<%	
			if a mod 3=0 then
			%>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            <% 
			else
			%>
            <td>&nbsp;</td>
            <%
			end if
            a=a+1
            rs.movenext
			wend
		else	
	%>
    <td colspan="4">没有相关产品</td>
	<%
		end if	
		rs.close
		set rs=nothing
 %>       
		
</tr>       
</table>

<table width="98%" height="27" border="0" cellpadding="1" cellspacing="0">
  <tr>
    <td height="27" align="center" valign="bottom">
		<P align=center>
		<%
        if pagenum<>"" then 
        if ntype<>"" then pra="ntype="&lm
            call listpage_num(pra)
        end if
        %>
        </P>
    </td>
  </tr>
</table>