<!-- 
//等比缩放 
function ImgUniformZoom(ImgD,ImgWidth,ImgHeight){ 
var image=new Image(); 
image.src=ImgD.src; 
if(image.width>0 && image.height>0){ 
   if(image.width/image.height>= ImgWidth/ImgHeight){ 
if(image.width>ImgWidth){      
ImgD.width=ImgWidth; 
ImgD.height=(image.height*ImgWidth)/image.width; 
}else{ 
ImgD.width=image.width;      
ImgD.height=image.height; 
} 
ImgD.alt=image.width+"×"+image.height; 
} 
   else{ 
if(image.height>ImgHeight){      
ImgD.height=ImgHeight; 
ImgD.width=(image.width*ImgHeight)/image.height;            
}else{ 
ImgD.width=image.width;      
ImgD.height=image.height; 
} 
ImgD.alt=image.width+"×"+image.height; 
} 
   } 
} 
//自由缩放
function ImgFreeZoom(ImgD,ImgWidth,ImgHeight)  

{   
var max_height = ImgHeight; //设置最大高度   
var max_width = ImgWidth;   //设置最大宽度 
   
var image=new Image(); 
image.src=ImgD.src; 
     
if(image.height>max_height)   
{   
    ImgD.height = max_height;   
}   
if(image.width>max_width)   
{   
    ImgD.width = max_width;   
}   
}   
//--> 