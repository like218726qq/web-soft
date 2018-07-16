 
<style>
	.title{height:30px; line-height:30px; font-size:14px; font-weight:bold;}
	.img{ border:1px solid #dcdcdc; width:200px; height:160px; text-align:center; vertical-align:middle; overflow:hidden;}
	.img a{ display:block; width:200px; height:160px; text-align:center;}
	.img img{ vertical-align:middle; text-align:center; border:none;}
	.more{height:30px; line-height:30px;}
	.red{ color:red;}
	.f_body{  line-height:25px;overflow:hidden; text-align:center; text-indent:2em;}
.max_height{max-height:166px;_height:expression(this.scrollHeight > 166 ? "166px" : "auto");}
.min_width{min-width:140px;_width:expression(document.body.clientWidth < 140 ? "140px" : "auto");}
.max_width{max-width:217px;_width:expression(document.body.clientWidth > 217 ? "217px" : "auto");}
.min_height{min-height:200px;_height:expression(this.scrollHeight < 200 ? "200px" : "auto");}
	</style>	
 <%
 		fid=request.QueryString("fid")
		'if fid="" then fid=init_fid("pro_lm","0") end if
		fid2=request.QueryString("fid2")
		keyword=request("keyword")
		pra=""
		sq=""
		if fid<>"" then 
		pra="&fid="&fid 
		sq=" and (lm in( "&fid&") or lm in( select id_lm from pro_lm where fid="&fid&" )) "
		end if
		if fid2<>"" then 
		pra=pra&"&fid2="&fid2 
		sq=" and (lm in( "&fid2&") or lm in( select id_lm from pro_lm where fid="&fid2&" )) "
		end if
		if keyword<>"" then 
		sq= " and title like '%"&keyword&"%' " 
		pra=pra&"&keyword="&keyword
		end if
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from pro_co where pass='yes' "&sq&" order by px desc,id desc"
		'response.Write sql
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
			rs.absolutepage=pageno
			a=1
			while not rs.eof and a<=pagenum
			img_sl="images/Rliimg.jpg"
			if rs("img_sl")<>"" then 
			img_sl=rs("img_sl")
			end if
			title=rs("title")
			url="products_show.asp?id="&rs("id")
			temp=" margin-left:9px; "
			if a=1 and a=4 then temp=" margin-left:0px;" end if
			
	%>  
     <li>
        <a href="products_show.asp?id=<%=rs("id")%>&fid=<%=rs("lm")%>">
        <div class="pliimg"><img src="../<%=rs("img_sl")%>" width="127" height="127" style="cursor:pointer;" onclick="window.location='products_show.asp?id=<%=rs("id")%>&fid=<%=rs("lm")%>'"/></div>
        <div class="plit" style="cursor:pointer;"><%=rs("title")%></div>
        </a>
    </li>
	<%	
			if a mod 4=0 and a<>16 then
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
   <div style=" height:30px; line-height:30px; width:80%;">暂无相关信息</div>
	<%
		end if	
		rs.close
		set rs=nothing
 %>  
   