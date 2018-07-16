<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
'call watermark_txt("2.jpg","合优网络")
function watermark_txt(imgname,txt)
On Error Resume Next
 Dim Jpeg,MyJpeg,TempA,TempB,TempC
 Set Jpeg = Server.CreateObject("Persits.Jpeg") 
 Jpeg.Open server.mappath(imgname) 
 TempA = Jpeg.Binary '将原始数据赋给TempA
 Jpeg.Canvas.Font.Color = &Hfffffff 
 Jpeg.Canvas.Font.Family = "宋体"  
 Jpeg.Canvas.Font.Bold = True 
 Jpeg.Canvas.Font.Size = 35 
	Jpeg.Canvas.Font.ShadowColor = &H000000 '阴影色彩 
	Jpeg.Canvas.Font.ShadowYOffset = 1 
	Jpeg.Canvas.Font.ShadowXOffset = 1 
	Jpeg.Canvas.Brush.Solid = True 
 Jpeg.Canvas.Font.Quality = 4 
 'Jpeg.Canvas.Print Jpeg.OriginalWidth-60,Jpeg.OriginalHeight-30, txt 
 Jpeg.Canvas.PrintText Jpeg.OriginalWidth/2-165,Jpeg.OriginalHeight/2-30,txt 
 TempB = Jpeg.Binary
 Set MyJpeg = Server.CreateObject("Persits.Jpeg")
 MyJpeg.OpenBinary TempA
 Set Logo = Server.CreateObject("Persits.Jpeg")
 Logo.OpenBinary TempB
 MyJpeg.DrawImage 0,0,Logo,0.8  
 TempC = MyJpeg.Binary    
 MyJpeg.Save server.mappath(imgname)  
 
 set TempA=nothing
 set TempB=nothing
 set TempC=nothing
 Jpeg.close
 Set Jpeg = Nothing
 MyJpeg.Close
 Logo.Close
 On Error GoTo 0
 end function
 
function img_sl(s_pic,s_typ,s_wid,s_hei,xfileurl,fileurl)'生成缩略图
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
end function
'建立文件夹
sub createfod(fname)
	set ffso=server.CreateObject("scripting.filesystemobject")
	folderpath=server.mapPath(fname)
	if not ffso.Folderexists(folderpath) then
	   ffso.Createfolder(folderpath)
	end if
	set ffso=nothing
end sub
%>
