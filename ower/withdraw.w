<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="提现"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">提现</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="padding-top:50px;background-color:white;height:220px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col text-center" xid="col1"><span xid="span1" style=";font-size:large;"><![CDATA[可提现额(元)]]></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col text-center" xid="col4">
    <span xid="span2" style="font-size:40px;"><![CDATA[0.00]]></span></div> </div>
  <hr xid="hr3" style="margin:0px;margin-left:0px;border-top: 1px solid #f6f6f6;"></hr><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row6">
   <div class="x-col x-col-fixed" xid="col12" style="width:50px;"><span xid="span6"><![CDATA[提现]]></span></div>
   <div class="x-col" xid="col13"><input component="$UI/system/components/justep/input/input" class="form-control input-class" xid="withdrawinput"></input></div>
   </div>
  </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding-left:20px;">
   <div class="x-col" xid="col5"><span xid="span3" class="text-muted"><![CDATA[最低提现额度：1元]]></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="padding-left:20px;">
   <div class="x-col" xid="col8">
    <span xid="span4" class="text-muted"><![CDATA[每日最高提现额度：5000元]]></span></div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="margin-top:100px;">
   <div class="x-col" xid="col9"><a component="$UI/system/components/justep/button/button" class="btn btn-success btn-block" label="提现至微信" xid="button1">
   <i xid="i1"></i>
   <span xid="span5">提现至微信</span></a></div>
   </div></div>
  </div> 
</div>