<!--#include file="../inc.asp"-->
<!--#include file="../upfile_class.asp"-->
<!--#include file="upcon.asp"-->
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
	
	filepath=server.MapPath(fileurl)
	Set Jpeg = Server.CreateObject("Persits.Jpeg")
	Jpeg.Open filepath
	aa=Jpeg.Binary '将原始数据赋给aa
	
	'=========加文字水印================= 
	Jpeg.Canvas.Font.Color = &Hfffffff '水印文字颜色 
	Jpeg.Canvas.Font.Family = Arial '字体 
	Jpeg.Canvas.Font.Bold = True '是否加粗 
	Jpeg.Canvas.Font.Size = 40 '字体大小 
	Jpeg.Canvas.Font.ShadowColor = &H000000 '阴影色彩 
	Jpeg.Canvas.Font.ShadowYOffset = 1 
	Jpeg.Canvas.Font.ShadowXOffset = 1 
	Jpeg.Canvas.Brush.Solid = True 
	Jpeg.Canvas.Font.Quality = 4 '输出质量 
	Jpeg.Canvas.PrintText Jpeg.OriginalWidth/2-180,Jpeg.OriginalHeight/2-44,"www.torchliteco.com" '水印位置及文字
	
	bb=Jpeg.Binary '将文字水印处理后的值赋给bb，这时，文字水印没有不透明度
	
	'============调整文字透明度================ 
	Set MyJpeg = Server.CreateObject("Persits.Jpeg") 
	MyJpeg.OpenBinary aa 
	Set Logo = Server.CreateObject("Persits.Jpeg") 
	Logo.OpenBinary bb 
	MyJpeg.DrawImage 0,0, Logo, 0.4 '0.3是透明度 
	cc=MyJpeg.Binary '将最终结果赋值给cc,这时也能生成目标图片了 
	'response.BinaryWrite cc '将二进输出给浏览器 
	MyJpeg.Quality=100
	MyJpeg.Save Server.MapPath(fileurl)
	set aa=nothing 
	set bb=nothing 
	set cc=nothing 
	set MyJpeg=nothing
	set Logo=nothing
	set jpeg=nothing
	
end if



response.write"<script>parent.document.getElementById("""&kuang&""").value='"&path&"/"&sSaveFileName&"';</script>"
response.write"<script>location='uploadd.asp?frameid="&frameid&"&kuang="&kuang&"&img_sl="&path&"/"&sSaveFileName&"'</script>"
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
		call msg("\n\n请选择一个有效的文件，\n支持的格式有（"+AllowExt+"）","location='up.asp?frameid="&frameid&"&kuang="&kuang&"'")
		Response.End
	End If
End Sub
%>