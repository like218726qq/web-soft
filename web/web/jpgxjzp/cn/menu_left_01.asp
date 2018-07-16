<!--include file="../html.conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
.pro_nav ol,.pro_nav ul,.pro_nav li{ margin:0px; padding:0px;}
.pro_nav ol,ul,li{ list-style:none;}
.pro_nav img{ border:none;}
.pro_nav a:hover{ color:#e58e1f;}
.clear{ clear:both;}
.pro_nav{ width:230px; font-size:14px;}
#menu{ width:230px; overflow:hidden;}
#menu li a{ font-weight:bold; width:230px;height:40px;line-height:40px; display:block;background:url(images/fenl_erj_.jpg) no-repeat left center; padding-left:50px;  cursor:pointer; border-bottom:1px dashed #dcdcdc;}
#menu li ul li a{ font-weight:normal; width:200px; height:30px; margin-left:10px; line-height:30px; display:block; background:none; padding-left:50px; border-bottom:1px solid #e2e2e2;}
</style>
<script src="menu_left_01/js/jquery-1.2.1.min.js" type="text/javascript"></script>
<style>
#menu2 li .cur{ display:block !important;}
#menu2 li .cur2{ display:block !important;}
#menu2 li .hide{ display:none;}
</style>
<div class="pro_nav2">
    <ul id="menu2">
    <%
	ffid=request.QueryString("fid")
	'if ffid="" then ffid=pro_lm_first() end if
	set rs = server.createobject("adodb.recordset")
		  sql="select  * from pro_lm where fid=0 order by px desc,id_lm desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
		  while not rs.eof
			%>
            <li class="li">
            <h4><a href="products.asp?fid=<%=rs("id_lm")%>&tag=0"><%=rs("title_lm")%></a></h4>
            <div class="licon hide <%if cstr(ffid)=cstr(rs("id_lm")) then%> cur <% end if %>" >
                <ul class="hide <%if cstr(ffid)=cstr(rs("id_lm")) then%> cur <% end if %>">
                <%
				set rsa = server.createobject("adodb.recordset")
					  sqla="select  * from pro_lm where fid="&rs("id_lm")&" order by px desc,id_lm desc "
					  rsa.open sqla,conn,1,1
					  if not  rsa.eof then
					  while not rsa.eof
						%>
						<li>
						<a href="products.asp?fid=<%=rs("id_lm")%>&fid2=<%=rsa("id_lm")%>&tag=1"><%=rsa("title_lm")%></a>
						</li>
						<%
					  rsa.movenext
					  wend	
					  end if
					  rsa.close
					  set rsa=nothing
				%>
                </ul>
                </div>
            </li>
            <%
		  rs.movenext
		  wend	
		  end if
		  rs.close
		  set rs=nothing
	%>
    </ul>
</div>

<script>
$(document).ready(function(e) {
	$("#menu .li").mouseover(
	function(){ 
				//$(this).find("ul:first").slideDown();
				//$("#menu li").not(this).find("ul:first").slideUp("fast");
			}
	);
});
</script>
