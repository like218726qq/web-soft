<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>加水印</title>
</head>

<body>
<%
'asp 给图片加水印代码
'On Error Resume Next '(打开错误处理功能)  

Set Jpeg1 = Server.CreateObject("Persits.Jpeg")
Set Jpeg2 = Server.CreateObject("Persits.Jpeg")
Jpeg1.Open Server.MapPath("2.jpg")
Jpeg2.Open Server.MapPath("1.gif")

'Jpeg1.Open PhotoPath   

Jpeg1.Interpolation=1   

Jpeg1.Quality=100   

iWidth=Jpeg1.OriginalWidth 
iHeight=Jpeg1.OriginalHeight

iiWidth=Jpeg2.OriginalWidth 
iiHeight=Jpeg2.OriginalHeight

iX=iWidth / 2
iY=iHeight / 2

iiX=iiWidth / 2
iiY=iiHeight / 2

iiiX=iX-iiX
iiiY=iY-iiY

response.write iiiX
response.write iiiY
'response.End
Jpeg1.Canvas.DrawImage iiiX, iiiY, Jpeg2 ' optional arguments omitted
jpeg1.save Server.mappath("123.jpg")
On Error GoTo 0 '(关闭错误处理功能).
%>
</body>
</html>
