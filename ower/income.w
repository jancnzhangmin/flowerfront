<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="enaccountData" idColumn="id" confirmRefresh="false"><column name="id" type="String" xid="xid1"></column>
  <column name="amount" type="String" xid="xid2"></column>
  <column name="summary" type="String" xid="xid3"></column>
  <column name="created_at" type="String" xid="xid4"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="收益"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">收益</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col text-center" xid="col1"><i xid="i1" class="my my-shouyi1 gradient" style="font-size:x-large;display:none;"></i>
  <span xid="span1" class="gradient" style="font-size:xx-large;"><![CDATA[￥0.00]]></span>
  <span xid="span2" class="gradient" style="font-size:large;"><![CDATA[元]]></span></div>
   </div></div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer  x-scroll-view" xid="smartContainer2" style="padding-top:80px;height:100%;">
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1" onPullDown="scrollView1PullDown" onPullUp="scrollView1PullUp">
   <div class="x-content-center x-pull-down container" xid="div1">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i2"></i>
    <span class="x-pull-down-label" xid="span3">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div2"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="enaccountData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row2" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col4"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col7"><span xid="span5" bind-text='val("summary")'></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col10"><span xid="span6" bind-text='val("created_at")' class="text-muted"></span></div>
   </div></div>
   <div class="x-col x-col-33 text-right" xid="col5"><span xid="span7" bind-text='val("amount")' style="font-size:large;color:#ff4256;"></span></div>
   </div>
  <hr xid="hr3" style="margin:0px;margin-left:0px;border-top: 1px solid #f6f6f6;"></hr></li></ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div3">
    <span class="x-pull-up-label" xid="span4">加载更多...</span></div> </div>
  </div></div>
  </div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon2/my2.icons"></require>
  <require xid="require2" url="css!$UI/flowerfront/icon/my.icons"></require></resource></div>