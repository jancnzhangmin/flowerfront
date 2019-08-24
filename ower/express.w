<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onParamsReceive="modelParamsReceive"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="expressData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
  <column name="message" type="String" xid="xid2"></column>
  <column name="nu" type="String" xid="xid3"></column>
  <column name="state" type="String" xid="xid4"></column>
  <column name="name" type="String" xid="xid9"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="detailData" idColumn="id"><column name="id" type="String" xid="xid5"></column>
  <column name="express_id" type="String" xid="xid6"></column>
  <column name="ftime" type="String" xid="xid7"></column>
  <column name="context" type="String" xid="xid8"></column>
  <column name="ffirst" type="String" xid="xid10"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="快递信息"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">快递信息</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="expressData">
   <ul class="x-list-template" xid="listTemplateUl1" style="padding:5px;">
    <div xid="div1" style="background-color:white;border-radius:5px;"><ul xid="ul1" style="padding-top:10px;padding-left:30px;"><li xid="li2" style="font-size:medium;color:#555;padding-right:20px;"><span xid="span1" bind-text='val("name")'></span>
  <span xid="span14" bind-text='val("nu")' style="margin-left:5px;"></span>
  <span xid="span4" class="pull-right" bind-text='val("state")'></span></li></ul>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="detailData" filter=' $row.val("express_id") == val("id")'>
   <ul class="x-list-template track-list" xid="listTemplateUl2" style="padding-bottom:10px;">
    <ul xid="ul2"><li xid="li4" bind-css=" val(&quot;ffirst&quot;) == 1 ? 'first' : ''"><i xid="i1" class="dataControl dataControl-oc node-icon"></i>
  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="padding:2px;padding-right:0px;">
   <div class="x-col" xid="col1"><span xid="span2" class="time" bind-text='val("ftime")'></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="padding:2px;padding-right:0px;">
   <div class="x-col" xid="col4">
    <span xid="span3" class="txt" bind-text='val("context")'></span></div> </div></li></ul></ul> </div></div></ul> 
  </div></div>
  </div> 
</div>