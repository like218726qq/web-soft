<link rel="stylesheet" type="text/css" href="css/css.css">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="images/top_beij.jpg">
  <tr>
    <td align="center"><table width="1006" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="25">&nbsp;</td>
        <td width="84"><img src="images/logo.jpg" width="84" height="77" /></td>
        <td width="485"><img src="images/biao.jpg" width="485" height="77" /></td>
        <td align="right"><table width="186" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" align="right" style="padding-right:10px;">
                       <span class="yinw"><a href="http://www.sf-silicone.com">english</a></span> | 
              <span class="yinw"><a href="http://www.sf-silicone.com/es">español</a> </span>| 
              <span class="yinw"><a href="http://www.sf-silicone.com/ja">日本語</a></span>
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><table width="159" border="0" cellspacing="0" cellpadding="0">
                  <tr><form id="form1" name="form1" method="post" action="product.asp">
                    <td width="136" background="images/sous_s.jpg">
                    <input id="keyword" name="keyword" 
                  ></td>
                    <td width="23">
                        <label for="imageField"></label>
                        <input type="image" name="imageField" id="imageField" src="images/sous_an.jpg" />
                   </td> </form>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="background:#45AD34;">
  <tr>
    <td align="center" height="51" valign="bottom">
    <table width="1006" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td style=" width:978px; height:51px;">
        <ul id="nav">
    <li><a href="index.asp" class="a1"></a></li>
    <li class="b2"><a href="product.asp?dlm=11" class="a2"></a>
        <ul>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select top 7 id_lm,title_lm_es from pro_lm where fid=11 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li ><a href="product.asp?dlm=11&zlm=<%=rs("id_lm")%>"><%=rs("title_lm_es")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
        </ul>
    </li>
    <li class="b3"><a href="product.asp?dlm=22" class="a3"></a>
        <ul>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_es from pro_lm where fid=22 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="product.asp?dlm=22&zlm=<%=rs("id_lm")%>"><%=rs("title_lm_es")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
        </ul>
    </li>
    <li class="b4"><a href="product.asp?dlm=31" class="a4"></a>
        <ul>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_es from pro_lm where fid=31 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="product.asp?dlm=31&zlm=<%=rs("id_lm")%>"><%=rs("title_lm_es")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
        </ul>
    </li>
    <li class="b5"><a href="product.asp?dlm=37" class="a5"></a>
    <ul>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_es from pro_lm where fid=37 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="product.asp?dlm=37&zlm=<%=rs("id_lm")%>"><%=rs("title_lm_es")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
    </ul>
    </li>
    <li class="b6"><a href="product.asp?dlm=41" class="a6"></a>
    <ul>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_es from pro_lm where fid=41 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="product.asp?dlm=41&zlm=<%=rs("id_lm")%>"><%=rs("title_lm_es")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
    </ul>
    </li>
    <li class="b7"><a href="product.asp?dlm=44" class="a7"></a>
    <ul>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_es from pro_lm where fid=44 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="product.asp?dlm=44&zlm=<%=rs("id_lm")%>"><%=rs("title_lm_es")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
    </ul>
    </li>
    <li class="b8"><a href="product.asp?dlm=49" class="a8"></a>
    <ul>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_es from pro_lm where fid=49 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="product.asp?dlm=49&zlm=<%=rs("id_lm")%>"><%=rs("title_lm_es")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
    </ul>
    </li>
        <li class="b9"><a href="product.asp?dlm=52" class="a9"></a>
    <ul>
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_es from pro_lm where fid=52 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="product.asp?dlm=52&zlm=<%=rs("id_lm")%>"><%=rs("title_lm_es")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
    </ul>
    </li>
    <div class="clear"></div>
</ul> 
<script type=text/javascript>
<!--
function menuFix() {
    var sfEls = document.getElementById("nav").getElementsByTagName("li");
    for (var i=0; i<sfEls.length; i++) {
        sfEls[i].onmouseover=function() {
        this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        sfEls[i].onMouseDown=function() {
        this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        sfEls[i].onMouseUp=function() {
        this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        sfEls[i].onmouseout=function() {
        this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), 
"");
        }
    }
}
menuFix();
//-->
  </script>
        </td>
        <td width="38">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="images/nav_di.jpg">
  <tr>
    <td height="31">&nbsp;</td>
  </tr>
</table>