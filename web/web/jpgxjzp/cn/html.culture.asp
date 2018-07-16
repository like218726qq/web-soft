<table width=95% border=0 cellpadding=0 cellspacing=0 class=new style="margin:20px auto;">
<tr>     
<style>
.title{ border-bottom:1px dotted #dcdcdc; width:100%; height:28px; line-height:28px; background:url(js/images/dot.jpg) no-repeat 0px 10px; text-indent:10px;}
.time{ border-bottom:1px dotted #dcdcdc; width:100%; height:28px; line-height:28px;}
</style>			
 <%
 		lm=request.QueryString("fid")
		set rs=server.CreateObject("adodb.recordset")
		if lm<>"" and isnumeric(lm) then
		  sql="select * from info_co where pass='yes' and lm="&lm&" order by px desc,id desc"
		else
		  sql="select * from info_co where pass='yes' and (lm in(select id_lm from info_lm where fid=45 ) or lm=45) order by px desc,id desc"
		end if
		'response.Write sql
		rs.open sql,conn,1,1
		if not rs.eof then
			pagenum=20
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
			if img_sl="" then img_sl="images/news.bmp" end if
			dow_sl=rs("dow_sl")
			wtime=formatdate(rs("wtime"))
	%>

<tr>
	<td style=" background:url(../js/images/dot.jpg) no-repeat 0px 11px; height:28px; line-height:28px; text-indent:2em; overflow:hidden;">
    <div class="title">
    <a href=culture_show.asp?id=<%=rs("id")%> ><%=rs("title")%>
    </a>
    </div></td>
    <td align="right">
    <a href=culture_show.asp?id=<%=rs("id")%>>
    <div class="time">[<%=wtime%>]</div></a>
    </td>
</tr>            
	<%	
			if a mod 2=0 then
			%>
            
            <% 
			else
			%>
            
            <%
			end if
            a=a+1
            rs.movenext
			wend
		else	
	%>
    <td colspan="4" style="height:25px; line-height:25px; text-indent:2em;">没有相关信息</td>
	<%
		end if	
		rs.close
		set rs=nothing
 %>       
		
</tr>       
</table>
