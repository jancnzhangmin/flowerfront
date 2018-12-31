<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad" onParamsReceive="modelParamsReceive"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="receiptData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
  <column name="contact" type="String" xid="xid2"></column>
  <column name="contactphone" type="String" xid="xid3"></column>
  <column name="province" type="String" xid="xid4"></column>
  <column name="city" type="String" xid="xid5"></column>
  <column name="district" type="String" xid="xid6"></column>
  <column name="street" type="String" xid="xid7"></column>
  <column name="isdefault" type="String" xid="xid8"></column>
  <column name="adcode" type="String" xid="xid9"></column>
  <column name="address" type="String" xid="xid10"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="我的收货地址"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">我的收货地址</div>  
          <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="添加新地址" xid="addbtn" style="color:#333333;" onClick="addbtnClick">
   <i xid="i1"></i>
   <span xid="span1" style="font-size:16px;">添加新地址</span></a></div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="receiptData" style="background-color:white;">
   <ul class="x-list-template" xid="listTemplateUl1" style="padding-top:15px;padding-bottom:15px;">
    <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row1">
   <div class="x-col x-col-fixed text-center" xid="col1" style="width:50px;" bind-click="col1Click"><div xid="div1" class="firstname"><span xid="span2" bind-text=' val("contact").substr(0,1)' style="font-size:large;"><![CDATA[张]]></span></div></div>
   <div class="x-col" xid="col2" bind-click="col1Click"><div xid="div2"><span xid="span3" bind-text='val("contact")' style="font-size:large;"></span>
  <span xid="span4" bind-text='val("contactphone")' class="text-muted" style="margin-left:10px;"></span></div>
  <div xid="div3"><span xid="span5" style="background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;font-size:small;" bind-visible=' val("isdefault") == 1'><![CDATA[默认]]></span>
  <span xid="span6" bind-text='val("province")'></span>
  <span xid="span7" bind-text='val("city")'></span>
  <span xid="span8" bind-text='val("district")'></span>
  <span xid="span9" bind-text='val("street")'></span>
  <span xid="span10" bind-text='val("address")'></span></div></div>
   <div class="x-col x-col-fixed text-right" xid="col3" style="width:1px;padding-top:18px;"><label xid="label2" style="height:30px;border-right-style:solid;border-right-width:1px;border-right-color:#f6f6f6;"></label>
  </div>
  <div class="x-col x-col-fixed" xid="col4" style="width:60px;padding-left:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="编辑" xid="editbtn" onClick="editbtnClick">
   <i xid="i2"></i>
   <span xid="span11" class="text-muted">编辑</span></a></div></div></ul> 
  </div></div>
  </div> 
<div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer1"></div></div>