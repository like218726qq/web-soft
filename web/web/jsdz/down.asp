<% 
if Request("Filename")="" then
 response.write "<h1>错误:</h1>文件名为空!<p>"
else
call  downloadFile(Request("Filename"))    
 
Function  downloadFile(strFile)    
strFilename  =  server.MapPath(strFile)    
Response.Buffer  =  True    
Response.Clear    
Set  s  =  Server.CreateObject("ADODB.Stream")
s.Open    
s.Type  =  1    
on  error  resume  next    
Set  fso  =  Server.CreateObject("Scripting.FileSystemObject")    
if  not  fso.FileExists(strFilename)  then    
Response.Write("<h1>错误:</h1>"&strFilename&" 该文件未找到!<p>")    
Response.End    
end  if 
Set  f  =  fso.GetFile(strFilename)    
intFilelength  =  f.size    
 
s.LoadFromFile(strFilename)    
if  err  then  
Response.Write("<h1>错误: </h1>未知网络错误!<p>")    
Response.End 
end  if 

'  send  the  headers  to  the  users  Browse
Response.AddHeader  "Content-Disposition","attachment;  filename="&f.name    
Response.AddHeader  "Content-Length",intFilelength    
Response.CharSet  =  "UTF-8"    
Response.ContentType  =  "application/octet-stream"  
Response.BinaryWrite  s.Read    
Response.Flush     
s.Close    
Set  s  =  Nothing 

End  Function    
end if
%> 
