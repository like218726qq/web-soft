<!--#include file="top.asp"-->

 <%
	xlm=request("xlm")
	dlm=request("dlm")
	keyword=bsql(html(trim(request("keyword"))))
	
	if xlm<>"" then
		if not checknum(xlm) then
			call msg("参数错误","")
		else
			xlm=clng(xlm)
		end if
	end if
	if dlm<>"" then
		if not checknum(dlm) then
			call msg("参数错误","")
		else
			dlm=clng(dlm)
		end if
	end if

	if xlm<>"" and dlm<>"" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select a.id_lm,a.title_lm as xtitle,b.title_lm as dtitle from pro_lm a, pro_lm b where a.fid=b.id_lm and a.id_lm="&xlm&""
		rs.open sql,conn,1,1
		if not rs.eof then
			dao=" &gt; <a href=""product.asp?dlm="&dlm&""">"&rs("dtitle")&"</a> &gt; "&rs("xtitle")&""
			title_lm=rs("dtitle")
		end if
		rs.close
		set rs=nothing
		sq=" and lm ="&xlm&""
		pra="&dlm="&dlm&"&xlm="&xlm&""
	elseif dlm<>"" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select id_lm,title_lm as dtitle from pro_lm where id_lm="&dlm&""
		rs.open sql,conn,1,1
		if not rs.eof then
			dao=" &gt; "&rs("dtitle")&""
			title_lm=rs("dtitle")
		end if
		rs.close
		set rs=nothing
		sq=" and (lm="&dlm&" or lm in (select id_lm from pro_lm where fid="&dlm&")) "
		pra="&dlm="&dlm&""
	end if
	
	if keyword<>"" then
		sq=" and title like'%"&keyword&"%'"
		pra="&keyword="&server.URLEncode(keyword)&""
		dao=" &gt; 搜索结果"
	end if
%>	
    
    
    <div class="listcon">
    	
        <!--#include file="left.asp"-->
    
    	 <div class="listR">
         	
            <div class="R1">
            	<h4>关于石得士</h4>
            	<p>
                 			<%
								set rs=server.CreateObject("adodb.recordset")
								sql="select * from tol_co where id=2"
								rs.open sql,conn,1,1
								if not rs.eof then
									response.write rs("z_body")
								end if
								rs.close
								set rs=nothing
							%>
                
                </p>
                  </div>
                  
                  
                <div class="licon">
                	<ul>
						<%	
								if keyword<>"" then
                    tt=tt&" and title like '%"&keyword&"%'"
                end if
								set rs=server.CreateObject("adodb.recordset")
								sql="select id,title,img_sl from pro_co where pass='yes' and lm=2 "&sq&" order by px desc,id desc"
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
						%>
                        <li><img src="<%=rs("img_sl")%>" width="164" height="125" />
                        	<br />
                            <%=getstr(rs("title"),70)%>
                        	<a href="product_show.asp?id=<%=rs("id")%>">READ　MORE  >></a>
                        </li>              
			<!--<td  align="left" style="padding-top:10px; padding-left:15px;">
									<table  border="0"  cellpadding="0" cellspacing="0" >
												<tr>
												  <td>
												  <table  border="0"   align="center" cellpadding="0" cellspacing="0" >
													<tr>
													  <td style="border:none" align="center" width="160" height="130"><a href="product_show.asp?id=< %=rs("id")%>"><img src="< %=rs("img_sl")%>" border="0" /></a></td>
													</tr>
													<tr>
        												<td align="center"><a href="product_show.asp?id=< %=rs("id")%>"><font color="#000000">< %=rs("title")%></font></a>
       												 </td>
                                                     </tr>
												  </table></td>
												</tr>
									</table>	
							</td>-->
							<%			if a mod 4=0 then response.write "</tr><tr>"
									a=a+1
									rs.movenext
									wend
								else
								%>
				<div style="text-align:center; margin-top:100px; margin-left:200px; width:200px; vertical-align:top; font-size:12px;">暂无相关产品<span style="color:#FF0000"><strong><%=html(request.Form("keyword"))%></strong></span>信息！</div>
						<%		end if	
								rs.close
								set rs=nothing
						%> 
                        	                     
                    </ul>
        				
            </div>
         <div class="clear"></div>
                       <div style="font-size:12px; margin-left:100px;"><%if pagenum<>"" then call listpage(page) end if%></div>
         
         
         </div>
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   

	<div class="clear"></div>
	<!--#include file="bottom.asp"-->



</body>
</html>
