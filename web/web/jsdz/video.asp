<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
<style>
    br {clear:both;}
    .frame {
        width:600px;
        height:240px;
        overflow:hidden;
    }
    .frame .list {
        list-style:none;
        padding:0;
        margin:0;
        width:10000px;
    }
    .frame .list li {
        width:600px;
        height:240px;
        float:left;
    }
    .frame #big_list2 {
        height:10000px;
    }
    .frame #big_list2 li {
        clear:both;
    }
    .frame #big_list4 {
        height:10000px;
    }
    .frame #big_list4 li {
        clear:both;
    }
    
    .l_frame {
        width:920px;
        height:200px;
        overflow:hidden;
        float:left;
    }
    .l_frame .list {
        list-style:none;
        padding:0;
        margin:0;
        width:10000px;
    }
    .l_frame .list li {
        float:left;
        width:90px;
        height:140px;
        cursor:pointer;
    }
    .l_frame .list .cur {
    }
    .slide_nav {
        width:40px; 
		height:130px; 
        display:block;
        float:left;
    }
    .slide_nav2 {
        width:40px;
		height:158px; 
        display:block;
        background-color:#2A0;
    }
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</head>
<%
	id=request("id")
	if id="" then
		sql="select top 1 * from info_co where lm=13 and pass='yes' order by px desc, id desc"
		set rs=conn.execute(sql)
		if not rs.eof then
			z_body=rs("z_body")
		end if
	else
		sql="select top 1 * from info_co where id="&id&" order by px desc, id desc"
		set rs=conn.execute(sql)
		if not rs.eof then
			z_body=rs("z_body")
		end if
	end if
%>
<body>
<!--#include file="top1.asp"--> 
<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center">
	<tr>
    	<td>
        	<%=z_body%>
        </td>
    </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center">
	<tr>
    	<td align="left" height="30">
        	当前位置：<a href="index.asp">首页</a> > <a href="news.asp">新闻资讯</a> > 视频中心&nbsp;
        </td>
    </tr>
</table>
<div id="main">
<div class="pro_ul" style="text-align:center">
<div class="leftbtn"><a href="#" id="back" class="slide_nav"><img src="images/index_04.jpg" /></a></div>
<div id="small_frame" class="l_frame" style="display:block">
    <ul id="small_list" class="list">
    	<%
			sql="select * from info_co where lm=13 and pass='yes' order by px desc, id desc"
			set rs=conn.execute(sql)
			do while not rs.eof
		%>
        <li style=" height:100px; width:130px; text-align:center">
        <a href="video.asp?id=<%=rs("id")%>"><a href="video.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" height="120" width="140" border="0"/><br />
        <%=rs("title")%></a></li>
        <%
			rs.movenext
			loop
			rs.close
		%>
    </ul>
</div>
<div class="rightbtn"><a href="#" id="forward" class="slide_nav"><img src="images/index_05.jpg" /></a></div>
</div>
       <div class="clear"></div>
    
</div>
<!--#include file="bottom.asp"--> 
</body>
</html>
<script type="text/javascript">

//初始化
function C_slider(frame,list,Lframe,Llist,forwardEle,backEle,scrollType,LscrollType,acitonType,autoInterval){
    this.frame = frame;
    this.list = list;
    this.Lframe = Lframe;
    this.Llist = Llist;
    this.forwardEle = forwardEle;
    this.backEle = backEle;
    this.scrollType = scrollType;
    this.LscrollType = LscrollType;
    this.acitonType = acitonType;
    this.autoInterval = autoInterval;
    
    this.slideLength = $("#"+this.Llist+" > li").length;//总的slider数量
    this.currentSlide = 0;
    this.FrameHeight = $("#"+this.frame).height();
    this.FrameWidth = $("#"+this.frame).width();
    this.lFrameHeight = $("#"+this.Lframe).height();
    this.lFrameWidth = $("#"+this.Lframe).width();
    this.lListHeight = $("#"+this.Llist+" >li").eq(0).outerHeight(true);
    this.lListWidth = $("#"+this.Llist+" >li").eq(0).outerWidth(true);
    
    var self = this;
    
    for(var i = 0; i<this.slideLength; i++) {
        $("#"+this.Llist+" > li").eq(i).data("index",i);
        $("#"+this.Llist+" > li").eq(i).bind(this.acitonType,function(){
            self.go($(this).data("index"));
        });
    };
    
    //给“上一个”、“下一个”按钮添加动作
    $("#"+this.forwardEle).bind('click',function(){
        self.forward();
        return false;
    });
    $("#"+this.backEle).bind('click',function(){
        self.back();
        return false;
    });
    
    //定论鼠标划过时，自动轮换的处理
    $("#"+this.frame+",#"+this.Lframe+",#"+this.forwardEle+",#"+this.backEle).bind('mouseover',function(){
        clearTimeout(self.autoExt);
    });
    
    $("#"+this.frame+",#"+this.Lframe+",#"+this.forwardEle+",#"+this.backEle).bind('mouseout',function(){
        clearTimeout(self.autoExt);
        self.autoExt = setTimeout(function(){
            self.extInterval();
        },self.autoInterval);
    });    
    
    
    ////开始自动轮换
//    this.autoExt = setTimeout(function(){
//        self.extInterval();
//    },this.autoInterval);
}

