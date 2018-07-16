
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="slide02/css/style.css" rel="Stylesheet" type="text/css" />
<script src="slide02/scripts/jscript.js" type="text/javascript" language="javascript"></script>
    <div id="imageFlow">
        <div class="bank">
        <%
	set rs = server.createobject("adodb.recordset")
	  sql="select top 20 * from pro_img where 1=1 order by id desc"
	  rs.open sql,conn,1,1
	  a=1
	  if not  rs.eof then
		while not rs.eof
		%>
        <a rel="../<%=getbpic(rs("img_sl"),"d")%>" title=""></a> 
	  	<%
		a=a+1
		rs.movenext
		wend
	  end if
	  rs.close
	  set rs=nothing
		%>
        </div>
        <div class="text">
            <div class="title">Loading</div>
            <div class="legend">Please wait...</div>
        </div>
        <div class="scrollbar">
            <img class="track" src="slide02/images/sb.gif" alt="" />
            <img class="arrow-left" src="slide02/images/sl.gif" alt="" />
            <img class="arrow-right" src="slide02/images/sr.gif" alt="" />
            <img class="bar" src="slide02/images/sc.gif" alt="" />        </div>
    </div>
