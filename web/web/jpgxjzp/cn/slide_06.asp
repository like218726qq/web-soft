<!--include file="../html.conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="../js/jquery-1.6.min.js"></script>
<script>
$(document).ready(function(){index_new_hot();});
function index_new_hot(){
	function upanimate(){
	$(".index_news_hot").animate({"margin-top":-25},2000,function(){
		$(".index_news_hot").css("margin-top","0px");
		$(".index_news_hot").find("div:first").appendTo($(".index_news_hot"));
		});
	}
	var timeid=window.setInterval(upanimate,3000);	
   $(".index_news_hot").hover(
	   function(){
		   window.clearInterval(timeid);
		   },
	   function(){
		   timeid=window.setInterval(upanimate,3000);	
		   }
	   );
}	
</script>
<style>
.index_news_hot div{ height:25px; line-height:25px; overflow:hidden;}
</style>
<div style="height:25px; line-height:25px; overflow:hidden;">
	<div class="index_news_hot">
    <%call index_info_tuijian("50,41,42",20,"news_show.asp")%>
    </div>
</div>