<style>
.table{ width:90%; overflow:hidden; margin:0px auto;}
.line{ border-bottom:1px dotted #dcdcdc; margin-bottom:10px;}
.title{ font-size:15px; height:32px; line-height:32px; font-weight:bold; text-align:left;}
.min_width{min-width:300px;_width:expression(document.body.clientWidth < 300 ? "300px" : "auto");}
.max_width{max-width:600px;_width:expression(document.body.clientWidth > 600 ? "600px" : "auto");}
.min_height{min-height:200px;_height:expression(this.scrollHeight < 200 ? "200px" : "auto");}
.max_height{max-height:400px;_height:expression(this.scrollHeight > 400 ? "400px" : "auto");}
.min_and_max_width{min-width:300px;max-width:600px;
_width: expression(  document.body.clientWidth < 300 ? "300px" :
( document.body.clientWidth > 600 ? "600px" : "auto"));}
.min_and_max_height{min-height:200px;max-height:400px;
_height: expression(  this.scrollHeight < 200 ? "200px" :
( this.scrollHeight > 400 ? "400px" : "auto"));}  
.title2{background:url(images/listlihover.jpg) no-repeat; height:28px; line-height:28px; text-indent:10px; font-weight:bold;}
</style>
<%

%>
<table class="table">
	<tr><td align="left"><div class="title2"><%=title%></div></td></tr>
	<tr><td align="right"><div class="line"><%=wtime%></div></td></tr>
    <tr><td align="left" height="300">
    <div>
    <link rel="stylesheet" href="../js/MagicZoom.css" type="text/css"/>
    <script type="text/javascript" src="../js/mz-packed.js"></script>
    <a href="../<%=img_sld%>" class="MagicZoom"
    rel="zoom-width:300px; zoom-height:300px; zoom-position: right;">          
     <img src="../<%=img_sld%>" id="bigimg2" style="width:400px;height:350px;"/>
    </a>
    <img src="../<%=img_sld%>" id="bigimg3"   class="MagicZoomLoading max_width" alt="Loading Zoom, please wait"/>
    </div>
    </td></tr>
    <tr><td align="left"><div>详细介绍:</div></td></tr>
    <tr><td align="left"><div style="padding:20px 10px;"><%=z_body%></div><br/></td></tr>
    <tr><td align="left"><div>
        <%if pre_id<>"" then%><a href=""></a>&nbsp;<a href="?id=<%=pre_id%>">上一篇:<%=pre_title%></a><%end if%>
        <%if next_id<>"" then%><br /><a href=""></a>&nbsp;<a href="?id=<%=next_id%>">下一篇:<%=next_title%></a><%end if%>
    </div></td></tr>
    <tr><td align="right"><div>[ <a href="products.asp">产品展示</a> ]&nbsp;&nbsp;[ <a href="javascript:history.go(-1)">返回</a> ]</div></td></tr>
    
</table>