<!--#include file="../inc.asp"-->
<!--#include file="../upfile_class.asp"-->
<!--#include file="upcon.asp"-->
<%
Server.ScriptTimeOut =720000
'检查登录
checklogin

frameid=request("frameid")
kuang=request("kuang")
s_pic=request("s_pic")
s_typ=request("s_typ")
s_wid=request("s_wid")
s_hei=request("s_hei")
if s_wid<>"" and isnumeric(s_wid) then
	s_wid=clng(s_wid)
end if
if s_hei<>"" and isnumeric(s_hei) then
	s_hei=clng(s_hei)
end if

Set oUpload = New upfile_class
' 取得上传数据,限制最大上传
oUpload.GetData(maxsize*1024)

If oUpload.Err > 0 Then
	Select Case oUpload.Err
	Case 1
		call msg("请选择有效的上传文件","location='up.asp?frameid="&frameid&"&kuang="&kuang&"&s_pic="&s_pic&"&s_typ="&s_typ&"&s_wid="&s_wid&"&s_hei="&s_hei&"'")
	Case 2
		call msg("你上传的文件总大小超出了最大限制（" & maxsize & "KB）","location='up.asp?frameid="&frameid&"&kuang="&kuang&"&s_pic="&s_pic&"&s_typ="&s_typ&"&s_wid="&s_wid&"&s_hei="&s_hei&"'")
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
xfileurl="../../"&path&"/"& sSaveFileName

'开始生成缩略图
if s_pic="yes" then
	Set Jpeg = Server.CreateObject("Persits.Jpeg")
	Jpeg.Open Server.Mappath(fileurl)
	wid=Jpeg.OriginalWidth
	hei=Jpeg.OriginalHeight
	'固定尺寸
	if s_typ="yes" then
		xwid=s_wid
		xhei=s_hei
	else
		if wid>hei then
			if wid>s_wid then
				xwid=s_wid
				xhei=hei*s_wid/wid
			else
				xwid=wid
				xhei=hei
			end if
			if xhei>s_hei then
				xwid=xwid*s_hei/xhei
				xhei=s_hei
			end if
		else
			if hei>s_hei then
				xhei=s_hei
				xwid=wid*s_hei/hei
			else
				xhei=hei
				xwid=wid
			end if
			if xwid>s_wid then
				xhei=xhei*s_wid/xwid
				xwid=s_wid
			end if
		end if
	end if
	Jpeg.Width=xwid
	Jpeg.Height=xhei
	Jpeg.Quality=100  
	Jpeg.Save Server.MapPath(xfileurl)
	set Jpeg=nothing
end if

response.write"<script>parent.document.getElementById("""&kuang&""").value='"&path&"/"&sSaveFileName&"';</script>"
response.write"<script>location='uploadd.asp?frameid="&frameid&"&kuang="&kuang&"&img_sl="&path&"/"&sSaveFileName&"&s_pic="&s_pic&"&s_typ="&s_typ&"&s_wid="&s_wid&"&s_hei="&s_hei&"'</script>"
response.End()

'建立文件夹
sub createfod(fname)
	set ffso=server.CreateObject("scripting.filesystemobject")
	folderpath=server.mapPath(fname)
	if not ffso.Folderexists(folderpath) then
	   ffso.Createfolder(folderpath)
	end if
	set ffso=nothing
end sub

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
		call msg("\n\n请选择一个有效的文件，\n支持的格式有（"+AllowExt+"）","location='up.asp?frameid="&frameid&"&kuang="&kuang&"&s_pic="&s_pic&"&s_typ="&s_typ&"&s_wid="&s_wid&"&s_hei="&s_hei&"'")
		Response.End
	End If
End Sub
%>