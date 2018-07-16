<table width=98% border=0 cellpadding=0 cellspacing=0 class=new>
<tr>     
			
 <%
 		lm=request.QueryString("fid")
		set rs=server.CreateObject("adodb.recordset")
		sq=""
		pra=""
		if lm<>"" and isnumeric(lm) then
		sq=" and lm="&lm&" or lm in(select id_lm from info_lm where fid="&lm&" )"
		pra="&fid="&lm
		else 
		sq=" and lm=45"
		end if
		sql="select * from info_co where pass='yes' "&sq&" order by px desc,id desc"
		'response.Write sql
		'response.End()
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
			img_sl=rs("img_sl")
			if img_sl="" then img_sl="../js/images/video.png" end if
			dow_sl=rs("dow_sl")
	%>
    <style>
	.title2{height:30px; line-height:30px; font-size:14px; font-weight:bold;}
	.img{ border:1px solid #dcdcdc; width:300px; height:200px; text-align:center; vertical-align:middle; overflow:hidden;}
	.img a{ display:block; width:300px; height:200px; text-align:center;}
	.img img{ vertical-align:middle; text-align:center; border:none;}
	.more{height:30px; line-height:30px;}
	.red{ color:red;}
.min_width{min-width:300px;_width:expression(document.body.clientWidth < 300 ? "300px" : "auto");}
.max_width{max-width:300px;_width:expression(document.body.clientWidth > 300 ? "300px" : "auto");}
.min_height{min-height:200px;_height:expression(this.scrollHeight < 200 ? "200px" : "auto");}
.max_height{max-height:200px;_height:expression(this.scrollHeight > 200 ? "200px" : "auto");}
	</style>

            <td width="49%" align=center>
            	<table>
                    <tr>
                    <td align="center"><div class="img"><a href=video_show.asp?id=<%=rs("id")%>><img  src="<%=img_sl%>" onerror="img_error(this,'js/images/vidoe.png')" class="max_width max_height"/></a></div></td>
                    </tr>
                    <tr>
                    <td align="center"><div class="title2"><a href=video_show.asp?id=<%=rs("id")%>  class=fontweight><%=rs("title")%></a></div></td>
                    </tr>
                </table>
            </td>
            
	<%	
			if a mod 2=0 then
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
    <td colspan="4">没有相关信息</td>
	<%
		end if	
		rs.close
		set rs=nothing
 %>       
		
</tr>       
</table>