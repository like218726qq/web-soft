<script language="javascript">
<!--
//图片滚动列表 mengjia 070927
var Speed_1 = 10; //速度(毫秒)
var Space_1 = 20; //每次移动(px)
var PageWidth_1 = 192 * 2+5; //翻页宽度
var interval_1 = 3000; //翻页间隔
var fill_1 = 0; //整体移位
var MoveLock_1 = false;
var MoveTimeObj_1;
var MoveWay_1="right";
var Comp_1 = 0;
var AutoPlayObj_1=null;
function GetObj(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval('document.all.'+objName)}}
function AutoPlay_1(){clearInterval(AutoPlayObj_1);AutoPlayObj_1=setInterval('ISL_GoDown_1();ISL_StopDown_1();',interval_1)}
function ISL_GoUp_1(){if(MoveLock_1)return;clearInterval(AutoPlayObj_1);MoveLock_1=true;MoveWay_1="left";MoveTimeObj_1=setInterval('ISL_ScrUp_1();',Speed_1);}
function ISL_StopUp_1(){if(MoveWay_1 == "right"){return};clearInterval(MoveTimeObj_1);if((GetObj('ISL_Cont_1').scrollLeft-fill_1)%PageWidth_1!=0){Comp_1=fill_1-(GetObj('ISL_Cont_1').scrollLeft%PageWidth_1);CompScr_1()}else{MoveLock_1=false}
AutoPlay_1()}
function ISL_ScrUp_1(){if(GetObj('ISL_Cont_1').scrollLeft<=0){GetObj('ISL_Cont_1').scrollLeft=GetObj('ISL_Cont_1').scrollLeft+GetObj('List1_1').offsetWidth}
GetObj('ISL_Cont_1').scrollLeft-=Space_1}
function ISL_GoDown_1(){clearInterval(MoveTimeObj_1);if(MoveLock_1)return;clearInterval(AutoPlayObj_1);MoveLock_1=true;MoveWay_1="right";ISL_ScrDown_1();MoveTimeObj_1=setInterval('ISL_ScrDown_1()',Speed_1)}
function ISL_StopDown_1(){if(MoveWay_1 == "left"){return};clearInterval(MoveTimeObj_1);if(GetObj('ISL_Cont_1').scrollLeft%PageWidth_1-(fill_1>=0?fill_1:fill_1+1)!=0){Comp_1=PageWidth_1-GetObj('ISL_Cont_1').scrollLeft%PageWidth_1+fill_1;CompScr_1()}else{MoveLock_1=false}
AutoPlay_1()}
function ISL_ScrDown_1(){if(GetObj('ISL_Cont_1').scrollLeft>=GetObj('List1_1').scrollWidth){GetObj('ISL_Cont_1').scrollLeft=GetObj('ISL_Cont_1').scrollLeft-GetObj('List1_1').scrollWidth}
GetObj('ISL_Cont_1').scrollLeft+=Space_1}
function CompScr_1(){if(Comp_1==0){MoveLock_1=false;return}
var num,TempSpeed=Speed_1,TempSpace=Space_1;if(Math.abs(Comp_1)<PageWidth_1/2){TempSpace=Math.round(Math.abs(Comp_1/Space_1));if(TempSpace<1){TempSpace=1}}
if(Comp_1<0){if(Comp_1<-TempSpace){Comp_1+=TempSpace;num=TempSpace}else{num=-Comp_1;Comp_1=0}
GetObj('ISL_Cont_1').scrollLeft-=num;setTimeout('CompScr_1()',TempSpeed)}else{if(Comp_1>TempSpace){Comp_1-=TempSpace;num=TempSpace}else{num=Comp_1;Comp_1=0}
GetObj('ISL_Cont_1').scrollLeft+=num;setTimeout('CompScr_1()',TempSpeed)}}
function picrun_ini(){
GetObj("List2_1").innerHTML=GetObj("List1_1").innerHTML;
GetObj('ISL_Cont_1').scrollLeft=fill_1>=0?fill_1:GetObj('List1_1').scrollWidth-Math.abs(fill_1);
GetObj("ISL_Cont_1").onmouseover=function(){clearInterval(AutoPlayObj_1)}
GetObj("ISL_Cont_1").onmouseout=function(){AutoPlay_1()}
AutoPlay_1();
}
//产品展示滚动图片结束
//-->
</script>
<style type="text/css">
<!--

