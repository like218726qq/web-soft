<!--#include file="admin/inc.asp"-->
<%
'连接数据库
opconn()
'网站配置
dim site_title,site_key,site_des
dim site_count,site_can1,site_can2,site_can3,site_can4,site_can5
dim site_title_en,site_key_en,site_des_en,site_bot_en,site_bot
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from setup "
  rs.open sql,conn,1,1
  if not  rs.eof then
	site_title=rs("site_title")
	site_key=rs("site_key")
	site_des=rs("site_des")
	site_bot=rs("site_bot")
	site_title_en=rs("site_title_en")
	site_key_en=rs("site_key_en")
	site_des_en=rs("site_des_en")
	site_bot_en=rs("site_bot_en")
	site_count=rehtml(rs("site_count"))
	site_can1=rs("site_can1")
	site_can2=rs("site_can2")
	site_can3=rs("site_can3")
	site_can4=rs("site_can4")
	site_can5=rs("site_can5")
	site_can1_en=rs("site_can1_en")
	site_can2_en=rs("site_can2_en")
	site_can3_en=rs("site_can3_en")
	site_can4_en=rs("site_can4_en")
	site_can5_en=rs("site_can5_en")
  end if
  rs.close
  set rs=nothing
  
dim slide_img_sl,slide_title,slide_link_url
function slide(lm)
		set rs = server.createobject("adodb.recordset")
		  sql="select  * from info_co where lm="&lm&" order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			slide_img_sl="../"&rs("img_sl")
			slide_title="../"&rs("title")
			rs.movenext
			while not rs.eof
				slide_img_sl=slide_img_sl&"|../"&rs("img_sl")
				slide_title=slide_title&"|../"&rs("title")
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function links(lm)
		set rs = server.createobject("adodb.recordset")
		  sql="select  * from info_co where lm="&lm&" order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			%>
