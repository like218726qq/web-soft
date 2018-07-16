<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
ul,li{ margin:0px; padding:0px; list-style:none;}
a { color:#666; font-size:12px;}
#limrq{ width:890px; }
#limrq li{ float:left; width:400px; margin-right:20px;}
</style>

<ul id="limrq" style="overflow:hidden;height:30px;line-height:30px;">
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_co where lm=3 and pass='yes' order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>

<LI>
    <table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="296"><A href="news_show.asp?id=<%=rs("id")%>"><%=rs("title")%></A></td>
    <td width="104"><span style="color:#747474"><%=formatdate(rs("wtime"))%></span></td>
  </tr>
</table>
</LI> 
    <%
    rs.movenext
	wend
	rs.close
	set rs=nothing
%>
</ul>
<script type="text/javascript">
var mrqInterval=new Object;
var mrqn;
var limrq=document.getElementById("limrq");
var lml=limrq.getElementsByTagName("li").length;
function liMarquee(){
	limrq.scrollTop++;
	if(limrq.scrollTop%30==0){
		clearInterval(mrqInterval[0]);
		}
	}
function nxtmrq(){
	if(mrqn<lml){
		mrqInterval[0]=window.setInterval("liMarquee()",20);
		mrqn++;
		}
	else{
		limrq.scrollTop=0;
		mrqn=0;
		nxtmrq();
		}
	}
function intimrq(){
	limrq.scrollTop=0;
	mrqn=0;
	mrqInterval[1]="";
	clearInterval(mrqInterval[1]);
	mrqInterval[1]=window.setInterval("nxtmrq()",3000);
	}
limrq.innerHTML+="<li>"+limrq.getElementsByTagName("li")[0].innerHTML+"</li>";
limrq.onmouseover=function(){
	clearInterval(mrqInterval[1]);
	}
limrq.onmouseout=function(){
	mrqInterval[1]=window.setInterval("nxtmrq()",5000);
	}
window.onload=intimrq;
</script>