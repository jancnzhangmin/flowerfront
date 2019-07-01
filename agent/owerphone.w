<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onParamsReceive="modelParamsReceive"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="联系方式"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">联系方式</div>  
          <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="保存" xid="savebtn" style="color:#ff4665;" onClick="savebtnClick">
   <i xid="i1"></i>
   <span xid="span1" style="font-size:16px;">保存</span></a></div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;padding-top:20px;height:100px;"><div component="$UI/system/components/justep/row/row" class="x-row row-class" xid="row1">
   <div class="x-col" xid="col1">
    <input component="$UI/system/components/justep/input/input" class="form-control input-class" xid="input1" placeHolder="联系方式" style="font-size:medium;"></input></div> </div></div></div>
  </div> 
</div>