<table width=750 border=0 cellpadding=0 cellspacing=0 class=new>
<tr>     
			
 <%
 		lm=request.QueryString("fid")
		set rs=server.CreateObject("adodb.recordset")
		if lm<>"" and isnumeric(lm) then
		  sql="select * from info_co where pass='yes' and lm="&lm&" order by px desc,id desc"
		else
		  sql="select * from info_co where pass='yes' and (lm in(select id_lm from info_lm where fid=51 ) or lm=51) order by px desc,id desc"
		end if
		rs.open sql,conn,1,1
		if not rs.eof then
			pagenum=6
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
			if img_sl="" then img_sl="images/case.bmp" end if
			dow_sl=rs("dow_sl")
	%>

            <td width="49%" align=center style="border:#cccccc 1px solid;">
                <table>
                    <tr><td><a href=case_show.asp?id=<%=rs("id")%>><%=rs("title")%></a></td></tr>
                    <tr><td>
                        <a href=case_show.asp?id=<%=rs("id")%>>
                        <img  src="../<%=img_sl%>" align=center  border=0 />
                        </a>
                    </td></tr>
                    <tr><td><a href=case_show.asp?id=<%=rs("id")%> >详细信息</a></td></tr>
                </table>
            </td>
            
	<%	
			if a mod 2=0 then
			%>
            </tr>
            <tr><td height=30>&nbsp;</td></tr>
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
