<%  Session.CodePage=65001
    Response.CharSet = "utf-8"
%>

<%
	xlm=request("xlm")
	dlm=request("dlm")
%>

<link rel="stylesheet" type="text/css" href="css/css.css" />
<script src="scripts/jquery-1.2.1.min.js" type="text/javascript"></script>

<div class="pro_nav">
    <div style="font-size:18px;font-weight:bold;height:30px;line-height:30px;padding-left:5px;">产品中心</div>
    <dl>
		<%
			'一级分类
			set rsa=server.CreateObject("adodb.recordset")
			sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
			rsa.open sql,conn,1,1
			while not rsa.eof
        %>
        <dt><a href="product.asp?dlm=<%=rsa("id_lm")%>"><span><%=getstr(rsa("title_lm"),18)%></span></a>
    </dt>
        <dd <%if dlm<>rsa("id_lm") then response.write" style=""display:none""" end if%>>
         <ul>
         <%
			'二级分类
			set rsb=server.CreateObject("adodb.recordset")
			sql="select id_lm,title_lm from pro_lm where fid="&rsa("id_lm")&" order by px desc,id_lm desc"
			rsb.open sql,conn,1,1
			if not rsb.eof then
	    %>
        <%
			while not rsb.eof
		%>
              <li style="width:74px;"><a href="product.asp?dlm=<%=rsa("id_lm")%>&xlm=<%=rsb("id_lm")%>"><%=left(rsb("title_lm"),6)%></a></li>
		<%
			rsb.movenext
			wend
        %>
        <%
			end if
			rsb.close
			set rsb=nothing
        %>     
		  </ul>
           <%
			rsa.movenext
			wend
			rsa.close
			set rsa=nothing
        %>
        </dd>
    </dl>
</div>
<script>
function initMenu() {
  /*隐藏所有.pro_nav dd*/
  $('.pro_nav dd').hide();
  /*类为cur的dd显示*/
  $('.pro_nav dd.cur').show();
  /*所有的.pro_nav dt点击*/
  $('.pro_nav dt').click(
    function() {
	  /*被点击的dt标签的下一个标签*/
      var checkElement = $(this).next();
      /*如果被点击的dt标签的下一个标签是dd同时是可见的，则dd标签收回*/
	  if((checkElement.is('dd')) && (checkElement.is(':visible'))) {
        checkElement.slideUp('normal');
        }
	  /*如果被点击的dt标签的下一个标签是dd同时是不可见的，则所有已显示的标签收回，dd标签展开*/
      if((checkElement.is('dd')) && (!checkElement.is(':visible'))) {
        $('.pro_nav dd:visible').slideUp('normal');
        checkElement.slideDown('normal');
        return false;
        }
      }
    );
  }
$(document).ready(function() {initMenu();});
</script>

