 
<style>
	.title{height:30px; line-height:30px; font-size:14px; font-weight:bold;}
	.img{ border:1px solid #dcdcdc; width:200px; height:160px; text-align:center; vertical-align:middle; overflow:hidden;}
	.img a{ display:block; width:200px; height:160px; text-align:center;}
	.img img{ vertical-align:middle; text-align:center; border:none;}
	.more{height:30px; line-height:30px;}
	.red{ color:red;}
	.f_body{  line-height:25px;overflow:hidden; text-align:center; text-indent:2em;}
.min_width{min-width:300px;_width:expression(document.body.clientWidth < 300 ? "300px" : "auto");}
.max_width{max-width:600px;_width:expression(document.body.clientWidth > 600 ? "600px" : "auto");}
.min_height{min-height:200px;_height:expression(this.scrollHeight < 200 ? "200px" : "auto");}
.max_height{max-height:400px;_height:expression(this.scrollHeight > 400 ? "400px" : "auto");}

.max_width0{max-width:140px;_width:expression(document.body.clientWidth > 140 ? "140px" : "auto"); margin:5px;}
.max_height0{max-height:140px;_height:expression(this.scrollHeight > 140 ? "140px" : "auto");}
.table0{ border:1px solid #dcdcdc;}
.table1{ border:1px solid #dcdcdc;}
.table1 td{ text-align:center;}
</style>
<table width=99% ><tr>			
 <%
 		lm=request.QueryString("fid")
		lm2=request.QueryString("fid2")
		keyword=request("keyword")
		pra=""
		if lm<>"" then pra="&fid="&lm end if
		if lm2<>"" then pra="$fid2="&lm2 end if
		sq=""
		if lm<>"" then sq=" and ( lm in ( select id_lm where pro_lm where fid= "&lm&") or lm ="&lm&" ) " end if
		if lm2<>"" then sq=" and ( lm in ( select id_lm where pro_lm where fid= "&lm2&") or lm ="&lm2&" ) " end if
		if keyword<>"" then 
		sq= " and title like '%"&keyword&"%' " 
		pra=pra&"&keyword="&keyword
		end if
		set rs=server.CreateObject("adodb.recordset")
		if lm<>"" and isnumeric(lm) then
		  sql="select * from pro_co where pass='yes' and lm="&lm&" order by px desc,id desc"
		else
		  sql="select * from pro_co where pass='yes'  order by px desc,id desc"
		end if
		rs.open sql,conn,1,1
		if not rs.eof then
			pagenum=8
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
			img_sl="images/index_61.jpg"
			if rs("img_sl")<>"" then 
			img_sl=rs("img_sl")
			end if
			title=rs("title")
			url="products_show.asp?id="&rs("id")
			temp=""
			
	%>
     	<td>
        <table width="200" cellpadding="0" cellspacing="0" class="table1">
             <tr>
                <td align="center" valign="middle">
                <img src="../<%=rs("img_sl")%>" class="max_width0 max_height0"/>
                </td>
            </tr>
            <tr>
                <td><%=rs("title")%></span></td>
            </tr>
            <tr>
                <td>市场价：<span style="color:red; font-weight:bold; font-size:13px;">￥<%=rs("pro_can8")%></span></td>
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
           
            <%
			end if
            a=a+1
            rs.movenext
			wend
		else	
	%>
     <td style=" height:30px; line-height:30px; width:80%;">暂无相关信息</td>
   
	<%
		end if	
		rs.close
		set rs=nothing
 %>  
 </tr></table>     