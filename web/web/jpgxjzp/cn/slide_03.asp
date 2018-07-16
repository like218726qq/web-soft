<!--include file="../html.conn.asp"-->
<%getduotu(request.QueryString("id"))%>
<% function getduotu(id)%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="slide_03/css/MagicZoom.css" type="text/css"/>
<script type="text/javascript" src="slide_03/scripts/mz-packed.js"></script>
<style>
ul,li{ margin:0px; padding:0px; list-style:none;}
.pic_list{width:350px; margin:5px auto 0;}
.pic_list li{ float:left; margin-right:6px;}
.pic_list li img{ background-color:#ccc; display:block; padding:2px;}
.pic_list li.cur img{ background-color:#FF6600;padding:2px;}
.#ddimg tr td img{ 11width:350px; overflow:hidden;}
</style>
<div style="width:350px; border:1px solid #dcdcdc;">
<table border="0" cellpadding="0" cellspacing="0" align="center" id="ddimg" >
    <tr>
    <td width="350" height="220" id="zoom" align="center" ></td>
    </tr>
</table>

<table id="pic_img" class="pic_list" style="border-top:1px solid #dcdcdc;" >
<tr>
<%
inint_img=""
inint_imgd=""
'id=454
set rs = server.createobject("adodb.recordset")
  sql="select  top 4 * from pro_img where pro_id="&id&" order by id desc"
  rs.open sql,conn,1,1
  if not  rs.eof then
  a=0
  inint_img=rs("img_sl")
  inint_imgd=getbpic(inint_img,"d")
	while not rs.eof
	img_sl=rs("img_sl")
	img_sld=getbpic(img_sl,"d")
	%>
    <td style="border-left:1px solid #dcdcdc; text-align:center; vertical-align:middle;">
    <img src="../<%=img_sl%>" width="79" style="cursor:pointer;" onClick="get_zoom(0,'<%=img_sl%>','<%=img_sld%>')" >
    </td>
    <%
	rs.movenext
	a=a+1
	wend
  end if
  rs.close
  set rs=nothing
%>
</tr>
</table>
</div>
<script>
	function get_zoom(n,zimg,dimg,title){
		tli=document.getElementById("pic_img").getElementsByTagName("td");
		for(i=0;i<tli.length;i++){
			if (i==n){
				tli[i].className="cur";	
			}else{
				tli[i].className="";
			}
		}
		
		MagicZoom_stopZooms();
		_el('zoom').innerHTML = '<a href="../'+dimg+'" id="zoom1" rel="zoom-position: right; zoom-width:600px; zoom-height:600px;" class="MagicZoom"><img id="image_m" src="../'+dimg+'" width=350 height=250/></a><img class="MagicZoomLoading" src="slide_03/images/ajax-loader.gif" alt="Loading Zoom, please wait"/>';
		setTimeout('MagicZoom_findZooms()', 100);
	}
	get_zoom(0,'<%=inint_img%>','<%=inint_imgd%>');
</script>
<%
end function
%>