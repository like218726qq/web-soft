<script src="js/jquery-1.2.1.min.js" type="text/javascript"></script>
<table width="242" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <Td>
                 <ul id="menu">
        <%
			'一级开始
			set rsa=server.CreateObject("adodb.recordset")
			sql="select id_lm,title_lm_es from pro_lm where fid=0 order by px desc,id_lm asc"
			rsa.open sql,conn,1,1
			while not rsa.eof
		%>
			<%
				'二级开始
				set rsb=server.CreateObject("adodb.recordset")
				sql="select id_lm,title_lm_es from pro_lm where fid="&rsa("id_lm")&" order by px desc,id_lm desc"
				rsb.open sql,conn,1,1
				if not rsb.eof then
			%>
            	<li> 
                
        <a href="javascript:void(0);"><%=rsa("title_lm_es")%></a>
       
                <ul>
				<%
					while not rsb.eof
				%>
					<li>
					<a href="product.asp?dlm=<%=rsa("id_lm")%>&zlm=<%=rsb("id_lm")%>"><%=rsb("title_lm_es")%></a>
					</li>
				<%
					rsb.movenext
					wend
				%>
                </ul>
                </li>
			<%else%>
            	<li><img src="images/product1_fenl_tu.jpg" width="7" height="7" />
                   <a href="product.asp?dlm=<%=rsa("id_lm")%>"><%=rsa("title_lm_es")%></a>
                </li>
			<%
				end if
				rsb.close
				set rsb=nothing
				'二级结束
			%>
		
		<%
			rsa.movenext
			wend
			rsa.close
			set rsa=nothing
			'一级结束
		%>
         </ul>
              
               </Td>
            </tr>
          </table>
            <script>
function initMenu() {
  /*隐藏所有#menu ul*/
  $('#menu ul').hide();
  /*类为cur的ul显示*/
  $('#menu ul.cur').show();
  /*所有的#menu li a点击*/
  $('#menu li a').click(
    function() {
	  /*被点击的a标签的下一个标签*/
      var checkElement = $(this).next();
      /*如果被点击的a标签的下一个标签是ul同时是可见的，则ul标签收回*/
	  if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
        checkElement.slideUp('normal');
        }
	  /*如果被点击的a标签的下一个标签是ul同时是不可见的，则所有已显示的标签收回，ul标签展开*/
      if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
        $('#menu ul:visible').slideUp('normal');
        checkElement.slideDown('normal');
        return false;
        }
      }
    );
  }
$(document).ready(function() {initMenu();});
</script>