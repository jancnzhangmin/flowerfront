<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="任务"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">任务</div>  
          <div class="x-titlebar-right reverse" style="color:#333333;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="明细" xid="button1">
   <i xid="i1"></i>
   <span xid="span1">明细</span></a></div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1">
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified x-flower" tabbed="true" xid="buttonGroup1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="button2" target="content2" onClick="button2Click">
    <i xid="i2"></i>
    <span xid="span2"></span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="button3" target="content3" onClick="button3Click">
    <i xid="i3"></i>
    <span xid="span3"></span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="button4" target="content4" onClick="button4Click">
   <i xid="i4"></i>
   <span xid="span4"></span></a></div></div><div component="$UI/system/components/justep/contents/contents" class="x-contents" active="0" xid="contents1" style="height:820px;">
   <div class="x-contents-content" xid="content2"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer1"></div></div>
  <div class="x-contents-content" xid="content3"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer2"></div></div>
  <div class="x-contents-content" xid="content4"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer3"></div></div></div>
  </div>
  </div> 
</div>