//执行运动
C_slider.prototype.go = function(index){
    this.currentSlide = index;
    if (this.scrollType == "left"){
        $("#"+this.list).animate({
            marginLeft: (-index*this.FrameWidth)+"px"
        }, {duration:600,queue:false});         
    } else if (this.scrollType == "top"){
        $("#"+this.list).animate({
            marginTop: (-index*this.FrameHeight)+"px"
        }, {duration:600,queue:false});         
    }
    
    $("#"+this.Llist+" > li").removeClass("cur");
    $("#"+this.Llist+" > li").eq(index).addClass("cur");
        
    //对于缩略图的滚动处理
    if(this.LscrollType == "left"){
        if(this.slideLength*this.lListWidth > this.lFrameWidth){
            var spaceWidth = (this.lFrameWidth - this.lListWidth)/2;
            var hiddenSpace = this.lListWidth*this.currentSlide - spaceWidth;
            
            if (hiddenSpace > 0){
                if(hiddenSpace+this.lFrameWidth <= this.slideLength*this.lListWidth){
                    $("#"+this.Llist).animate({
                        marginLeft: -hiddenSpace+"px"
                    }, {duration:600,queue:false});
                } else {
                    var endHidden = this.slideLength*this.lListWidth - this.lFrameWidth;
                    $("#"+this.Llist).animate({
                        marginLeft: -endHidden+"px"
                    }, {duration:600,queue:false});
                }
            } else {
                $("#"+this.Llist).animate({
                    marginLeft: "0px"
                }, {duration:600,queue:false});
            }
        }
        
    } else if (this.LscrollType == "top"){
        if(this.slideLength*this.lListHeight > this.lFrameHeight){
            var spaceHeight = (this.lFrameHeight - this.lListHeight)/2;
            var hiddenSpace = this.lListHeight*this.currentSlide - spaceHeight;
            
            if (hiddenSpace > 0){
                if(hiddenSpace+this.lFrameHeight <= this.slideLength*this.lListHeight){
                    $("#"+this.Llist).animate({
                        marginTop: -hiddenSpace+"px"
                    }, {duration:600,queue:false});
                } else {
                    var endHidden = this.slideLength*this.lListHeight - this.lFrameHeight;
                    $("#"+this.Llist).animate({
                        marginTop: -endHidden+"px"
                    }, {duration:600,queue:false});
                }
            } else {
                $("#"+this.Llist).animate({
                    marginTop: "0px"
                }, {duration:600,queue:false});
            }
        }
        
    }
    
}

//前进
C_slider.prototype.forward = function(){
    if(this.currentSlide<this.slideLength-1){
        this.currentSlide += 6;
        this.go(this.currentSlide);
    }else {
        this.currentSlide = 0;
        this.go(0);
    }
}

//后退
C_slider.prototype.back = function(){
    if(this.currentSlide>0){
        this.currentSlide -= 6;
        this.go(this.currentSlide);
    }else {
        this.currentSlide = this.slideLength-1;
        this.go(this.slideLength-1);
    }
}

////自动执行
//C_slider.prototype.extInterval = function(){
//    if(this.currentSlide<this.slideLength-1){
//        this.currentSlide += 6;
//        this.go(this.currentSlide);
//    }else {
//        this.currentSlide = 0;
//        this.go(0);
//    }
//    
//    var self = this;
//    this.autoExt = setTimeout(function(){
//        self.extInterval();
//    },this.autoInterval);
//}





//实例化对象
var goSlide1 = new C_slider("big_frame","big_list","small_frame","small_list","forward","back","left","left","click",3000);
</script> 