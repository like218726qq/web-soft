var kf_success=1; var kftype=2;

  // 获取cookie值 
  function hz6d_getCookie(name)
  {
    var offset = document.cookie.indexOf(name+"=");
    if(offset != -1)
    {
      offset += name.length+1;
      var end = document.cookie.indexOf(";", offset);
      if(end == -1)
      {
        end = document.cookie.length;
      }
      return document.cookie.substring(offset, end);
    }
    else
    {
      return "";
    }
  }
  var hz6d_from_page = hz6d_getCookie("53kf_");
  if(hz6d_from_page=="")
  {
    hz6d_from_page = document.referrer;
    document.cookie = "53kf_="+hz6d_from_page;
  }
  hz6d_from_page = "&keyword="+escape(hz6d_from_page);

  function hz6d_html_replace(html)
  {
    var pattern = /{hz6d_keyword}/gim;
    var hz6d_html = html.replace(pattern, hz6d_from_page);
    return hz6d_html;
  }
    // has defined <!DOCTYPE... > 
    function hasdoctype()
    {
      var ret=false;
      try
      {
        if(document.compatMode=="BackCompat")
          ret=false;
        else if (document.compatMode=="CSS1Compat")
          ret=true;
        else
          ret=true;
      }
      catch(e){ ret=false }
      return ret;
    }

    // ie8 =  IE8_Partner_Build [2008-12-11] 
    function detectBrowser()
    { 
      var ret="ie6"; // default 
      var user_agent = navigator.userAgent;
      if(user_agent.indexOf("compatible")>-1)
      {
        if(user_agent.indexOf("MSIE 6.0") > -1)
          ret="ie6"
        else if(user_agent.indexOf("MSIE 7.0") > -1)
          ret="ie7";
        else if(user_agent.indexOf("MSIE 8.0") > -1)
          ret="ie8";
        if(user_agent.indexOf("360") > -1)
        {
          ret="360";
        }
      }
      else if(user_agent.indexOf("Gecko") > -1)
      {
        ret="firefox";
      }

      if(""=="TheWorld")
      {
        ret="TheWorld";
      }

      return ret;
    }
    
    // 间距小于步进，则移动间距的距离 
    function smoothMove(start,end)
    {
      var step=Math.abs(end-start);
      var forword = end-start;

      if(step>2)
      {
        step=Math.ceil(step*0.2)*(forword/Math.abs(forword));
      }
      else
      {
        step=step*(forword/Math.abs(forword));
      }

			posi=start+step;
      if(step>0)
      {
        if(posi>end)
          posi=end;
      }
      else
      {
        if(posi<end)
          posi=end;
      }
      return posi;
    }
    var hasdoctype=hasdoctype();
    var browser=detectBrowser();

    // 点击图标设置变量 
    function setIsinvited()
    {
      try
      {
        onliner_zdfq = 2;
        if(acc_autotype==3)
        {
          document.cookie = "onliner_zdfq69339475="+onliner_zdfq;
        }
      }catch(e){}
    }
    var onliner_zdfq = hz6d_getCookie("onliner_zdfq69339475");//onliner_zdfq: 0.初始值 2.点击接受 3.点击拒绝 
    if(onliner_zdfq=="")
    {
      onliner_zdfq = 0;
      document.cookie = "onliner_zdfq69339475="+onliner_zdfq;
    }  var hz6d_kf_type = 2;
  var hz6d_pos_model = 1;
  var hz6d_hidden = 0;
	var hz6d_close_icon = 0;    document.write("<scr"+"ipt src='http://www42.53kf.com/kf_ivt.php?arg=sosofy&style=1&isonline=0&kfonline=0&lang=zh-cn&resize=yes&charset=gbk&kflist=off&kf=&zdkf_type=1&referer="+hz6d_from_page+"&lytype=0&tpl_name=crystal_blue&tpl_width=703&tpl_height=473' type='text/javascript'></scr"+"ipt>");					function _createIconDivMain()
					{
						if(document.getElementById(this.config["iconDiv"])==null)
            {
              var id=this.config["id"];
              setTimeout('kf_icons['+id+'].createIconDivMain()',500);
              return ;
            }
						if(document.getElementById(this.config["iconDiv"]).innerHTML.indexOf('.gif')!=-1 
							|| document.getElementById(this.config["iconDiv"]).innerHTML.indexOf('.jpg')!=-1 
							|| document.getElementById(this.config["iconDiv"]).innerHTML.indexOf('.swf')!=-1) 
						{
							return ;
						}
						if (this.config["isonline"]==1) 
							imgsrc=this.config["img_on"];
						else 
							imgsrc=this.config["img_off"];
						var html="";
						//if (this.config["iframe_flag"]==1)
						//{   
							html += "<iframe   style='position:absolute;z-index:7998;width:0px;height:0px;top:0px;left:0px;' frameborder='0' ></iframe>";
						//} 
						var kf="<img onclick=\"setIsinvited();kf_icons["+this.config["id"]+"].wopen('"+this.setParameter()+"')\" src=\""+imgsrc+"\" style='cursor:pointer'>"; 
						if (this.config["record_url"]!="" && this.config["isonline"]==0)
						{
							kf="<a href=\""+this.config["record_url"]+"\" target='_blank'><img border=0 src=\""+imgsrc+"\" style='cursor:pointer'></a>"; 
						}
						html += "<DIV id='"+this.config["iconDivMain"]+"' style='z-index:7999;display:"+this.display+";left: "+this.left+"px; top: "+this.top+"px;width:"+this.config["width"]+"px;height:"+this.config["height"]+"px; overflow:hidden;POSITION: absolute;'>"+this.closeIcon()+kf+"</div>";

						document.getElementById(this.config["iconDiv"]).innerHTML=html;
						this.iconDivMain=document.getElementById(this.config["iconDivMain"]);

					}  //to avoid the no 

  if (typeof(kf_icons)=="undefined")
  {
    var kf_icons=new Array();
    function hishow(id,img_url)
    {
      var divname="hsdiv"+id;
      if(document.getElementById(divname).style.display=="none")
      {
        document.getElementById(divname).style.display="block";
        document.getElementById("arrow"+id).src="http://www42.53kf.com/"+img_url+"arrow1.gif";
      }
      else
      {
        document.getElementById(divname).style.display="none";
        document.getElementById("arrow"+id).src="http://www42.53kf.com/"+img_url+"arrow2.gif";
      }
    }

    function kfIcon()
    { 
      this.config=new Array();
      this.left=-200;//图标需要到达的 left 
      this.top=0;
      this.width=0;//图标宽度 
      this.height=0;//图标宽度 
      this.offsetLeft=0;//距离左侧宽度，包括滚动过的距离 
      this.scrolledX=0;//图标水平滚动条滚动过的距离 
      this.scrolledY=100;
      this.issmooth=false;//是否平滑移动 
      if(browser=="360" || browser=="TheWorld")
      {
        this.loopmillisecond=500;
      }
      else
      {
        this.loopmillisecond=10;//图标循环定位的毫秒，数值越大越慢，对CPU影响越小 
      }
      this.Xstep=4;//水平步进基数,数字越大越平滑，也越慢 
      this.Ystep=4;
      this.pageW=0;//页面总宽度 
      this.pageH=0;
      this.display="";//是否显示图标,值 "none"|"" 
      this.iconDiv=null;
      this.iconDivMain=null;
      this.autoScrollTimer=null;

      this.init=_init;
      this.autoScroll=scroll;
      this.createIconDivMain=_createIconDivMain;//
      this.setParameter=_setParameter;//在 createIconDivMain 中调用 
      this.wopen=_wopen;//同上 
      this.closeIcon=_closeIcon; //同上 
      this.hidden=_hidden; //同上 
    };

    function scroll()
    {
      //this.createIconDivMain();
     //if(document.getElementById("Xstep"))   
      //this.Xstep=document.getElementById("Xstep").value;
     //if(document.getElementById("Ystep"))   
      //this.Ystep=document.getElementById("Ystep").value;
      //alert("scroll");
      try
      {
        this.offsetLeft=this.iconDivMain.offsetLeft;
        this.width=parseInt(this.iconDivMain.style.width.replace("px",""));
        this.height=parseInt(this.iconDivMain.style.width.replace("px",""));
      }
      catch(e)
      {
        //this.iconDivMain=document.getElementById(this.config["iconDivMain"]);
        return;
      }

      this.scrollbarW=20;// scrollbar width in ie6,ie7,ie8 = 20px
      this.scrolledY = document.body.scrollTop;
      this.scrolledX = document.body.scrollLeft;
      if(this.scrolledY==0)
        this.scrolledY = document.documentElement.scrollTop;
      if(this.scrolledX==0)
        this.scrolledX = document.documentElement.scrollLeft;

      if(browser=="ie6")
      {   
        this.pageH = document.documentElement.offsetHeight;
        this.pageW = document.documentElement.offsetWidth;
      }
      else if(browser=="ie7")
      {
        this.pageH = document.documentElement.offsetHeight;
        if(hasdoctype)
          this.pageW = document.documentElement.offsetWidth+21;
        else
          this.pageW = document.documentElement.offsetWidth;
      }
      else if(browser=="ie8")
      {
        this.pageH = document.documentElement.offsetHeight;
        this.pageW = document.documentElement.offsetWidth;
      }
      else if(browser=="firefox")
      {
        this.pageH = window.innerHeight;
        // 21=17+4 
        // 17 for document.documentElement.clientWidth in firefox 3
        // 4 for document.documentElement.scrollLeft in firefox 3 differently from ie6,ie7
        //
        this.pageW = document.documentElement.clientWidth+21; 
      }
      else
      {   
        this.pageH = document.documentElement.offsetHeight;
        this.pageW = document.documentElement.offsetWidth;
      }

      if(this.top!=(this.scrolledY+this.config["offsetH"]))
      {
        this.top=this.scrolledY+this.config["offsetH"];
      }

      if(this.config["showmodel"]==1)
      {
        if(this.left!=(this.scrolledX+this.pageW))
        {
          var iconDivWidth=this.scrolledX+this.config["offsetW"]-this.offsetLeft;
          iconDivWidth=(iconDivWidth>0?1:-1)*Math.ceil(Math.abs(iconDivWidth));
          this.left=this.offsetLeft+iconDivWidth;
        }
      }
      else
      {
        if(this.left!=(this.scrolledX+this.pageW-this.width-this.config["offsetW"]-this.scrollbarW))
        {
          var iconDivWidth=this.scrolledX+this.pageW-this.width-this.config["offsetW"]-this.scrollbarW-this.offsetLeft;
          iconDivWidth=(iconDivWidth>0?1:-1)*Math.ceil(Math.abs(iconDivWidth));
          this.left=this.offsetLeft+iconDivWidth;
        }
      }
      //set kf_icon postiotn
      //超出窗口边界，直接移动到窗口边界再平滑移动 
      var left=parseInt(this.iconDivMain.style.left.replace("px",""));
      var top=parseInt(this.iconDivMain.style.top.replace("px",""));
            
      if(this.issmooth==true)
      {
        if(left!=this.left)
        {
          if(left<(this.scrolledX-this.width))
            left=this.scrolledX-this.width;
          if(left>this.scrolledX+this.pageW)
            left=this.scrolledX+this.pageW;

          if(browser=="360" || browser=="TheWorld")
          {
            left=this.left;
            if(this.iconDivMain.style.display=="none")
            {
              this.recover = false;
            }
            else
            {
              this.iconDivMain.style.display = "none";
              this.recover = true;
            }
            this.iconDivMain.style.left=left+"px";
            if(this.recover==true)
            {
              this.iconDivMain.style.display = "block";
            }
          }
          else
          {
            left=smoothMove(left,this.left);
          }
        }
        if(top!=this.top)
        {
          if(top<(this.scrolledY-this.height))
            top=this.scrolledY-this.height;
          if(top>this.scrolledY+this.pageH)
            top=this.scrolledY+this.pageH;

          if(browser=="360" || browser=="TheWorld")
          {
            top=this.top;
            if(this.iconDivMain.style.display=="none")
            {
              this.recover = false;
            }
            else
            {
              this.iconDivMain.style.display = "none";
              this.recover = true;
            }
            this.iconDivMain.style.top=top+"px";
            if(this.recover==true)
            {
              this.iconDivMain.style.display = "block";
            }
          }
          else
          {
            top=smoothMove(top,this.top);
          }
        }
      }
      else if(this.issmooth==false)
      {
        left=this.left;
        top=this.top; 
        this.issmooth=true;
      }
      
      if(browser!="360" && browser!="TheWorld")
      {
        this.iconDivMain.style.left=left+"px";
        this.iconDivMain.style.top=top+"px";
      }
    }
    
    function _wopen(com) 
    {
      if (this.config["is_zdyurl"]==1)
        window.open(this.config["zdyurl"],"_blank","height="+473+",width="+703+",top=200,left=200,status=yes,toolbar=no,menubar=no,resizable=yes,scrollbars=no,location=no,titlebar=no");
      else  
        window.open(this.config["server_path"]+"/webCompany.php?arg="+this.config["arg"]+com,"_blank","height="+473+",width="+703+",top=200,left=200,status=yes,toolbar=no,menubar=no,resizable=yes,scrollbars=no,location=no,titlebar=no");
    };

    function _setParameter()
    {
      var params="";
      params+=this.config["style_id"];
      params+=this.config["language"];
      params+=this.config["onurl"]; 
      params+=this.config["lytype"];
      params+=this.config["lyurl"];
      params+=this.config["copartner"];
      params+=this.config["username"];
      params+=this.config["userinfo"];
      params+=this.config["charset"];	
      params+=this.config["introurl"];
      params+=this.config["kf"];
      params+=this.config["referer"];
      params+=this.config["keyword"];
      params+=this.config["company_tpl"];
			params+=this.config["brief"];
			params+=this.config["logo"];
			params+=this.config["question"];
      return params;
    };
    function _hidden()
    {
			hz6d_close_icon = 1;

      this.display="none";
      document.getElementById(this.config["iconDivMain"]).style.display="none";
      try
      {
        clearInterval(kf_icons[this.config["kf_icon_id"]].autoScrollTimer);
      }
      catch(e){}
    };

    function _closeIcon()
    {
			var str_onmove = "";
			if(2==1 && ('blue'=="new_blue" || 'blue'=="new_red" || 'blue'=="new_yellow" || 'blue'=="new_green"))
			{
				str_onmove = "onmousemove='this.src=\"http://www42.53kf.com/img/kflist/list_close_move.gif\"' onmouseout='this.src=\"http://www42.53kf.com/img/kflogo/close.gif\"'";
			}
			if (0==1 || 69339475==600603 || 69339475==61393572 || 69339475==1413303 || 69339475==61389920 || 69339475==61420906 || 69339475==61578368)
			{
				if(2==1)
				{
					return "<img onclick='kf_icons["+this.config["id"]+"].hidden()' style='position:absolute; right:3px;top:3px; cursor:pointer;' src='http://www42.53kf.com/img/kflogo/close.gif' "+str_onmove+" />";
				}
				return "<img onclick='kf_icons["+this.config["id"]+"].hidden()' style='position:absolute; right:3px;top:3px; cursor:pointer;' src='http://www42.53kf.com/img/kflogo/close.gif' />"
			}

      return "";
    };

    function _init()
    {
      document.write('<div id="'+this.config["iconDiv"]+'" ></div>');
      this.iconDiv=document.getElementById(this.config["iconDiv"]);
      this.createIconDivMain();
    };
 
  }

  if(typeof(kf_icon_id)=="undefined")
    kf_icon_id=1;
  else
    kf_icon_id++;
  kf_icons[kf_icon_id]=new kfIcon();
  kf_icons[kf_icon_id].config["id"]=kf_icon_id;
  kf_icons[kf_icon_id].config["arg"]="sosofy";
  //kf_icons[kf_icon_id].config["logo_id"]="5";
  //kf_icons[kf_icon_id].config["iframe_flag"]="";
  kf_icons[kf_icon_id].config["style_id"]="&style=1";
  kf_icons[kf_icon_id].config["isonline"]="0";
  kf_icons[kf_icon_id].config["img_on"]="http://www42.53kf.com/img/kflogo/gray.gif";
  kf_icons[kf_icon_id].config["img_off"]="http://www42.53kf.com/img/kflogo/gray_off.gif";
  kf_icons[kf_icon_id].config["height"]="200";
  kf_icons[kf_icon_id].config["width"]="118";
  kf_icons[kf_icon_id].config["showmodel"]=parseInt("2");
	if(2==1){
		kf_icons[kf_icon_id].config["offsetW"]=parseInt("1");
	}else{
		kf_icons[kf_icon_id].config["offsetW"]=parseInt("1");
	}
  kf_icons[kf_icon_id].config["offsetH"]=parseInt("200");
  kf_icons[kf_icon_id].config["language"]="&language=zh-cn";
  kf_icons[kf_icon_id].config["username"]="";
  kf_icons[kf_icon_id].config["userinfo"]="";
  kf_icons[kf_icon_id].config["charset"]="&charset=gbk";
  kf_icons[kf_icon_id].config["introurl"]="";
  kf_icons[kf_icon_id].config["onurl"]="";
  kf_icons[kf_icon_id].config["lytype"]="&lytype=0";
  kf_icons[kf_icon_id].config["lyurl"]="";
  kf_icons[kf_icon_id].config["copartner"]="";
  kf_icons[kf_icon_id].config["kf"]="&kflist=off&kf=&zdkf_type=1";
  kf_icons[kf_icon_id].config["referer"]="&referer=";
  kf_icons[kf_icon_id].config["keyword"]=hz6d_from_page;
  kf_icons[kf_icon_id].config["record_url"]="";
  var hz6d_zdyurl = "?arg=sosofy&style=1&kflist=off&kf=&zdkf_type=1&language=zh-cn&charset=gbk&lytype=0&referer={hz6d_keyword}&tpl=crystal_blue";
  hz6d_zdyurl = hz6d_html_replace(hz6d_zdyurl);
  kf_icons[kf_icon_id].config["zdyurl"]=hz6d_zdyurl;
  kf_icons[kf_icon_id].config["is_zdyurl"]="0";
  kf_icons[kf_icon_id].config["path"]="http://chat.53kf.com";
  kf_icons[kf_icon_id].config["server_path"]="http://www42.53kf.com";
  kf_icons[kf_icon_id].config["company_tpl"]="&tpl=crystal_blue";
	kf_icons[kf_icon_id].config["brief"]="";
	kf_icons[kf_icon_id].config["logo"]="";
  kf_icons[kf_icon_id].config["iconDivMain"]="iconDivMain"+kf_icon_id;
  kf_icons[kf_icon_id].config["iconDiv"]="iconDiv"+kf_icon_id;
	kf_icons[kf_icon_id].config["question"]="";

  kf_icons[kf_icon_id].init();
  eval('kf_icons['+kf_icon_id+'].autoScrollTimer=window.setInterval("kf_icons['+kf_icon_id+'].autoScroll()", '+kf_icons[kf_icon_id].loopmillisecond+');');