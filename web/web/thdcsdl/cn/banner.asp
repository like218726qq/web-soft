<DIV align=left>
<TABLE cellSpacing=0 cellPadding=0 align=center  border=0>
<TBODY>
<TR>
  <TD class=border01 align=middle>
    <DIV id=demo_gd style="overflow:hidden; width:640px;margin-left: 0px;">
      <TABLE  cellSpacing=0 cellPadding=0 align=center border=0 cellspace="0">
        <TBODY>
          <TR>
            <TD id=marquePic1_gd vAlign=top align=middle >
              <TABLE  cellSpacing=1 cellPadding=0  border=0>
                <TBODY>
                  <TR align=middle>
				  <td>
<table  border="0" align="center" cellpadding="0" cellspacing="0">

			  <tr>
				<%
			set rs=server.CreateObject("adodb.recordset")
			rs.open "select top 15 * from pro_co where tuijian='yes' order by px desc,id desc",conn,1,3
			
			if rs.eof or rs.bof then
			Response.Write("暂无产品")
			end if
			do while not rs.eof
		%>
		                   
                      <td align="left" >
					  <table><tr><td class="pro_2">
			<a href="disanli.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" width="109" height="107" border="0"></a>
			</td></tr>
			  <tr><td align="center"><a href="disanli.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td></tr>
			</table>
			</td>
			
			 <% 
			 
			  rs.movenext
			loop
			rs.close
			set rs=nothing
		%>
			  </tr>
			
			
            </table></td>
                  </TR>
                </TBODY>
              </TABLE>
            </TD>
            <TD id=marquePic2_gd vAlign=top></TD>
          </TR>
        </TBODY>
      </TABLE>
    </DIV>
  </TD>
</TR>
</TBODY>
</TABLE>

<SCRIPT language=Javascript>
<!--
var speed_gd=30;
var FGDemo_gd=document.getElementById('demo_gd');
var FGDemo1_gd=document.getElementById('marquePic1_gd');
var FGDemo2_gd=document.getElementById('marquePic2_gd');
FGDemo2_gd.innerHTML=FGDemo1_gd.innerHTML;
function Marquee1_gd(){
if(FGDemo_gd.scrollLeft>=FGDemo1_gd.scrollWidth){
FGDemo_gd.scrollLeft=0;
}else{
FGDemo_gd.scrollLeft++;
}
}
var MyMar1_gd=setInterval(Marquee1_gd,speed_gd)
FGDemo_gd.onmouseover=function() {clearInterval(MyMar1_gd)}
FGDemo_gd.onmouseout=function() {MyMar1_gd=setInterval(Marquee1_gd,speed_gd)
}
-->
</SCRIPT>
</DIV>


