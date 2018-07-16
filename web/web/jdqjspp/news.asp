<!--#include file="top.asp"-->
    <div class="listcon">
        <!--#include file="left.asp"-->
    	 <div style="float:right; width:770px;">
            <div class="R1">
            	<h4>新闻中心</h4>
            	<table cellpadding="0" cellspacing="0" border="0" width="100%" style="font-size:13px;">
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,wtime from info_co where pass='yes' and lm=1 order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=15
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
		pageno=clng(pageno)
		rs.absolutepage=pageno
		a=1
		while not rs.eof and a<=pagenum
%>
	<tr>
    <td style="border-bottom:1px dotted #CCCCCC;"><img src="images/news_11.jpg" height="12" width="20"/></td>
		<td id=news_a align="left" height="25" width="85%" style="border-bottom:1px dotted #CCCCCC; padding-left:10px;">
			
			<a href="news_show.asp?id=<%=rs("id")%>"><font style="color:#000000" >
			<%
				title=rs("title")
				if len(title)>22 then title=left(title,20)&"..."
			%>
			<%=title%>
			</font></a>
		</td>
		<td align="right" width="15%" style="border-bottom:1px dotted #CCCCCC;">[<%=formatdate(rs("wtime"))%>]</td>
	</tr>                
<%
		a=a+1
		rs.movenext
		wend
	end if
	rs.close
	set rs=nothing
%>
	<tr><td colspan="3" height="35" valign="middle"><%if pagenum<>"" then call listpage("") end if%></td></tr>
</table>
           </div>     
         </div>
    </div>
	<div class="clear"></div>
	<!--#include file="bottom.asp"-->
</body>
</html>
