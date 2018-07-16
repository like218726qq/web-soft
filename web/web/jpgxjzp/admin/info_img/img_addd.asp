<!--#include file="../inc.asp"-->
<!--#include file="../upfile_class.asp"-->
<!--#include file="img_con.asp"-->
<%
Server.ScriptTimeOut =720000

'实例对象
Set oUpload = New upfile_class

oUpload.GetData(maxsize*1024)

'判断上传大小
If oUpload.Err > 0 Then
	Select Case oUpload.Err
	Case 1
		call msg("请选择有效的上传文件","")
	Case 2
		call msg("你上传的文件总大小超出了最大限制（" & maxsize & "KB）","")
	End Select
End If

info_id=oUpload.Form("info_id")
if info_id<>"" and not checknum(info_id) then
	info_id=""
end if

Set oFile = oUpload.File("file_up")
sFileExt = LCase(oFile.FileExt)

'判断扩展名
Call CheckValidExt(sFileExt)

'文件夹
call createfod("../../"&path)

'创建文件名
Randomize
sRnd=Int(900*Rnd)+100
sSaveFileName=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&sRnd&"."&sFileExt
if s_pic="yes" then
	oFile.SaveToFile Server.Mappath("../../"&path&"/d"& sSaveFileName)
else
	oFile.SaveToFile Server.Mappath("../../"&path&"/"& sSaveFileName)
end if

Set oFile = Nothing
Set oUpload = Nothing

'开始生成缩略图
if s_pic="yes" then
	fileurl="../../"&path&"/d"& sSaveFileName
	xfileurl="../../"&path&"/"& sSaveFileName
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

'如有info_id等于空，就创建一个临时id保存再session里
if info_id="" or not checknum(info_id) then
	Randomize
	if session("info_id")="" or not checknum(session("info_id")) then
		sRnd=Int(900*Rnd)+100
		session("info_id")=hour(now)&minute(now)&second(now)&sRnd
		pr_id=session("info_id")
	else
		pr_id=session("info_id")
	end if
else
	pr_id=info_id
end if

'保存到数据库
openconn
conn.execute("insert into pro_img (info_id,img_sl)values("&pr_id&",'"&path&"/"&sSaveFileName&"')")

call msg("","location='img_add.asp?info_id="&info_id&"'")


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
		call msg("\n\n请选择一个有效的文件，\n支持的格式有（"+AllowExt+"）","")
		Response.End
	End If
End Sub
%>