<a href="<%=rs("link_url")%>" target="_blank"><%=rs("title")%></a>
   			<%
			rs.movenext
			while not rs.eof
				%>
               |<a href="<%=rs("link_url")%>" target="_blank"><%=rs("title")%></a>  
                <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function links2(lm)
		set rs = server.createobject("adodb.recordset")
		  sql="select  * from info_co where lm="&lm&" order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  a=1
			while not rs.eof
				%>
                 <td><a href="<%=rs("link_url")%>" target="_blank"><%=rs("title")%></a></td>
                <%
			rs.movenext
			if a=8 then response.Write "</tr><tr>" end if
			a=a+1
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function hotkey(lm)
		set rs = server.createobject("adodb.recordset")
		  sql="select  * from info_co where lm="&lm&" order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			%>
            <a href='search.asp?keyword=<%=rs("title")%>'><span style="color:#aaa;"><%=rs("title")%></span>&nbsp;</a>
   			<%
			rs.movenext
			while not rs.eof
				%>
                <a href='search.asp?keyword=<%=rs("title")%>'>&nbsp;<span style="color:#aaa;"><%=rs("title")%></span></a>
                <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_info_tuijian(lm,num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from info_co where lm in("&lm&") and tuijian='yes' order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			while not rs.eof
			%>
         <li><a href="<%=url%>?id=<%=rs("id")%>"><span><%=fdate(rs("wtime"))%></span><%=left(rs("title"),20)&"..."%></a>
       
         </li>
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_info_tuijian01(lm,num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from info_co where lm in("&lm&") and tuijian='yes' order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			while not rs.eof
			%>
        
          <img src="../<%=rs("img_sl")%>" width="158" height="112" class="imag" />
          &nbsp;&nbsp;&nbsp; <a href="<%=url%>?id=<%=rs("id")%>"><%=rs("f_body")%>
          
          </a>
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_info_tuijian02(lm,num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from info_co where lm in("&lm&") and tuijian='yes' order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  a=1
			while not rs.eof
			%>
          
        <%=rs("f_body")%>
            
            <%
			rs.movenext
			a=a+1
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_info_tuijian03(lm,num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from info_co where lm in("&lm&") and tuijian='yes' order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  a=1
			while not rs.eof
			%>
          <img src="../<%=rs("img_sl")%>" width="150" height="118" hspace="5" class="img" />
		  <%=rs("f_body")%>
            <%
			rs.movenext
			a=a+1
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_info_tuijian04(lm,num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from info_co where lm in("&lm&") and tuijian='yes' order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  a=1
			while not rs.eof
			%>
         
		  <%=rs("f_body")%>
            <%
			rs.movenext
			a=a+1
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_info_hot(lm,num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from info_co where lm in("&lm&") and pass='yes' and hot='yes' order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			while not rs.eof
			%> 
            <li><a href="<%=url%>?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" width="119" height="95" /><br /><p><%=rs("title")%></p><p><%=rs("f_body")%></p></a></li>			
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_pro_tuijian(lm,num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from pro_co where (lm="&lm&" or lm in(select id_lm from pro_lm where fid="&lm&") ) and pass='yes' and tuijian='yes' order by px desc,id desc "
		  'response.Write sql
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			while not rs.eof
		    img_sl=rs("img_sl")
			%>
            <li>
                <div class="liimg"><a href="<%=url%>?id=<%=rs("id")%>"><img src="../<%=getbpic(rs("img_sl"),"b")%>" width="189" height="142" /></a></div>
                <p><a href="<%=url%>?id=<%=rs("id")%>"><%=rs("title")%></a></p>
            </li>
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_pro_tuijian_en(num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from pro_co where pass='yes' and tuijian='yes' order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			while not rs.eof
		    img_sl=rs("img_sl")
			%>
            <li><a href="<%=url%>?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" width="6" height="8" /><br /><%=rs("title_en")%></a></li>
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_pro_lm(num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from pro_lm where 1=1 order by px desc,id_lm desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  %>
          <li><a href="<%=url%>?fid=<%=rs("id_lm")%>">最新推荐：<%=rs("title_lm")%></a></li>
          <%
		  rs.movenext
			while not rs.eof
			%>
            <li><a href="<%=url%>?fid=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_pro_lm_en(num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from pro_lm where 1=1 order by px desc,id_lm desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  %>
          <li><a href="<%=url%>?fid=<%=rs("id_lm")%>">new:<%=rs("title_lm_en")%></a></li>
          <%
		  rs.movenext
			while not rs.eof
			%>
            <li><a href="<%=url%>?fid=<%=rs("id_lm")%>"><%=rs("title_lm_en")%></a></li>
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function pro_lm_first()
		set rs = server.createobject("adodb.recordset")
		  sql="select top 1 * from pro_lm where fid=0 order by px desc,id_lm desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  pro_lm_first=rs("id_lm")
		  end if
		  rs.close
		  set rs=nothing
end function
function index_link(lm)
		set rs = server.createobject("adodb.recordset")
		  sql="select top 20 * from info_co where lm in("&lm&")  order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			while not rs.eof
			img_sl="images/i_41.jpg"
			if rs("img_sl")<>"" then img_sl=rs("img_sl") end if
			%>
            <td width="100"> <a href="<%=rs("link_url")%>" title="" target="_blank"><img src="<%=img_sl%>" alt="" onerror="img_error(this,'images/ingd01.jpg')"></a></td>
            
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function index_info_co(lm,num,url)
		set rs = server.createobject("adodb.recordset")
		  sql="select top "&num&" * from info_co where lm in("&lm&") and tuijian='yes' order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			while not rs.eof
			%>
            <table width="318" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>
                       <a href="<%=url%>?id=<%=rs("id")%>"><span>·<%=rs("title")%></span></a>
                      </td>
                    </tr>
             </table>
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
end function
function zbody(id)
	set rs = server.createobject("adodb.recordset")
  sql="select  * from tol_co where id="&id
  rs.open sql,conn,1,1
  if not  rs.eof then
	zbody=rs("z_body")
  end if
  rs.close
  set rs=nothing
end function
function pro_lm_title(id)
	if id="" or not checknum(id) then
		pro_lm_title="全部"
	else
		set rs = server.createobject("adodb.recordset")
		sql="select  * from pro_lm where id_lm="&id
		
		rs.open sql,conn,1,1
		if not  rs.eof then
		pro_lm_title="<a href='products.asp?fid="&id&"'><span>"&rs("title_lm")&"</span></a>"
		end if
		rs.close
		set rs=nothing
	end if	
end function
function pro_lm_title_en(id)
	if id="" or not checknum(id) then
		pro_lm_title_en="ALL"
	else
		set rs = server.createobject("adodb.recordset")
		sql="select  * from pro_lm where id_lm="&id
		
		rs.open sql,conn,1,1
		if not  rs.eof then
		pro_lm_title_en="<a href='products.asp?fid="&id&"'><span>"&rs("title_lm_en")&"</span></a>"
		end if
		rs.close
		set rs=nothing
	end if	
end function
function pro_lm_nodes(id)
	set rs = server.createobject("adodb.recordset")
  sql="select  * from pro_lm where id_lm="&id
 
  rs.open sql,conn,1,1
  if not  rs.eof then
	pro_lm_nodes=rs("nodes")
  end if
  rs.close
  set rs=nothing
end function
function pro_lm_nodes_en(id)
	set rs = server.createobject("adodb.recordset")
  sql="select  * from pro_lm where id_lm="&id
 
  rs.open sql,conn,1,1
  if not  rs.eof then
	pro_lm_nodes_en=rs("nodes_en")
  end if
  rs.close
  set rs=nothing
end function
function info_lm_title(id)
	if id="" or not checknum(id) then
		info_lm_title="全部"
	else
		set rs = server.createobject("adodb.recordset")
		sql="select  * from info_lm where id_lm="&id
		rs.open sql,conn,1,1
		if not  rs.eof then
		info_lm_title=rs("title_lm")
		end if
		rs.close
		set rs=nothing
  end if
end function
function info_lm_title_en(id)
	if id="" or not checknum(id) then
		info_lm_title_en="ALL"
	else
		set rs = server.createobject("adodb.recordset")
		sql="select  * from info_lm where id_lm="&id
		rs.open sql,conn,1,1
		if not  rs.eof then
		info_lm_title_en=rs("title_lm")
		end if
		rs.close
		set rs=nothing
  end if
end function

function info_lm_node(id)
set rs = server.createobject("adodb.recordset")
  sql="select  * from info_lm where id_lm="&id
  rs.open sql,conn,1,1
  if not  rs.eof then
	info_lm_node=rs("node")
  end if
  rs.close
  set rs=nothing
end function
dim lm,title,color_font,wtime,read_num,z_body,img_sl,title_lm,fwtime,id,pre_id,pre_title,next_id,next_title,dow_sl,vid_sl
dim title_en,z_body_en,title_lm_en,next_title_en,pre_title_en
function tol_co(lm)
	set rs = server.createobject("adodb.recordset")
	id=request.QueryString("id")
	if id="" then 
  sql="select top 1 * from tol_co where lm="&lm&" order by px desc,id desc"
  else
   sql="select top 1 * from tol_co where id="&id&" order by px desc,id desc"
  end if
  rs.open sql,conn,1,1
  if not  rs.eof then
	z_body=rs("z_body")
	title=rs("title")
	z_body_en=rs("z_body_en")
	title_en=rs("title_en")
  end if
  rs.close
  set rs=nothing
end function
function tol_co_nav(lm,url)
	set rs = server.createobject("adodb.recordset")
	ffid=request.QueryString("id")
	
  sql="select * from tol_co where lm="&lm&" order by px desc,id desc"
  
  rs.open sql,conn,1,1
  if not  rs.eof then
  a=1
	while not rs.eof
	temp1=""
	temp2=""
	if a=1 then temp1="noline" end if
	if ffid=cstr(rs("id")) or (ffid="" and a=1) then  temp2="cc" end if
	%>
      <table width="239" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="33" class="fenl_beij">
           <a class="<%=temp2%>" href="<%=url%>?id=<%=rs("id")%>"><%=rehtml(rs("title"))%></a>
          </td>
        </tr>
      </table>
    <%
	rs.movenext
	a=a+1
	wend
  end if
  rs.close
  set rs=nothing
end function

function info_lm_nav(lm,url)
	set rs = server.createobject("adodb.recordset")
	ffid=request.QueryString("fid")
  sql="select * from info_lm where fid="&lm&" order by px desc,id_lm desc"
  rs.open sql,conn,1,1
  if not  rs.eof then
  a=1
	while not rs.eof
	temp1=""
	temp2=""
	if a=1 then temp1="noline" end if
	if ffid=cstr(rs("id_lm")) or (ffid="" and a=1) then  temp2="cc" end if
	%>
    <li><a class="<%=temp2%>" href="<%=url%>?fid=<%=rs("id_lm")%>"><%=rehtml(rs("title_lm"))%></a></li>
    <%
	rs.movenext
	a=a+1
	wend
  end if
  rs.close
  set rs=nothing
end function
function info_co_nav(lm,url)
	set rs = server.createobject("adodb.recordset")
	id=request.QueryString("id")
  sql="select * from info_co where lm="&lm&" order by px desc,id desc"
  rs.open sql,conn,1,1
  if not  rs.eof then
  a=1
	while not rs.eof
	temp1=""
	temp2=""
	if a=1 then temp1="noline" end if
	if id=cstr(rs("id")) or (id="" and a=1) then  temp2="cc" end if
	%>
     <li><a class="a" href="<%=url%>?id=<%=rs("id")%>"><%=rs("title")%></a></li>
    <%
	rs.movenext
	a=a+1
	wend
  end if
  rs.close
  set rs=nothing
end function
function pro_lm_nav(lm,url)
  set rs = server.createobject("adodb.recordset")
  ffid=request.QueryString("fid")
  sql="select * from pro_lm where fid="&lm&" order by px desc,id_lm desc"
  rs.open sql,conn,1,1
  if not  rs.eof then
  a=1
	while not rs.eof
	temp1=""
	temp2=""
	if a=1 then temp1="noline" end if
	if ffid=cstr(rs("id_lm")) then  temp2="cc" end if
	%>
   <li><a  href="<%=url%>?fid=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
    <%
	rs.movenext
	a=a+1
	wend
  end if
  rs.close
  set rs=nothing
end function

function info()
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
			'response.Redirect rs("link_url"):response.End()
		end if
		lm=rs("lm")
		title=rs("title")
		color_font=rs("color_font")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		wtime=rs("wtime")
		dow_sl=rs("dow_sl")
		img_sl=rs("img_sl")
		vid_sl=rs("vid_sl")
		if img_sl<>"" then img_sld=getbpic(img_sl,"d") end if
		
	end if
	rs.close
	set rs=nothing
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from info_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		title_lm=rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing
	set rsa=server.CreateObject("adodb.recordset")
	sql="select top 1 * from info_co where lm="&lm&" and id>"&id
	rsa.open sql,conn,1,1
	if not rsa.eof then
		pre_title=rsa("title")
		pre_id=rsa("id")
	end if
	rsa.close
	set rsa=nothing
	set rsa=server.CreateObject("adodb.recordset")
	sql="select top 1 * from info_co where lm="&lm&" and id<"&id
	rsa.open sql,conn,1,1
	if not rsa.eof then
		next_title=rsa("title")
		next_id=rsa("id")
	end if
	rsa.close
	set rsa=nothing
end function
function info_co(lm)
	if id="" then
	id=request("id")
	end if
	if id="" or not checknum(id) then
		set rsb=server.CreateObject("adodb.recordset")
		sqlb="select top 1 * from info_co where lm="&lm&"  and pass='yes' order by px desc,id desc "
		'response.Write sqlb
		rsb.open sqlb,conn,1,3
		if not rsb.eof then
			id=rsb("id")
		else
		 
		end if
		rsb.close
		set rsb=nothing
	end if
	if id="" then response.End() end if
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
		title_lm=rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing
end function
dim img_sld
function pro_co()
	id=request("id")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		
		lm=rs("lm")
		title=rs("title")
		title_en=rs("title_en")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		z_body_en=rs("z_body_en")
		img_sl=rs("img_sl")
		if img_sl="" then 
		else
		img_sld=getbpic(img_sl,"d")
		end if
		
	end if
	rs.close
	set rs=nothing
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm,title_lm_en from pro_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		title_lm=rsa("title_lm")
		title_lm_en=rsa("title_lm_en")
	end if
	rsa.close
	set rsa=nothing
	set rsa=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where lm="&lm&" and id<"&id&" order by px desc,id desc "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		pre_id=rsa("id")
		pre_title=rsa("title")
		pre_title_en=rsa("title_en")
	end if
	rsa.close
	set rsa=nothing
	set rsa=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where lm="&lm&" and id>"&id&" order by px desc,id desc "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		next_id=rsa("id")
		next_title=rsa("title")
		next_title_en=rsa("title_en")
	end if
	rsa.close
	set rsa=nothing
end function
'图片表
function tu_co(id,default)
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from tu_co where id="&id
  temp=""
  rs.open sql,conn,1,1
  if not  rs.eof then
	temp=rs("img_sl")
  end if
  rs.close
  set rs=nothing
  if temp="" then
     temp=default
  end if
  tu_co=temp
end function
function init_fid(table,id_lm)
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from "&table&" where fid="&id_lm&" order by px desc,id_lm desc"
  rs.open sql,conn,1,1
  temp=""
  if not  rs.eof then
	temp=rs("id_lm")
  end if
  rs.close
  set rs=nothing
  init_fid=temp
end function
%>
<%
sub listpage_num2(pra)
		
		htm = "<div class='paL1'><a href=?page=1"&pra&"><img src='images/pL1.jpg' width='22' height='24' /></a></div>"
		if pageno>1 then
			htm = htm & "<div class='paL2'><a href=""?page="&pageno-1&pra&""" class=tt><img src='images/pL2.jpg' width='22' height='24' /></a></div>"
		else
			htm = htm & "<div class='paL2'><img src='images/pL2.jpg' width='22' height='24' /></div>"
		end if
		htm=htm&"<div class='pagecon'><ul>"
		if pagnum mod 2 = 0 then
			step2 = pagnum / 2
			step1 = step2 - 1
		else
			step1 = int(pagnum / 2)
			step2 = step1
		end if
		p_start = pageno - step1
		p_end = pageno + step2
		s_str = "<li><a href=""?page=1"&pra&""">1...</a></li>"
		e_str = "<li><a href=""?page="&pagezong&pra&""">..."&pagezong&"</a></li>"
		if pagezong <= pagnum or pagezong <= step2 then
			p_start = 1
			p_end = pagezong
			s_str = ""
			e_str = ""
		else
			if p_start <= 1 then
				s_str = ""
				p_start = 1
				p_end = pagnum
			end if
			if p_end >= pagezong then
				p_end = pagezong
				p_start = pagezong - pagnum + 1
				e_str = ""
			end if
		end if
		htm = htm & s_str
		for i = p_start to p_end
			if cstr(i) = cstr(pageno) then
				htm = htm & "<li class=""bg""><a class=""current"">&nbsp;"&i&"&nbsp;</a></li>"
			else
				htm = htm & "<li><a href=""?page="&i&pra&""">&nbsp;"&i&"&nbsp;</a></li>"
			end if
		next
		htm = htm & e_str
		htm=htm&"</ul></div>"
			if cstr(pageno)=cstr(pagezong) then
				htm = htm &"<div class='paR1'><a class=tt><img src='images/pR1.jpg' width='22' height='24' /></a></div>"
			else
				htm = htm &"<div class='paR1'><a href=""?page="&pageno+1&pra&""" class=tt><img src='images/pR1.jpg' width='22' height='24' /></a></div>"
				
			end if
		htm = htm &"<div class='paR2'><a href=?page="&pagezong&pra&"><img src='images/pR2.jpg' width='22' height='24' /></a></div>"
		if pagezong=1 then htm="" end if
		response.write htm
	end sub
%>