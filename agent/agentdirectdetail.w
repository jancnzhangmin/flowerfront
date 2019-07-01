<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onParamsReceive="modelParamsReceive" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="examinationData" idColumn="examination"><column name="examination" type="String" xid="xid1"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" style="background-color:white;" xid="titlebar1">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;"></div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row1" bind-click="row1Click">
   <div class="x-col x-col-fixed" xid="col1" style="width:50px;"><img src=" " alt="" xid="image1" style="width:40px;border-radius:50%;"></img></div>
   <div class="x-col" xid="col2"><span xid="span1"><![CDATA[代理等级]]></span></div>
   <div class="x-col text-right" xid="col3"><span xid="span2"></span></div>
  <div class="x-col x-col-fixed text-right" xid="col4" style="width:25px;"><i xid="i1" class="linear linear-chevronright text-muted"></i></div></div>
  <hr xid="hr1" style="margin:0px;margin-left:55px;border-top: 1px solid #f6f6f6;"></hr><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row4" style="height:50px;">
   <div class="x-col x-col-fixed" xid="col14" style="width:50px;"></div>
   <div class="x-col" xid="col16">
    <span xid="span8"><![CDATA[上季度代理等级]]></span></div> 
   <div class="x-col text-right" xid="col15">
    <span xid="span7"></span></div> 
   <div class="x-col x-col-fixed text-right" xid="col13" style="width:25px;">
    </div> </div><hr xid="hr3" style="margin:0px;margin-left:55px;border-top: 1px solid #f6f6f6;"></hr><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row2" style="height:50px;">
   <div class="x-col x-col-fixed" xid="col8" style="width:50px;">
    </div> 
   <div class="x-col" xid="col6">
    <span xid="span4"><![CDATA[货款]]></span></div> 
   <div class="x-col text-right" xid="col7">
    <span xid="span3"></span></div> 
   <div class="x-col x-col-fixed text-right" xid="col5" style="width:25px;">
    <i xid="i2" class="linear linear-chevronright text-muted"></i></div> </div>
  <hr xid="hr2" style="margin:0px;margin-left:55px;border-top: 1px solid #f6f6f6;"></hr>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row3" style="height:50px;">
   <div class="x-col x-col-fixed" xid="col9" style="width:50px;"></div>
   <div class="x-col" xid="col10">
    <span xid="span6"><![CDATA[已完成任务]]></span></div> 
   <div class="x-col text-right" xid="col11">
    <span xid="span5"></span></div> 
   <div class="x-col x-col-fixed text-right" xid="col12" style="width:25px;">
    </div> </div>
  <hr xid="hr4" style="margin:0px;margin-left:55px;border-top: 1px solid #f6f6f6;"></hr>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row5" style="height:50px;">
   <div class="x-col x-col-fixed" xid="col18" style="width:50px;"></div>
   <div class="x-col" xid="col20">
    <span xid="span10"><![CDATA[任务额度]]></span></div> 
   <div class="x-col text-right" xid="col19">
    <span xid="span9"></span></div> 
   <div class="x-col x-col-fixed text-right" xid="col17" style="width:25px;">
    </div> </div>
  <hr xid="hr5" style="margin:0px;margin-left:55px;border-top: 1px solid #f6f6f6;"></hr>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row6" style="height:50px;">
   <div class="x-col x-col-fixed" xid="col21" style="width:50px;"></div>
   <div class="x-col" xid="col23">
    <span xid="span12"><![CDATA[季度考核]]></span></div> 
   <div class="x-col text-right" xid="col24" style="padding-top:15px;">
    <span component="$UI/system/components/justep/button/toggle" class="x-toggle" xid="toggle3" style="display: inline-block;padding:0px;" ON="考核" OFF="取消" onChange="toggle3Change" bind-checked=' $model.examinationData.val("examination")'></span></div> 
   <div class="x-col x-col-fixed text-right" xid="col22" style="width:25px;">
    </div> </div></div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer2" style="margin-top:10px;"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified x-flower" tabbed="true" xid="buttonGroup1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="button1" target="content2" onClick="button1Click">
    <i xid="i7"></i>
    <span xid="span13"></span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="button2" target="content3" onClick="button2Click">
    <i xid="i8"></i>
    <span xid="span14"></span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="button3" target="content4" onClick="button3Click">
   <i xid="i9"></i>
   <span xid="span15"></span></a></div><div component="$UI/system/components/justep/contents/contents" class="x-contents" active="0" xid="contents1" style="height:300px;" swipe="false">
   <div class="x-contents-content" xid="content2"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer1"></div></div>
  <div class="x-contents-content" xid="content3"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer2"></div></div>
  <div class="x-contents-content" xid="content4"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer3"></div></div></div></div></div>
  </div> 
<span component="$UI/system/components/justep/messageDialog/messageDialog" xid="messageDialog1" type="YesNo" onNo="messageDialog1No"></span></div>