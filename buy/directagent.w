<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onParamsReceive="modelParamsReceive"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="directagentData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
  <column name="nickname" type="String" xid="xid2"></column>
  <column name="headurl" type="String" xid="xid3"></column>
  <column name="name" type="String" xid="xid4"></column>
  <column name="agentlevel" type="String" xid="xid5"></column>
  <column name="phone" type="String" xid="xid6"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="agentuseridData" idColumn="agentuserid"><column name="agentuserid" type="String" xid="xid7"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="直属代理"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="color:#333333;font-weight:normal;">直属代理</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards  x-scroll-view" xid="content1" _xid="C87D14984D5000011EE315401BABB2A0"><div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
   <div class="x-content-center x-pull-down container" xid="div1">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"></i>
    <span class="x-pull-down-label" xid="span1">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div2" style="padding-top:10px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="directagentData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="background-color:white;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="agentlistrow" style="height:50px;" bind-css="val(&quot;id&quot;) ==  $model.agentuseridData.val(&quot;agentuserid&quot;) ? 'isselect' : '{}'" bind-click="agentlistrowClick">
   <div class="x-col x-col-fixed" xid="col1" style="width:50px;"><img src=" " alt="" xid="image1" bind-attr-src=' val("headurl")' style="width:40px;border-radius:50%;"></img></div>
   <div class="x-col" xid="col2"><span xid="span3" bind-text='val("name")'></span></div>
   <div class="x-col text-right" xid="col3"><span xid="span4" bind-text='val("agentlevel")'></span></div></div>
  <hr xid="hr1" style="margin:0px;margin-left:0px;border-top: 1px solid #f6f6f6;"></hr></li></ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div3">
    <span class="x-pull-up-label" xid="span2">加载更多...</span></div> </div>
  </div>
  </div> 
</div>