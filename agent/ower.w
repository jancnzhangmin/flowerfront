<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="我"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">我</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="padding:0px;">
   <div class="x-col x-col-fixed" xid="col1" style="width:40px;padding-left:10px;margin-top:12px;margin-bottom:6px;"><i xid="i1" class="my2 my2-dengji btnclass" style="font-size:x-large;"></i></div>
   <div class="x-col bottom-line" xid="col2" style="padding-top:16px;padding-bottom:10px;"><span xid="span1" style="font-size:medium;"><![CDATA[代理等级]]></span></div>
   <div class="x-col bottom-line text-right" xid="col3" style="padding-top:18px;padding-right:28px;"><span xid="span2"><![CDATA[官方]]></span></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="padding:0px;">
   <div class="x-col x-col-fixed" xid="col17" style="width:40px;padding-left:10px;margin-top:12px;margin-bottom:6px;">
    <i xid="i8" class="my2 my2-set-automatic-upgrade btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col bottom-line" xid="col15" style="padding-top:16px;padding-bottom:10px;">
    <span xid="span10" style="font-size:medium;"><![CDATA[自动升级]]></span></div> 
   <div class="x-col bottom-line text-right" xid="col16" style="padding-top:18px;padding-right:28px;">
    <span component="$UI/system/components/justep/button/toggle" class="x-toggle" xid="toggle2" style="display: inline-block;padding:0px;" ON="自动" OFF="手动" onChange="toggle2Change"></span></div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row6" style="padding:0px;">
   <div class="x-col x-col-fixed" xid="col20" style="width:40px;padding-left:10px;margin-top:12px;margin-bottom:6px;">
    <i xid="i9" class="my2 my2-keshengji btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col bottom-line" xid="col18" style="padding-top:16px;padding-bottom:10px;">
    <span xid="span9" style="font-size:medium;"><![CDATA[可升级]]></span></div> 
   <div class="x-col bottom-line text-right" xid="col19" style="padding-top:18px;padding-right:10px;">
    <i xid="i10" class="linear linear-chevronright text-muted"></i></div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row7" style="padding:0px;background-color:#eee;margin-top:0px;">
   <div class="x-col x-col-fixed" xid="col22" style="width:40px;padding-left:10px;margin-top:12px;margin-bottom:6px;">
    </div> 
   <div class="x-col bottom-line" xid="col21" style="padding-top:16px;padding-bottom:10px;">
    <span xid="span11" class="text-muted"><![CDATA[自动升级：销售额达到可升级条件时，自动升级至更高一级代理，升级后，当季度不参与任务考核]]></span></div> 
   <div class="x-col x-col-fixed bottom-line text-right" xid="col23" style="padding-top:18px;padding-right:10px;width:20px;">
    <i xid="i12" class="linear linear-chevronright text-muted" style="display:none;"></i></div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="padding:0px;" bind-click="row2Click">
   <div class="x-col x-col-fixed" xid="col6" style="width:40px;padding-left:10px;margin-top:16px;margin-bottom:6px;">
    <i xid="i2" class="my2 my2-zhengshu  btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col bottom-line" xid="col4" style="padding-top:20px;padding-bottom:10px;">
    <span xid="span4" style="font-size:medium;"><![CDATA[授权证书]]></span></div> 
   <div class="x-col bottom-line text-right" xid="col5" style="padding-top:22px;padding-right:10px;">
    <i xid="i3" class="linear linear-chevronright text-muted"></i></div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding:0px;">
   <div class="x-col x-col-fixed" xid="col7" style="width:40px;padding-left:10px;margin-top:16px;margin-bottom:6px;">
    <i xid="i4" class="my2 my2-huokuanpipeidan  btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col bottom-line" xid="col8" style="padding-top:20px;padding-bottom:10px;">
    <span xid="span6" style="font-size:medium;"><![CDATA[货款]]></span></div> 
   <div class="x-col bottom-line text-right" xid="col9" style="padding-top:22px;padding-right:10px;">
    <span xid="span5"><![CDATA[￥0.00]]></span>
    <i xid="i5" class="linear linear-chevronright text-muted"></i></div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8" style="padding:0px;">
   <div class="x-col x-col-fixed" xid="col26" style="width:40px;padding-left:6px;margin-top:16px;margin-bottom:6px;">
    <i xid="i13" class="my2 my2-iconfontbao btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col bottom-line" xid="col24" style="padding-top:20px;padding-bottom:10px;">
    <span xid="span13" style="font-size:medium;"><![CDATA[控价保证金]]></span></div> 
   <div class="x-col bottom-line text-right" xid="col25" style="padding-top:22px;padding-right:28px;">
    <span xid="span12">￥0.00</span>
    <i xid="i14" class="linear linear-chevronright text-muted" style="display:none;"></i></div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="padding:0px;" bind-click="row4Click">
   <div class="x-col x-col-fixed" xid="col12" style="width:40px;padding-left:10px;margin-top:16px;margin-bottom:6px;">
    <i xid="i6" class="my2 my2-dianhua btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col bottom-line" xid="col10" style="padding-top:20px;padding-bottom:10px;">
    <span xid="span8" style="font-size:medium;"><![CDATA[联系方式]]></span></div> 
   <div class="x-col bottom-line text-right" xid="col11" style="padding-top:22px;padding-right:10px;">
    <span xid="span7"><![CDATA[15908775553]]></span>
    
  <i xid="i7" class="linear linear-chevronright text-muted"></i></div> 
  </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row9" style="padding:0px;">
   <div class="x-col x-col-fixed" xid="col27" style="width:40px;padding-left:10px;margin-top:12px;margin-bottom:6px;">
    <i xid="i15" class="my2 my2-xianshi btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col bottom-line" xid="col29" style="padding-top:16px;padding-bottom:10px;">
    <span xid="span14" style="font-size:medium;"><![CDATA[显示联系方式]]></span></div> 
   <div class="x-col bottom-line text-right" xid="col28" style="padding-top:18px;padding-right:28px;">
    <span component="$UI/system/components/justep/button/toggle" class="x-toggle" xid="toggle3" style="display: inline-block;padding:0px;" ON="显示" OFF="隐藏" onChange="toggle3Change"></span></div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row10" style="padding:0px;background-color:#eee;margin-top:0px;">
   <div class="x-col x-col-fixed" xid="col31" style="width:40px;padding-left:10px;margin-top:12px;margin-bottom:6px;"></div>
   <div class="x-col" xid="col32" style="padding-top:16px;padding-bottom:10px;">
    <span xid="span15" class="text-muted"><![CDATA[显示联系方式：你的直属代理和客户可以看到联系方式]]></span></div> 
   <div class="x-col x-col-fixed bottom-line text-right" xid="col30" style="padding-top:18px;padding-right:10px;width:20px;">
    <i xid="i16" class="linear linear-chevronright text-muted" style="display:none;"></i></div> </div></div></div>
  </div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon2/my2.icons"></require></resource></div>