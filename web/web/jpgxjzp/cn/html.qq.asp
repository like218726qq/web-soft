<style>
#QQFloat{Z-INDEX:100000;right:1px;padding-top:200px;VISIBILITY:visible;WIDTH:107px;POSITION:absolute;TOP:100px;HEIGHT:100px;}
.qq_t{ background:url(../js/qq/kefu_up.gif); width:107px; height:61px;}
.qq_c{ background:url(../js/qq/kefu_middle.gif); text-align:center; padding:8px 0px;}
.qq_c div{ height:25px; line-height:25px; overflow:hidden; width:100px; font-size:12px; color:#000;}
.qq_c div img{ vertical-align:middle;}
.qq_c div span{ vertical-align:middle; color:#000;}
.qq_e{ background:url(../js/qq/kefu_down.gif); width:107px; height:28px;}
</style>
<div id="QQFloat">
    <div class="qq_t"></div>
    <div class="qq_c">
    <%
	set rs = server.createobject("adodb.recordset")
	  sql="select  * from  ser_co order by px desc,id desc "
	  rs.open sql,conn,1,1
	  while not  rs.eof
	  
		if rs("lm")="qq" then
		%>
        <div>
        <a  href="tencent://message/?uin=<%=rs("haoma")%>&amp;Site=zskenbo.cn&amp;Menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=1:<%=rs("haoma")%>:4" /> <span>在线客服</span></a>
        </div>
        <%
		elseif rs("lm")="msn" then
		%>
        <div>
        <a  href="msnim:chat?contact=<%=rs("haoma")%>"><img border="0" src="../js/qq/005.gif"  /> <span>在线客服</span></a>
        </div>
        <%
		elseif rs("lm")="skype" then
		%>
        <div>
        <a href="callto://<%=rs("haoma")%>" target="_blank"><img src="../js/qq/c-10.gif"  border="0"/> <span>在线客服</span></a>
        </div>
        <%elseif rs("lm")="aliwangwang" then%>
		<div>
        <a target="_blank" href="http://amos.im.alisoft.com/msg.aw?v=2&uid=<%=rs("haoma")%>&site=cnalichn&s=4" >
        <img border="0" src="../js/qq/aliwangwang.gif" style="margin-left:-5px;"/><span>在线客服</span>
        </a>
        </div>
        <%
		end  if
	  rs.movenext	
	  wend
	  rs.close
	  set rs=nothing
	%>
    </div>
    <div class="qq_e"></div>
</div>
<script type="text/javascript">qq();</script>