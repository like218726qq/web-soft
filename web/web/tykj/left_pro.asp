<!--<table  border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr >
      <td style="background-image:url(images/contact.jpg); width:171px; height:32px; padding-left:15px; font-size:14px;">产品展示</td>
  </tr>
     <tr>
    <td style="background-image:url(images/contact_m.jpg);height:25px; padding-top:10px;" >
<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
    < %
	'一级分类
	set rsa=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from pro_lm where fid=0 and id_lm not in (8,9,39,40,43,88,100,103,112) order by px desc,id_lm desc"
	rsa.open sql,conn,1,1
	while not rsa.eof
%>
    <tr>
    <td width="12" height="22" valign="top" style="padding-top:5px"> <img src="images/d.jpg" /></td>
      <td>
      <a href="products.asp?dlm=< %=rsa("id_lm")%>">< %=rsa("title_lm")%></a>
       < %if dlm<>rsa("id_lm") then response.write" " end if%>
      </td>
    </tr>
    < %
		'二级分类
        set rsb=server.CreateObject("adodb.recordset")
        sql="select id_lm,title_lm from pro_lm where fid="&rsa("id_lm")&" order by px desc,id_lm desc"
        rsb.open sql,conn,1,1
        if not rsb.eof then
	%>
    < %
			while not rsb.eof
		%>
    <tr>
      <td></td>
      <td style="padding-left:10px;"><a href="products.asp?dlm=< %=rsa("id_lm")%>&xlm=< %=rsb("id_lm")%>">< %=rsb("title_lm")%></a></td>
    </tr>
    < %
			rsb.movenext
			wend
		%>
    < %
        end if
        rsb.close
        set rsb=nothing
    %>

< %
	rsa.movenext
	wend
	rsa.close
	set rsa=nothing
%>
    </table>
    </td>
    </tr>
    <tr><td style="background-image:url(images/contact_b.jpg); width:185px; height:14px;"></td></tr>
</table>-->


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
    <img src="images/about_03.jpg" style="display:block;width:186px;" />
    <dl>
		<%
			'一级分类
			set rsa=server.CreateObject("adodb.recordset")
			sql="select id_lm,title_lm from pro_lm where fid=116 order by px desc,id_lm desc"
			rsa.open sql,conn,1,1
			while not rsa.eof
        %>
        <dt style="width:136px;"><a href="products.asp?dlm=<%=rsa("id_lm")%>"><%=getstr(rsa("title_lm"),18)%></a>
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
              <li style="width:136px;"><a href="products.asp?dlm=<%=rsa("id_lm")%>&xlm=<%=rsb("id_lm")%>"><%=rsb("title_lm")%></a></li>
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
    <img src="images/about_14.jpg" style="display:block;width:186px;" />
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
