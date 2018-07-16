<%
'上传文件保存目录,默认是保存到后台的上一级目录upfile文件夹里
path="upimg"

'允许上传的文件格式
AllowExt="gif|jpg|jpeg|bmp|png"

'允许上传的文件格式
maxsize=600

'yes生成缩略图,no不生成
s_pic="yes"
'当缩略图开启后，yes固定缩略图宽度和高度，不超过下面的宽度和高度等比例缩小
s_typ="no"
s_wid=120
s_hei=120
%>