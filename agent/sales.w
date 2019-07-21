<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="销售"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">销售</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified x-flower" tabbed="true" xid="buttonGroup1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="一周" xid="button1" target="content2" onClick="button1Click">
    <i xid="i1"></i>
    <span xid="span3">一周</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="一个月" xid="button2" target="content3" onClick="button2Click">
    <i xid="i2"></i>
    <span xid="span4">一个月</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="三个月" xid="button3" target="content4" onClick="button3Click">
   <i xid="i3"></i>
   <span xid="span5">三个月</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="一年" xid="button4" target="content5" onClick="button4Click">
   <i xid="i4"></i>
   <span xid="span6">一年</span></a></div>
  <div component="$UI/system/components/justep/contents/contents" class="x-contents" active="0" xid="contents1" style="height:100%;">
   <div class="x-contents-content" xid="content2"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer1"></div></div>
  <div class="x-contents-content" xid="content3"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer2"></div></div>
  <div class="x-contents-content" xid="content4"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer3"></div></div>
  <div class="x-contents-content" xid="content5"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer4"></div></div></div></div>
  </div> 
</div>