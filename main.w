<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"/> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents1" slidable="false">
   <div class="x-contents-content" xid="topsalecontent" onActive="topsalecontentActive"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer1" src="./topsale/topsale.w"></div></div>
  <div class="x-contents-content" xid="productcontent"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer4" src="$UI/flowerfront/product/product.w"></div></div><div class="x-contents-content" xid="buycarcontent"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer2" src="$UI/flowerfront/buy/buycar.w"></div></div>
  <div class="x-contents-content" xid="owercontent"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer3" src="$UI/flowerfront/ower/ower.w"></div></div>
  </div></div>
   <div class="x-panel-bottom" xid="bottom1" style="border-top-style:solid;border-top-width:0px;border-top-color:#f6f6f6;"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified x-flower" tabbed="true" xid="buttonGroup1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="首页" xid="button1" target="topsalecontent" icon="my2 my2-haoping">
    <i xid="i1" class="my2 my2-haoping"></i>
    <span xid="span1">首页</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="全部商品" xid="button2" icon="my my-fenlei" target="productcontent">
    <i xid="i2" class="my my-fenlei"></i>
    <span xid="span2">全部商品</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="购物车" xid="button3" icon="my my-gouwuche" target="buycarcontent" onClick="button3Click">
   <i xid="i3" class="my my-gouwuche"></i>
   <span xid="span3">购物车</span><div xid="div2" class="text-center displaynone">
   <label xid="label2" class="angle" style="display:none;"><![CDATA[0]]></label></div></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="个人中心" xid="button4" icon="my my-gerenzhongxin1" target="owercontent">
   <i xid="i4" class="my my-gerenzhongxin1"></i>
   <span xid="span4">个人中心</span></a></div>
  </div></div>
  <resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon/my.icons"></require>
  <require xid="require2" url="css!$UI/flowerfront/icon2/my2.icons"></require></resource></div>