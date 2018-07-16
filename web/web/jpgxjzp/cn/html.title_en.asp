<!--#include file="html.url.asp"-->
<style>
body{ font-family:Arial, Helvetica, sans-serif;}
</style>
<%
id=request.QueryString("id")
fid=request.QueryString("fid")
fid2=request.QueryString("fid2")
temp_titles=""
temp_keys=""
temp_des=""
select case url_filename
case "index.asp":
case "about.asp":
	call tol_lm_keys(4)
	if id<>"" then call tol_co_keys(id)  end if
case "contact.asp":
	call tol_lm_keys(5)
	if id<>"" then call tol_co_keys(id)  end if
case "job.asp":
	call tol_lm_keys(3)
	if id<>"" then call tol_co_keys(id)  end if
	
case "case.asp":
	call info_lm_keys(52)
	if fid<>"" then call info_lm_keys(fid) end if
	if id<>"" then call info_co_keys(id) end if
case "case_show.asp":
	call info_lm_keys(52)
	if fid<>"" then call info_lm_keys(fid) end if
	if id<>"" then call info_co_keys(id) end if
case "news.asp":
	call info_lm_keys(36)
	if fid<>"" then call info_lm_keys(fid) end if
	if id<>"" then call info_co_keys(id) end if
case "news_show.asp":
	call info_lm_keys(36)
	if fid<>"" then call info_lm_keys(fid) end if
	if id<>"" then call info_co_keys(id) end if
	
case "products.asp":
	call pro_lm_keys(0)
	if fid<>"" then call pro_lm_keys(fid) end if
	if fid2<>"" then call pro_lm_keys(fid2) end if
	if id<>"" then call pro_co_keys(id) end if
case "pro.asp":
	call pro_lm_keys(0)
	if fid<>"" then call pro_lm_keys(fid) end if
	if fid2<>"" then call pro_lm_keys(fid2) end if
	if id<>"" then call pro_co_keys(id) end if
case "products.asp":
	call pro_lm_keys(0)
	if fid<>"" then call pro_lm_keys(fid) end if
	if fid2<>"" then call pro_lm_keys(fid2) end if
	if id<>"" then call pro_co_keys(id) end if
case else

end select
call change_keys()
%>
<title><%=site_title_en%></title>
<meta name="keywords" content="<%=site_key_en%>" />
<meta name="describe" content="<%=site_des_en%>" />
<script language="javascript" src="../js/jquery-1.6.min.js"></script>
<script language="javascript" src="../js/all.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
DD_belatedPNG.fix('.ydcon img,.ydcon input img,.ban,.ban li img');
</script>
<%
function tol_lm_keys(id)
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from tol_lm where id_lm="&id
  rs.open sql,conn,1,1
  if not  rs.eof then
	temp_titles=rs("titles_en")
	temp_keys=rs("keys_en")
	temp_des=rs("des_en")
  end if
  rs.close
  set rs=nothing
end function
function tol_co_keys(id)
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from tol_co where id="&id
  rs.open sql,conn,1,1
  if not  rs.eof then
	temp_titles=rs("titles_en")
	temp_keys=rs("keys_en")
	temp_des=rs("des_en")
  end if
  rs.close
  set rs=nothing
end function
function info_lm_keys(id)
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from info_lm where id_lm="&id
  rs.open sql,conn,1,1
  if not  rs.eof then
	temp_titles=rs("titles")
	temp_keys=rs("keys")
	temp_des=rs("des")
  end if
  rs.close
  set rs=nothing
end function
function info_co_keys(id)
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from info_co where id="&id
  rs.open sql,conn,1,1
  if not  rs.eof then
	temp_titles=rs("titles")
	temp_keys=rs("keys")
	temp_des=rs("des")
  end if
  rs.close
  set rs=nothing
end function
function pro_lm_keys(id)
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from pro_lm where id_lm="&id
  rs.open sql,conn,1,1
  if not  rs.eof then
	temp_titles=rs("titles_en")
	temp_keys=rs("keys_en")
	temp_des=rs("des_en")
  end if
  rs.close
  set rs=nothing
end function
function pro_co_keys(id)
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from pro_co where id="&id
  rs.open sql,conn,1,1
  if not  rs.eof then
	temp_titles=rs("titles_en")
	temp_keys=rs("keys_en")
	temp_des=rs("des_en")
  end if
  rs.close
  set rs=nothing
end function
function change_keys()
	if temp_titles<>"" then site_title_en=temp_titles end if
	if temp_keys<>"" then site_keys_en=temp_keys end if
	if temp_des<>"" then site_des_en=temp_des end if
end function
%>

