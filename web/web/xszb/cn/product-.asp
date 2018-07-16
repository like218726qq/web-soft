<!--#include file="top.asp" -->
<LINK href="css/css_pro.css" type=text/css rel=stylesheet>
<%
	lm=request("lm")
	keyword=bsql(html(trim(request("keyword"))))
	
	if lm<>"" then
		if not checknum(lm) then
			call msg("参数错误","")
		else
			lm=clng(lm)
			set rs=server.CreateObject("adodb.recordset")
			sql="select id_lm,fid,title_lm from pro_lm where id_lm="&lm&""
			rs.open sql,conn,1,1
			if not rs.eof then
				lm=rs("id_lm")
				title_lm=rs("title_lm")
				dao=" &gt; "&title_lm
				sq=" and lm="&lm&""
				pra="&lm="&lm&""
			end if
			rs.close
			set rs=nothing
		end if
	else
		dao=""
		sq=""
		pra=""
	end if
	
	if keyword<>"" then
		dao=" &gt; 搜索结果"
		sq=" and title like'%"&keyword&"%'"
		pra="&keyword="&server.URLEncode(keyword)&""
	end if 
%>
<!--banner-->

<table width="980" height="154" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0px auto;">
  <tr>
    <td style="padding-top:2px; padding-bottom:1px; background:url(images/n_banner2.jpg) center center no-repeat;"></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" style="background:#9f6300;">&nbsp;</td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="170" height="388" align="center" valign="top"><!--#include file="pro_left.asp"--></td>
    <td width="810" valign="top">
     
      
      <div class="cont" style="margin-top:15px;">
    <div class="title01">
    	<div style=" margin:8px 0 10px 5px; color:#d19231;">产品翻页</div>
        <ul class="num" id="idNum">
					  <%	
                set rs=server.CreateObject("adodb.recordset")
                sql="select  * from pro_co where pass='yes' "&sq&" order by px desc,id desc"
                rs.open sql,conn,1,1
                if not rs.eof then 
                i=1
                counter=rs.recordcount
                    while not rs.eof
            %>
               <%if i mod 4=0 then%>
                        <li>&nbsp;</li>
                <%end if%>
			  <%
                  i=i+1
                  rs.movenext
                  wend
                  end if	
                  rs.close
                  set rs=nothing
              %>
			  <%if counter mod 4>0 then%>
              <li>&nbsp;</li>
              <%end if%>
          
        </ul>
        <div class="clear"></div>
    </div>

    <div class="container1" id="idTransformView">
    <ul class="slider" id="idSlider">
    
        <div class="right_cont">   
            <div class="pic">
            <%	
    set rs=server.CreateObject("adodb.recordset")
    sql="select id,title,img_sl from pro_co where pass='yes' "&sq&" order by px desc,id desc"
    rs.open sql,conn,1,1
    if not rs.eof then
        pagenum=16
        rs.pagesize=pagenum
        counter=rs.recordcount
        pagezong=rs.pagecount
        pageno=trim(request.querystring("page"))
        if pageno="" or not isnumeric(pageno) then 
            pageno=1
        end if
        if pageno<1 then
            pageno=1
        end if
        if pageno-pagezong>0 then 
            pageno=pagezong
        end if
        pageno=clng(pageno)
        rs.absolutepage=pageno
        a=1
        while not rs.eof and a<=pagenum
%>
<table width="190" border="0" cellspacing="0" cellpadding="0" class="pro_box">
  <tr>
    <td align="center" height="210"><div class="pro_img"><a href="product_show.asp?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>"  /></a></div></td>
  </tr>
  <tr>
    <td align="center" height="50" valign="middle"><a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
  </tr>
</table>
<%
    if a mod 4 = 0 then response.Write("</div></div><div class=right_cont><div class=pic>")
            a=a+1
        rs.movenext
        wend
	else
		response.Write("暂无相关信息~！")
    end if	
    rs.close
    set rs=nothing
%>
           
           <div class="clear"></div>
           </div><div class="clear"></div>
        </div>

        
    </ul>   <div class="clear"></div>
    </div> 
    <div class="clear"></div>
