
<div class="news">
	<table style=" width:99%;">
    <tr>
    <td style="font-weight:bold; color:#000; line-height:30px; width:80px;" valign="top">&nbsp;&nbsp;新闻快递:&nbsp;&nbsp;</td>
    <td valign="top" style="line-height:30px; text-align:left;" class="index_news_hot">
    <div class="div">
    <%
	set rs = server.createobject("adodb.recordset")
	  sql="select top 20 * from info_co where (lm in( select id_lm from info_lm where fid=13 ) or lm=13) and pass='yes' and ( tuijian='yes' or hot='yes' ) order by px desc,id desc "
	  rs.open sql,conn,1,1
	  if not  rs.eof then
	  while not rs.eof
	  id=rs("id")
	  title=rs("title")
		%>
        <div style=" text-align:left;"><a href="news_show.asp?id=<%=id%>"><span style="float:none;"><%=title%></span></a></div>
        <%
	  rs.movenext
	  wend	
	  end if
	  rs.close
	  set rs=nothing
	%>
      </div>
    </td>
    <td valign="top" style="width:300px;">
    <ul class="ser" style="float:right;">
    	<li>
        <form action="products.asp" method="post">
        <input name="keyword" type="text" class="ser_txt" />
        <input name=""  type="submit" class="ser_btn" value="" />
        </form>
        </li>
    </ul>
    </td>
    </tr></table>
</div>
<script>
$(document).ready(function(e) {
	index_new_hots();
    function index_new_hots(){
	function upanimate(){
	$(".index_news_hot .div").animate({"margin-top":-33},2000,function(){
		$(".index_news_hot .div").css("margin-top","0px");
		$(".index_news_hot .div").find("div:first").appendTo($(".index_news_hot .div"));
		});
	}
	var timeid=window.setInterval(upanimate,3000);	
   $(".index_news_hot .div").hover(
	   function(){
		   window.clearInterval(timeid);
		   },
	   function(){
		   timeid=window.setInterval(upanimate,3000);	
		   }
	   );
	}
});
</script>