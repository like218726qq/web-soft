<!--#include file="../admin/inc.asp"-->
<%
'连接数据库
opconn

'英文版分页
	sub listpage_en(key)
		listp=listp&"<TABLE cellSpacing=0 cellPadding=0  align=center border=0 style='color:#666666' ><TR>"&chr(10)
		listp=listp&"<TR>"&chr(10)
		listp=listp&"<TD >First<font color='#ff0000'>"&pageno&"</font>Page|Common<font color='#ff0000'>"&pagezong&"</font>Page|<font color='#ff0000'>"&pagenum&"</font>Item/Page|Common<font color='#ff0000'>"&counter&"</font>Item</td>"&chr(10)
		listp=listp&"<td width='100'>&nbsp;</td>"&chr(10)
		listp=listp&"<td>"
		if pageno=1 then
		listp=listp&"[Home][Previous]&nbsp;"
		else
		listp=listp&"[<a href='?page=1"&key&"'>Home</a>][<a href='?page="&pageno-1&key&"'>Previous</a>]&nbsp;"       
		end if
		if cint(pageno)=cint(pagezong) then
		listp=listp&"[Next][Last]"
		else
		listp=listp&"[<a href='?page="&pageno+1&key&"'>Next</a>][<a href='?page="&pagezong&key&"'>Last</a>]"        
		end if 
		listp=listp&"</td>"&chr(10)
		listp=listp&"<td width='10'></td>"&chr(10)
		listp=listp&"<td><input type='text' name='pagee' id='pagee' maxlength='6' style='width:35px;BORDER: #aacbe1 1px solid; font-size:12px;' value='"&pageno&"'></td><td width='5'></td>"&chr(10)
		listp=listp&"<td ><input type='button' name='buttonn' value='Go to' onclick=""location='?page='+document.getElementById('pagee').value+'"&key&"'"" style='BORDER: #aacbe1 1px solid; font-size:12px;'></td>"&chr(10)
		listp=listp&"</tr>"&chr(10)
		listp=listp&"</table>"&chr(10)
		response.write listp
	end sub
%>