</div> 

<%
 z=counter \ 4
 if counter mod 4 > 0 then
 z=z+1
 end if
%>
<script type="text/javascript">

var Class = {
  create: function() {
	return function() {
	  this.initialize.apply(this, arguments);
	}
  }
}

Object.extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}

var TransformView = Class.create();
TransformView.prototype = {
  //容器对象,滑动对象,切换参数,切换数量
  initialize: function(container, slider, parameter, count, options) {
	if(parameter <= 0 || count <= 0) return;
	var oContainer = document.getElementById(container), oSlider = document.getElementById(slider), oThis = this;

	this.Index = 0;//当前索引
	
	this._timer = null;//定时器
	this._slider = oSlider;//滑动对象
	this._parameter = parameter;//切换参数
	this._count = count || 0;//切换数量
	this._target = 0;//目标参数
	
	this.SetOptions(options);
	
	this.Up = !!this.options.Up;
	this.Step = Math.abs(this.options.Step);
	this.Time = Math.abs(this.options.Time);
	this.Auto = !!this.options.Auto;
	this.Pause = Math.abs(this.options.Pause);
	this.onStart = this.options.onStart;
	this.onFinish = this.options.onFinish;
	
	oContainer.style.overflow = "hidden";
	oContainer.style.position = "relative";
	
	oSlider.style.position = "absolute";
	oSlider.style.top = oSlider.style.left = 0;
  },
  //设置默认属性
  SetOptions: function(options) {
	this.options = {//默认值
		Up:			false,//是否向上(否则向左)
		Step:		6,//滑动变化率
		Time:		10,//滑动延时
		Auto:		true,//是否自动转换
		Pause:		5000,//停顿时间(Auto为true时有效)
		onStart:	function(){},//开始转换时执行
		onFinish:	function(){}//完成转换时执行
	};
	Object.extend(this.options, options || {});
  },
  //开始切换设置
  Start: function() {
	if(this.Index < 0){
		this.Index = this._count - 1;
	} else if (this.Index >= this._count){ this.Index = 0; }
	
	this._target = -1 * this._parameter * this.Index;
	this.onStart();
	this.Move();
  },
  //移动
  Move: function() {
	clearTimeout(this._timer);
	var oThis = this, style = this.Up ? "top" : "left", iNow = parseInt(this._slider.style[style]) || 0, iStep = this.GetStep(this._target, iNow);
	
	if (iStep != 0) {
		this._slider.style[style] = (iNow + iStep) + "px";
		this._timer = setTimeout(function(){ oThis.Move(); }, this.Time);
	} else {
		this._slider.style[style] = this._target + "px";
		this.onFinish();
		if (this.Auto) { this._timer = setTimeout(function(){ oThis.Index++; oThis.Start(); }, this.Pause); }
	}
  },
  //获取步长
  GetStep: function(iTarget, iNow) {
	var iStep = (iTarget - iNow) / this.Step;
	if (iStep == 0) return 0;
	if (Math.abs(iStep) < 1) return (iStep > 0 ? 1 : -1);
	return iStep;
  },
  //停止
  Stop: function(iTarget, iNow) {
	clearTimeout(this._timer);
	this._slider.style[this.Up ? "top" : "left"] = this._target + "px";
  }
};

function run(){
	function Each(list, fun){
		for (var i = 0, len = list.length; i < len; i++) { fun(list[i], i); }
	};
	
	var objs = document.getElementById("idNum").getElementsByTagName("li");
	
	var tv = new TransformView("idTransformView", "idSlider", 790, <%=z%>, {
		onStart : function(){ Each(objs, function(o, i){ o.className = tv.Index == i ? "on" : ""; }) }//按钮样式
	});
	
	tv.Start();
	
	Each(objs, function(o, i){
		o.onclick = function(){
			o.className = "on";
			tv.Auto = false;
			tv.Index = i;
			tv.Start();
		}
		o.onmouseout = function(){
			o.className = "";
			tv.Auto = true;
			tv.Start();
		}
	})
	

	
}
run();
</script>	
    </td>
  </tr>
</table>

<!--#include file="foot.asp" -->