<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
<!-- 
/* jQuery jcImgScroll css */
.jcImgScroll { position:relative; height:110px;  }
.jcImgScroll li { border:1px solid #ccc; }
.jcImgScroll li a { background:#fff; display:block; height:110px;  }
.jcImgScroll li.loading a { background:#fff url(img/loading.gif) no-repeat center center;} 
.jcImgScroll li img,.jcImgScroll li,.jcImgScroll em,.jcImgScroll dl { display:none; border:0 none;}
.jcImgScroll em.sPrev { background:url(images/left.jpg) no-repeat left center; }
.jcImgScroll em.sNext { background:url(images/right.jpg) no-repeat right center;}
.jcImgScroll dl dd { background:url(images/NumBtn.png) no-repeat 0 bottom; text-indent:-9em; }
.jcImgScroll dl dd:hover,.jcImgScroll dl dd.curr { background-position:0 0; }
-->
</style>

<script src="js/jQuery-1.7.1.js" language="javascript" type="text/javascript"></script>
<script src="js/jQuery-easing.js" language="javascript" type="text/javascript"></script>
<script src="js/jQuery-jcImgScroll.js" language="javascript" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
<!-- 
$(function(){
	$("#demo1").jcImgScroll({
		
	});
	$("#demo2").jcImgScroll({
		count : 7
	});
	$("#demo3").jcImgScroll({
		arrow : {
			width:110,	
			height:110,
			x:220,
			y:0
		},
		count : 3,
		offsetX : 140,
		NumBtn : true,
		title:false
	});
});
-->
</script>

<div id="demo1" class="jcImgScroll">
            <ul>
            <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,img_sl from pro_co where tuijian='yes' order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>

                <li style="border:1px #CCC solid;"><a href="product_show.asp?id=<%=rs("id")%>"  path="<%=rs("img_sl")%>"></a></li>
<%
    rs.movenext
	wend
	rs.close
	set rs=nothing
%>
            </ul>
</div>