.blk_18 {
	MARGIN-TOP: 8px;
	FONT-SIZE: 12px;
	margin-left:0px;
	margin-right:0px;
	padding:0px;
	OVERFLOW: hidden;
	WIDTH: 730px;
	ZOOM: 1;
}
.blk_18 a{
color:#0033FF;}

.blk_18 .pcont {
FLOAT: left; OVERFLOW: hidden; WIDTH:658px; margin:0px 0px 0px 0px;
}
.blk_18 .ScrCont {
WIDTH: 32766px; ZOOM: 1
}
.blk_18 #List1_1 {
FLOAT: left;
}
.blk_18 #List2_1 {
FLOAT: left;
}
.blk_18 .LeftBotton {
BACKGROUND: url(images/index_45.gif) no-repeat; FLOAT: left; MARGIN: 40px 10px auto 20px; WIDTH: 14px; HEIGHT: 21px;

}
.blk_18 .RightBotton {
	FLOAT: left;
	MARGIN: 40px -60px auto 0px;
	WIDTH: 14px;
	HEIGHT: 21px;
	background-image: url(images/index_48.gif);
	background-repeat: no-repeat;
	padding-left:30px;
}
.blk_18 .LeftBotton {
BACKGROUND-POSITION: 0px 0px; MARGIN-LEFT: 10px
}
.blk_18 .RightBotton {
BACKGROUND-POSITION: 0px 0px; MARGIN-LEFT: 0px
}
.blk_18 .LeftBotton:hover {
BACKGROUND-POSITION: 0px 0px
}
.blk_18 .RightBotton:hover {
BACKGROUND-POSITION: 0px 0px
}
.blk_18 .pl IMG {
DISPLAY: block; MARGIN: 6px 11px 5px 1px; CURSOR: pointer; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none; text-align:center;
}
.blk_18 .pl {
BORDER-RIGHT: #ccc 1px double; BORDER-TOP: #ccc 1px double; FLOAT: left; BORDER-LEFT: #ccc 1px double; WIDTH: 112px; LINE-HEIGHT: 24px; BORDER-BOTTOM: #ccc 1px double; TEXT-ALIGN: center; TEXT-DECORATION:none; padding-left:10px; height:110px; 
}
/*.blk_18 A.pl:hover {
BORDER-RIGHT: #ff9900 1px solid; BORDER-TOP: #ff9900 1px solid; BACKGROUND: #fff; BORDER-LEFT: #ff9900 1px solid; COLOR: #ff9900; BORDER-BOTTOM: #ff9900 1px solid
}*/
.commu_cont3 {
MARGIN: 9px 7px 7px; LINE-HEIGHT: 150%
}
.commu_cont3 UL {
WIDTH: 188px
}

#List1_1 li{ FLOAT: left; WIDTH: 112px; MARGIN-RIGHT: 95px}
-->
</style>
<!-- picrotate_left start -->
<div class=blk_18><a onmouseup=ISL_StopUp_1() class=LeftBotton
onmousedown=ISL_GoUp_1() onmouseout=ISL_StopUp_1() href="javascript:void(0);"
target=_self></a>
		<div class=pcont id=ISL_Cont_1>
			<div class=ScrCont>
				<div id=List1_1>
			
	<!--	<ul >-->
				<!-- piclist begin -->
			
						<%
			set rs1=server.CreateObject("adodb.recordset")
			rs1.open "select top 15 * from info_co where lm=42 order by id desc",conn,1,3
			if rs1.eof or rs1.bof then
			Response.Write("暂无产品")
			end if
			do while not rs1.eof
		%>
	
		<!--	<li style="text-align:center">-->
			<a style="text-align:center; padding-left:16px;  height:110px; width:120px;" href="product.asp?id=<%=rs1("id")%>"><img src="../<%=rs1("img_sl")%>" height="107" width="109" style="border:double 1px #CCCCCC; "  border="0" /></a>
			  <!--  </li>         	-->
						<%
			rs1.movenext
			loop
			rs1.close
			set rs1=nothing
		%>
	<!--	</ul>	-->		
		
					<!-- piclist end -->
				</div>
				<div id=List2_1></div>
			</div>
		</div>
	<a onmouseup=ISL_StopDown_1()
class=RightBotton onmousedown=ISL_GoDown_1() onmouseout=ISL_StopDown_1()
href="javascript:void(0);" target=_self></a>
	<div style="clear:both"></div>
</div>
<SCRIPT type=text/javascript>
<!--
picrun_ini()
//-->
</SCRIPT>