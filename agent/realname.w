<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad" onunLoad="modelUnLoad"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="实名认证"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">实名认证</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/row/row" class="x-row text-center text-muted" xid="row1">
   <div class="x-col" xid="col1"><![CDATA[你上传的身份证信息我们只做代理授权时使用]]></div>
   </div>
  
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer2" style="background-color:white;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row4" style="padding:0px;padding-left:10px;padding-right:10px;">
   <div class="x-col x-col-fixed" xid="col2" style="width:60px;"><![CDATA[]]>
  <span xid="span1"><![CDATA[姓名]]></span></div>
   <div class="x-col" xid="col3"><input component="$UI/system/components/justep/input/input" class="form-control input-class" xid="nameinput"></input></div>
   </div><hr xid="hr1" style="margin:0px;margin-left:70px;border-top: 1px solid #f6f6f6;"></hr><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row5" style="padding:0px;padding-left:10px;padding-right:10px;">
   <div class="x-col x-col-fixed" xid="col6" style="width:60px;">
    <span xid="span2"><![CDATA[手机]]></span></div> 
   <div class="x-col" xid="col8">
    <input component="$UI/system/components/justep/input/input" class="form-control input-class" xid="phoneinput"></input></div> </div><hr xid="hr2" style="margin:0px;margin-left:70px;border-top: 1px solid #f6f6f6;"></hr><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row6" style="padding:0px;padding-left:10px;padding-right:10px;">
   <div class="x-col x-col-fixed" xid="col10" style="width:60px;">
    <span xid="span3"><![CDATA[验证码]]></span></div> 
   <div class="x-col" xid="col9">
    <input component="$UI/system/components/justep/input/input" class="form-control input-class" xid="vcodeinput"></input></div> 
  <div class="x-col x-col-fixed text-right" xid="col11" style="width:200px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default surebtn" label="获取验证码" xid="vcodebtn" onClick="vcodebtnClick">
   <i xid="i1"></i>
   <span xid="span4">获取验证码</span></a></div></div></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="adjustsummaryrow" style="margin-top:10px;display:none;">
   <div class="x-col" xid="col15"><span xid="adjustsummaryspan"></span></div>
   </div><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;margin-top:10px;"><div component="$UI/system/components/justep/row/row" class="x-row text-center" xid="row2">
   <div class="x-col" xid="col4"><span xid="idfrontspan" class="fileinput-button-front"><input type="file" value="" xid="idfrontinput" bind-change="idfrontinputChange"></input></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row text-center" xid="row3">
   <div class="x-col" xid="col7"><span xid="idbackspan" class="fileinput-button-back">
   <input type="file" value="" xid="idbackinput" bind-change="idbackinputChange"></input></span></div>
   </div>
  </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7" style="margin-top:10px;">
   <div class="x-col" xid="col12"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block surebtn" label="提交" xid="submitbtn" onClick="submitbtnClick">
   <i xid="i2"></i>
   <span xid="span5">提交</span></a></div>
   </div>
  </div>
  </div> 
</div>