<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="注册"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">注册</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1">
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center row-class" xid="row1">
   <div class="x-col x-col-fixed" xid="col1" style="width:60px;"><span xid="span1"><![CDATA[手机]]></span></div>
   <div class="x-col" xid="col2"><input component="$UI/system/components/justep/input/input" class="form-control input-class" xid="input1" dataType="String" pattern="[0-9]*"></input></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center row-class" xid="row2" style="margin-top:5px;">
   <div class="x-col x-col-fixed" xid="col5" style="width:60px;">
    <span xid="span2"><![CDATA[验证码]]></span></div> 
   <div class="x-col" xid="col4">
    <input component="$UI/system/components/justep/input/input" class="form-control input-class" xid="input2" pattern="[0-9]*"></input></div> </div></div></div>
  </div> 
</div>