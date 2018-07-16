<%
wordkey=request("keyword")
if wordkey<>"" then
   likes=" and title like '%"&wordkey&"%'"
end if
%>
<table width=98% border=0 cellpadding=5 cellspacing=0 class=new>
<tr><td>产品列表</td></tr>
<tr>     
<style>
	.title{height:30px; line-height:30px; font-size:14px; font-weight:bold;}
	.img{ border:1px solid #dcdcdc; width:200px; height:160px; text-align:center; vertical-align:middle; overflow:hidden;}
	.img a{ display:block; width:200px; height:160px; text-align:center;}
	.img img{ vertical-align:middle; text-align:center; border:none;}
	.more{height:30px; line-height:30px;}
	.red{ color:red;}
	.f_body{  line-height:25px;overflow:hidden; text-align:center; text-indent:2em;}
	.max_height{
max-height:100px;
/* sets max-height for IE */
_height:expression(this.scrollHeight > 100 ? "100px" : "auto");
}
	</style>			
 <%
 		lm=request.QueryString("fid")
		set rs=server.CreateObject("adodb.recordset")
		if lm<>"" and isnumeric(lm) then
		  sql="select * from pro_co where pass='yes' and lm="&lm&" "&likes&" order by px desc,id desc"
		else
		  sql="select * from pro_co where pass='yes' "&likes&" order by px desc,id desc"
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
			if img_sl="" then img_sl="js/images/products.jpg" end if
			'lm=rs("lm")
			'lm_title=pro_lm_title(lm)
			'id=rs("id")
			'title=rs("title")
			'response.Write lm_title
			
	%>
    

            <td width="29%" align=center style="border:#cccccc 1px solid;">
                <table width="100%">
                <tr><td width="100">产品名称</td><td>产品简介</td><td width="100">查看详情</td></tr>
                <tr>
                
                 <td align="center"><div class="title">
                 <a href=products_show.asp?id=<%=rs("id")%>  class=fontweight><%=rs("title")%></a></div></td>
                 <td><div class="f_body"><%=rs("f_body")%></div></td>
                  <td align="center"><div class="more maxheight"><a href=products_show.asp?id=<%=rs("id")%> ><span class="red">详细信息</span></a></div></td>
                </tr>
				<tr><td>&nbsp;</td></tr>
                </table>
            </td>
            
	<%	
			if a mod 1=0 then
			%>
            </tr><tr><td>&nbsp;</td></tr>
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
        if lm<>"" then pra="fid="&lm
            call listpage_num(pra)
        end if
        %>
        </P>
    </td>
  </tr>
</table>
<table width=98% border=0 cellpadding=5 cellspacing=0 class=new>
<tr><td>信息列表</td></tr>
<tr>     			
 <%
 		lm=request.QueryString("fid")
		set rs=server.CreateObject("adodb.recordset")
		if lm<>"" and isnumeric(lm) then
		  sql="select * from info_co where pass='yes' and lm="&lm&" "&likes&" order by px desc,id desc"
		else
		  sql="select * from info_co where pass='yes' "&likes&" order by px desc,id desc"
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
			if img_sl="" then img_sl="js/images/products.jpg" end if
			'lm=rs("lm")
			'lm_title=pro_lm_title(lm)
			'id=rs("id")
			'title=rs("title")
			'response.Write lm_title
			
	%>
    

            <td width="29%" align=center style="border:#cccccc 1px solid;">
                <table width="100%">
                <tr><td width="100">信息标题</td><td>信息简介</td><td width="100">查看详情</td></tr>
                <tr>
                
                 <td align="center"><div class="title">
                 <a href=news_show.asp?id=<%=rs("id")%>  class=fontweight><%=rs("title")%></a></div></td>
                 <td><div class="f_body"><%=rs("f_body")%></div></td>
                  <td align="center"><div class="more maxheight"><a href=news_show.asp?id=<%=rs("id")%> ><span class="red">详细信息</span></a></div></td>
                </tr>
				<tr><td>&nbsp;</td></tr>
                </table>
            </td>
            
	<%	
			if a mod 1=0 then
			%>
            </tr><tr><td>&nbsp;</td></tr>
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
    <td colspan="4">没有相关信息</td>
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
        if lm<>"" then pra="fid="&lm
            call listpage_num(pra)
        end if
        %>
        </P>
    </td>
  </tr>
</table>
<table width=98% border=0 cellpadding=5 cellspacing=0 class=new>
<tr><td>资料列表</td></tr>
<tr>     			
 <%
 		lm=request.QueryString("fid")
		set rs=server.CreateObject("adodb.recordset")
		if lm<>"" and isnumeric(lm) then
		  sql="select * from tol_co where 1=1 and lm="&lm&" "&likes&" order by px desc,id desc"
		else
		  sql="select * from tol_co where 1=1 "&likes&" order by px desc,id desc"
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
			
			'lm=rs("lm")
			'lm_title=pro_lm_title(lm)
			'id=rs("id")
			'title=rs("title")
			'response.Write lm_title
			
	%>
    

            <td width="29%" align=center style="border:#cccccc 1px solid;">
                <table width="100%">
                <tr><td>资料标题</td><td width="100" align="center">查看详情</td></tr>
                <tr>
                
                 <td align="center"><div class="title">
                 <a href=tol.asp?id=<%=rs("id")%>  class=fontweight><%=rs("title")%></a></div></td>
                
                  <td align="center"><div class="more maxheight"><a href=tol.asp?id=<%=rs("id")%> ><span class="red">详细信息</span></a></div></td>
                </tr>
				<tr><td>&nbsp;</td></tr>
                </table>
            </td>
            
	<%	
			if a mod 1=0 then
			%>
            </tr><tr><td>&nbsp;</td></tr>
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
    <td colspan="4">没有相关资料</td>
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
        if lm<>"" then pra="fid="&lm
            call listpage_num(pra)
        end if
        %>
        </P>
    </td>
  </tr>
</table>