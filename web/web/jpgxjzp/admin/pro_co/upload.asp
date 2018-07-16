<!--#include file="../inc.asp"-->
<!--#include file="../upfile_class.asp"-->
<!--#include file="upcon.asp"-->
<!--#include file="../admin_include/img.asp"-->
<%
Server.ScriptTimeOut =720000
'检查登录
checklogin

frameid=request("frameid")
kuang=request("kuang")

Set oUpload = New upfile_class
' 取得上传数据,限制最大上传
oUpload.GetData(maxsize*1024)

If oUpload.Err > 0 Then
	Select Case oUpload.Err
	Case 1
		call msg("请选择有效的上传文件","location='up.asp?frameid="&frameid&"&kuang="&kuang&"'")
	Case 2
		call msg("你上传的文件总大小超出了最大限制（" & maxsize & "KB）","location='up.asp?frameid="&frameid&"&kuang="&kuang&"'")
	End Select
End If

Set oFile = oUpload.File("file_up")
sFileExt = LCase(oFile.FileExt)
sSourceFileName = oFile.FileName
Call CheckValidExt(sFileExt)
call createfod("../../"&path)
Dim sRnd
Randomize
sRnd = Int(900 * Rnd) + 100
sSaveFileName = year(now) & month(now) & day(now) & hour(now) & minute(now) & second(now) & sRnd & "." & sFileExt
if s_pic="yes" then
	oFile.SaveToFile Server.Mappath("../../"&path&"/d"& sSaveFileName)
else
	oFile.SaveToFile Server.Mappath("../../"&path&"/"& sSaveFileName)
end if
Set oFile = Nothing
Set oUpload = Nothing
fileurl="../../"&path&"/d"& sSaveFileName
fileurlb="../../"&path&"/b"& sSaveFileName
xfileurl="../../"&path&"/"& sSaveFileName
'加水印
if s_mark_txt="yes" then  
	call watermark_txt(fileurl,mark_txt) 
end if
'开始生成缩略图
call img_sl(s_pic,s_typ,s_wid,s_hei,xfileurl,fileurl)
call img_sl(s_pic,s_typ,189,142,fileurlb,fileurl)
response.write"<script>parent.document.getElementById("""&kuang&""").value='"&path&"/"&sSaveFileName&"';</script>"
response.write"<script>location='uploadd.asp?frameid="&frameid&"&kuang="&kuang&"&img_sl="&path&"/"&sSaveFileName&"'</script>"
response.End()



' 检测扩展名的有效性
Sub CheckValidExt(sExt)
	Dim b, i, aExt
	b = False
	aExt = Split(AllowExt, "|")
	For i = 0 To UBound(aExt)
		If LCase(aExt(i)) = sExt Then
			b = True
			Exit For
		End If
	Next
	If b = False Then
		call msg("\n\n请选择一个有效的文件，\n支持的格式有（"+AllowExt+"）","location='up.asp?frameid="&frameid&"&kuang="&kuang&"'")
		Response.End
	End If
End Sub
%>